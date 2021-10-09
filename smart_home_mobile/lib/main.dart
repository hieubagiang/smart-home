/// Generated by Flutter GetX Starter on 2021-09-25 17:40
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get_storage/get_storage.dart';
import 'package:smart_home_mobile/app/common/base/base_view_view_model.dart';
import 'package:smart_home_mobile/app/common/helper/storage_helper.dart';
import 'package:smart_home_mobile/app/data/models/authentication/login_model.dart';
import 'package:smart_home_mobile/app/presentation/journey/app/app_binding.dart';
import 'package:smart_home_mobile/app/presentation/routes/app_pages.dart';
import 'package:smart_home_mobile/app/presentation/translations/translation.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init(); //Init Storage
  LoginModel? data = await StorageHelper.getDataUser();
  print(data);
  runApp(DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) => MyApp(
      isInitLogin: data == null, // Wrap your app
    ),
  ));
}

class MyApp extends StatelessWidget {
  final bool isInitLogin;

  const MyApp({Key? key, required this.isInitLogin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      builder: () {
        return GetMaterialApp(
          initialRoute: isInitLogin ? Routes.LOGIN : Routes.HOME_PAGE,
          initialBinding: AppBinding(),
          getPages: AppPages.pages,
          translations: MyTranslations(),
          locale: MyTranslations.locale,
          fallbackLocale: MyTranslations.fallbackLocale,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: MyTranslations.locales,
        );
      },
    );
  }
}

//STEP2: Add this function in main function in main.dart file and add incoming data to the stream
