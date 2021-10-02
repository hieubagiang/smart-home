import 'package:flutter/cupertino.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:smart_home_mobile/app/common/base/base_controller.dart';
import 'package:smart_home_mobile/app/domain/requests/login_request.dart';
import 'package:smart_home_mobile/app/presentation/routes/app_pages.dart';

class LoginController extends BaseController {
  String url = "https://api.iot.puyinfotech.com/api/user/login";

  final formKey = GlobalKey<FormState>();

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
    RequiredValidator(errorText: "This field is Required*"),
    EmailValidator(errorText: "Please Enter a Valid Email")
  ]);
  final passwordValidator = MultiValidator([
    RequiredValidator(errorText: 'Password is Required*'),
    MinLengthValidator(8, errorText: 'Password must be at least 8 digits long'),
    PatternValidator(r'(?=.*?[#?!@$%^&*-])',
        errorText: 'Password must have at least one special character')
  ]);

  void onLogin() {}

  void onTap() {
    if (formKey.currentState!.validate()) {
      this.visible.value = !this.visible.value;
      isValidated = RxBool(false);
      email = controllerEmail.text;
      password = controllerPassword.text;
      this.visible.value = !this.visible.value;
    }
    Get.offAndToNamed(Routes.HOME_PAGE);
    //LoginRequest loginRequest = LoginRequest(email: email, password: password);

    /*
      Auth auth = Auth(
          context: context,
          logindetails: logindetails);
      auth
          .loginAPI()
          .whenComplete(() => remove());*/
    /*} else {
      setState(() {
        isValidated = false;
      });
    }*/
  }
}
