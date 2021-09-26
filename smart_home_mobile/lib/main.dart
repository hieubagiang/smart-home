/// Generated by Flutter GetX Starter on 2021-09-25 17:40
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:smart_home_mobile/app/common/helper/mqtt_helper.dart';
import 'package:smart_home_mobile/app/presentation/routes/app_pages.dart';

void main() {
  MQTTHelper().initialize();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: Routes.HOME_PAGE,
      getPages: AppPages.pages,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
