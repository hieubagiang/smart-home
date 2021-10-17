import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_home/app/common/constants/colors_constant.dart';
import 'package:smart_home/app/common/constants/layout_constant.dart';
import 'package:smart_home/app/common/utils/utils.dart';
import 'package:smart_home/app/presentation/journey/main/controller/main_controller.dart';

import '../main_screen_constants.dart';

class BottomTabMain extends GetWidget<MainController> {
  final _bottomShadows = BoxShadow(
      color: ColorUtils.primaryColor, blurRadius: 10, offset: Offset(0.0, 3.0));

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
              top: BorderSide(
                color: ColorUtils.thirdColor,
              ))),
      padding: EdgeInsets.symmetric(
          vertical: SpaceUtils.spaceSmall, horizontal: SpaceUtils.spaceMedium),
      child: Obx(() =>
          BottomNavigationBar(
            showUnselectedLabels: true,
            showSelectedLabels: true,
            type: BottomNavigationBarType.fixed,
            onTap: controller.handleIndexChanged,
            currentIndex: controller.selectedIndex.value,
            backgroundColor: ColorUtils.transparent,
            elevation: 0,
            unselectedItemColor: ColorUtils.thirdColor,
            selectedItemColor: ColorUtils.primaryColor,
            selectedLabelStyle: StyleUtils.style12Bold,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'home'.tr,
              ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.schedule),
                  label: 'schedule'.tr,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.notifications),
                  label: 'notifications'.tr,
                ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'settings'.tr
              ),
            ],
          )),
    );
  }
}
