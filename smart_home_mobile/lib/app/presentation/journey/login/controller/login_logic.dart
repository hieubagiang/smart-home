import 'package:flutter/cupertino.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:smart_home/app/common/base/base_controller.dart';
import 'package:smart_home/app/common/helper/storage_helper.dart';
import 'package:smart_home/app/domain/entities/authentication/login_entity.dart';
import 'package:smart_home/app/domain/requests/login_request.dart';
import 'package:smart_home/app/domain/usecases/authentication_use_case_impl.dart';
import 'package:smart_home/app/presentation/routes/app_pages.dart';

class LoginController extends BaseController {
  final useCase = Get.find<LoginUseCaseImpl>();
  final formKey = GlobalKey<FormState>();
  RxBool autoValidate = RxBool(false);

  bool get validateAndSave {
    final form = formKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    autoValidate = RxBool(true);
    return false;
  }

  // late final SharedPreferences preferences;

  String? email, password;
  Rx<bool> isObscure = RxBool(true);
  final FocusNode focusNode = FocusNode();
  Rx<bool> visible = RxBool(true);

  //Controllers

  final TextEditingController controllerPassword = TextEditingController();
  final TextEditingController controllerEmail = TextEditingController();
  Rx<bool> isValidated = RxBool(true);

  //Validators
  final emailValidator = MultiValidator([
    RequiredValidator(errorText: "email_is_required".tr),
    EmailValidator(errorText: "email_is_required".tr)
  ]);
  final passwordValidator = MultiValidator([
    RequiredValidator(errorText: 'password_is_required'.tr),
    MinLengthValidator(
        8, errorText: 'password_must_be_at_least_8_digits_long'.tr),
    // PatternValidator(r'(?=.*?[#?!@$%^&*-])',
    //     errorText: 'Password must have at least one special character')
  ]);

  Future<void> onReady  () async {
    controllerEmail.text = await useCase.getSavedLoginId()??'';
  }

  Future<void> onTap() async {
    if (validateAndSave) {
      this.visible.value = !this.visible.value;
      isValidated = RxBool(false);
      email = controllerEmail.text;
      password = controllerPassword.text;
      this.visible.value = !this.visible.value;
      //Get.offAndToNamed(Routes.HOME_PAGE);
      LoginRequest request = LoginRequest(
          email: controllerEmail.text, password: controllerPassword.text);
      showLoadingDialog();
      LoginEntity loginEntity = await useCase.login(request);
      hideDialog();
      StorageHelper.setDataUser(loginEntity.toModel());
      StorageHelper.setLoginId(controllerEmail.text);

      Get.offAndToNamed(RouteList.MAIN);
  }
  }

}
