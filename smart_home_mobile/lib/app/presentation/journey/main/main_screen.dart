import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_home/app/common/base/base_view_view_model.dart';
import 'package:smart_home/app/presentation/journey/home_module/home_page.dart';
import 'package:smart_home/app/presentation/journey/main/widgets/bottom_tab.dart';
import 'package:smart_home/app/presentation/journey/profile/profile_screen.dart';

import 'controller/main_controller.dart';

class MainScreen extends BaseView<MainController> {
  @override
  Widget vBuilder(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: BottomTabMain(),
        body: Obx(() => IndexedStack(
              index: controller.selectedIndex.value,
              children: [
                HomePage(),
                Text('1'),
                Text('1'),
                ProfileScreen()
              ],
            )));
  }
}
