import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_home_mobile/app/common/utils/styles.dart';
import 'package:smart_home_mobile/app/common/utils/utils.dart';
import 'package:smart_home_mobile/app/presentation/widgets/dialogs_widget/custom_alert_dialog_widget.dart';
import 'package:smart_home_mobile/app/presentation/widgets/dialogs_widget/custom_cupertion_action_sheet_widget.dart';

import 'base_controller.dart';

class BaseCommonWidgets implements _CommonWidgetsInterface {
  @override
  void hideDialog() {
    if (Get.isDialogOpen ?? false) Get.back();
  }

  @override
  void showLoadingDialog() {
    Get.dialog(
        Material(
          color: Colors.black26,
          child: Center(
            child: Container(
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0)),
                child: CircularProgressIndicator(
                  color: ColorUtils.primaryColor,
                )),
          ),
        ),
        barrierDismissible: false,
        name: "Loading Dialog");
  }

  //EXAMPLE
  @override
  void showDialogMessage(String message, Function? onClick) {
    if (message.isEmpty) return;
    hideDialog();
    // set up the button
    Widget okButton = IntrinsicHeight(
      child: TextButton(
        child: Text(
          "ok".tr.toUpperCase(),
          style:
              StyleUtils.style16Medium.copyWith(color: ColorUtils.primaryColor),
        ),
        onPressed: () {
          Get.back();
          if (onClick != null) {
            onClick();
          }
        },
      ),
    );

    Dialog customDialog = Dialog(
      backgroundColor: ColorUtils.whiteColor,
      // your color
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(SpaceUtils.spaceMedium)),
      // change 40 to your desired radius
      child: CustomAlertDialog(
        message: message,
        rightActionWidget: okButton,
      ),
    );
    // show the dialog
    if (Get.context != null) {
      showDialog(
        context: Get.context!,
        builder: (BuildContext context) {
          return WillPopScope(
              onWillPop: () {
                return Future.value(false);
              },
              child: customDialog);
        },
      );
    }
  }

  @override
  void showBottomDialog(
      {String? title,
      String? message,
      List<Widget>? actions,
      Widget? cancelButton}) {
    showCupertinoModalPopup(
        context: Get.context!,
        builder: (BuildContext context) => CustomBottomDialog(
              title: title,
              message: message,
              actions: actions,
              cancelButton: cancelButton,
            ));
  }

  @override
  void showConfirmDialog(String message, Function onConfirm) {
    Widget confirmWidget = TextButton(
      child: Text(
        "ok".tr.toUpperCase(),
        style: StyleUtils.style16Medium
            .copyWith(color: ColorUtils.dialogButtonColor),
      ),
      onPressed: () {
        Get.back();
        onConfirm();
      },
    );
    Widget cancelWidget = TextButton(
      child: Text(
        "cancel".tr.toUpperCase(),
        style: StyleUtils.style16Medium
            .copyWith(color: ColorUtils.dialogButtonColor),
      ),
      onPressed: () {
        Get.back();
      },
    );
    Dialog customDialog = Dialog(
      backgroundColor: ColorUtils.whiteColor,
      // your color
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(SpaceUtils.spaceMedium)),
      // change 40 to your desired radius
      child: CustomAlertDialog(
        message: message,
        leftActionWidget: cancelWidget,
        rightActionWidget: confirmWidget,
      ),
    );
    // show the dialog
    if (Get.context != null) {
      showDialog(
        context: Get.context!,
        builder: (BuildContext context) {
          return WillPopScope(
              onWillPop: () {
                return Future.value(false);
              },
              child: customDialog);
        },
      );
    }
  }
}

abstract class _CommonWidgetsInterface {
  void showLoadingDialog();

  void hideDialog();

  void showDialogMessage(String message, Function onClick);

  void showConfirmDialog(String message, Function onConfirm);

  void showBottomDialog();
}
