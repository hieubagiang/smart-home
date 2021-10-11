import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_home/app/common/base/base_view_view_model.dart';
import 'package:smart_home/app/common/constants/colors_constant.dart';
import 'package:smart_home/app/common/constants/image_constants.dart';
import 'package:smart_home/app/common/constants/layout_constant.dart';
import 'package:smart_home/app/common/utils/styles.dart';
import 'package:smart_home/app/presentation/widgets/textfields.dart';

import 'controller/login_logic.dart';

class LoginPage extends BaseView<LoginController> {
  @override
  Widget vBuilder(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: ColorUtils.secondaryColor,
        body: Container(
          child: Column(
            children: [
              SizedBox(
                height: SpaceUtils.spaceLarge,
              ),
              Container(
                child: Image.asset(ImageConstants.loginBackgroundImage),
              ),
              _buildLoginForm(),
              SizedBox(
                height: SpaceUtils.spaceMedium,
              ),
              //_buildFooter(),
            ],
          ),
        ),
      ),
    );
  }

  Expanded _buildFooter() {
    return Expanded(
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(children: [
          TextSpan(
            text: "dont_have_an_account".tr,
            style: StyleUtils.style12Thin,
          ),
          WidgetSpan(
              child: GestureDetector(
                child: Text(
                  ' ' + 'sign_up'.tr,
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w600,
                    // fontSize: 15.0,
                    color: Color(0xff6742be),
                  ),
                ),
                onTap: () {
                  /* Get.to(PageTransition(
                              duration: Duration(milliseconds: 800),
                              type: PageTransitionType.fade,
                              child: NewSignUpScreen());
                          Navigator.of(context).push(PageTransition(
                              duration: Duration(milliseconds: 800),
                              type: PageTransitionType.fade,
                              child: NewSignUpScreen()));*/
                },
              ))
        ]),
      ),
    );
  }

  AnimatedContainer _buildLoginForm() {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(BorderUtils.borderRadius),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 10,
                spreadRadius: 5)
          ]),
      height: controller.isValidated.value ? Get.height * 0.43 : Get.height *
          0.43,
      width: Get.width,
      margin:
      EdgeInsets.symmetric(horizontal: SpaceUtils.spaceMediumLarge),
      child: Obx(() {
        return Form(
            key: controller.formKey,
            autovalidateMode: (controller.autoValidate.value)
                ? AutovalidateMode.onUserInteraction
                : AutovalidateMode.disabled,

            child: Column(
              children: [
                _buildLoginTitle(),
                _buidLoginDivider(),
                Padding(
                  padding:
                  EdgeInsets.symmetric(horizontal: SpaceUtils.spaceMedium),
                  child: Column(
                    children: [
                      _buildEmailField(),
                      _buildPasswordField(),
                      _buildLoginButton(),
                    ],
                  ),
                ),
              ],
            ));
      }),
    );
  }

  GestureDetector _buildLoginButton() {
    return GestureDetector(
        child: Container(
          margin: EdgeInsets.only(top: SpaceUtils.spaceMedium),
          // height: 40.0,
          // height: HeightUtils.heightButtonSmall,
          // width: 120.0,
          padding: EdgeInsets.symmetric(vertical: SpaceUtils.spaceSmall * 1.5),
          width: Get.width * 0.40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(BorderUtils.borderRadius),
              gradient: LinearGradient(
                  colors: <Color>[Color(0xff7f29a5), Color(0xff6742be)])
            // Decorate here
          ),
          child: Center(
            child: Visibility(
                visible: controller.visible.value,
                child: Text(
                  "login".tr,
                  style: StyleUtils.style16Medium.copyWith(
                      color: ColorUtils.whiteColor),
                ),
                replacement: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 17,
                      height: 17,
                      child: CircularProgressIndicator(
                        color: ColorUtils.secondaryColor,
                        strokeWidth: 2,
                      ),
                    ),
                    Text(
                      " Login",
                      style: TextStyle(
                          letterSpacing: 2,
                          fontSize: 18,
                          fontFamily: "Poppins",
                          color: Color(0xffc8bce3)),
                    ),
                  ],
                )),
          ),
        ),
        onTap:
        controller.onTap
    );
  }

  Padding _buildPasswordField() {
    return Padding(
        padding: EdgeInsets.only(top: SpaceUtils.spaceMedium),
        child: TextFields(
          focusNode: controller.focusNode,
          validate: controller.passwordValidator,
          controller: controller.controllerPassword,
          hintText: "password_hint".tr,
          icon: Icons.lock_outlined,
          suffixIcon: IconButton(
              color: Colors.grey,
              icon: Icon(controller.isObscure.value
                  ? Icons.visibility_off
                  : Icons.visibility),
              onPressed: () {
                controller.focusNode.unfocus();
                controller.focusNode.canRequestFocus = false;
                controller.isObscure.value = !controller.isObscure.value;
              }),
          secure: controller.isObscure.value,
          isSignupfield: false,
        ));
  }

  Padding _buildEmailField() {
    return Padding(
        padding: EdgeInsets.only(top: SpaceUtils.spaceMediumLarge),
        child: TextFields(
          validate: controller.emailValidator,
          controller: controller.controllerEmail,
          hintText: "email_hint".tr,
          icon: Icons.email_outlined,
          isSignupfield: false,
        ));
  }

  Container _buidLoginDivider() {
    return Container(
      margin: EdgeInsets.only(top: 5.0),
      // height: 3,
      height: 3.h,
      width: 50.w,
      color: Colors.indigoAccent[200],
    );
  }

  Padding _buildLoginTitle() {
    return Padding(
      padding: EdgeInsets.only(top: SpaceUtils.spaceMedium),
      child: Text(
        "welcome".tr,
        style: StyleUtils.style36Bold.copyWith(color: ColorUtils.primaryColor),
      ),
    );
  }
}
