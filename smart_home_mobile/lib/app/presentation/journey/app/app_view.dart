import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:smart_home/app/common/base/base_view_view_model.dart';
import 'package:smart_home/app/presentation/routes/app_pages.dart';
import 'package:smart_home/app/presentation/translations/translation.dart';

import 'app_logic.dart';

class RootScreen extends BaseView<AppController> {
  final Widget child;

  RootScreen(this.child);

  @override
  Widget vBuilder(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      builder: () {
        return GetMaterialApp(
            initialRoute: Routes.LOGIN,
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
            supportedLocales: MyTranslations.locales);
      },
    );
  }
}
