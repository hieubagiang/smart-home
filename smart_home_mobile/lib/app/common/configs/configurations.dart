import 'dart:convert';

import 'package:get/get.dart';

import 'default_env.dart';
import 'env.dart';


class Configurations {
  static EnvConfig _environment = DefaultConfig();
  static const int connectTimeout = 30000;
  static const int responseTimeout = 30000;
  static const String contentType = 'application/json; charset=utf-8';
  static const String authentication = 'Authorization';
  static const String facebookApi = 'https://graph.facebook.com/';
  static const String facebookImage =
      'https://graph.facebook.com/v9.0/%s/picture';

  static String _host = _environment.getHost();
  static String _baseImageUrl = _environment.getBaseImageUrl();
  static String _productImageUrl = _environment.getProductImageUrl();
  static int _splashScreenSecondTimeOut =
      _environment.getSplashScreenSecondTimeOut();
  static String _basicAuth = _environment.getBasicAuth();
  static String _bearerAuth = _environment.getBearerAuth();
  static String _deepLinksIos = _environment.getDeepLinksIos();
  static String _deepLinksAndroid = _environment.getDeepLinksAndroid();
  static String _googleMapApiKey = _environment.getGoogleMapApiKey();
  static String _productHost = _environment.getProductHost();
  static String _iosAppId = _environment.getIosAppId();
  static String _androidAppId = _environment.getAndroidAppId();

  static String get host => _host;

  static String get baseImageUrl => _baseImageUrl;

  static String get productImageUrl => _productImageUrl;

  static int get splashScreenSecondTimeOut => _splashScreenSecondTimeOut;

  static EnvConfig get environment => _environment;

  static String get basicAuth =>
      'Basic ' + base64Encode(utf8.encode('$_basicAuth:$_basicAuth'));

  static String getBearerAuth(String token) {
    return '$_bearerAuth $token';
  }

  static String get googleMapApiKey => _googleMapApiKey;

  static String get deepLinksIos => _deepLinksIos;

  static String get deepLinksAndroid => _deepLinksAndroid;

  static String get productHost => _productHost;
  static String get androidAppId => _androidAppId;
  static String get iosAppId => _iosAppId;

  static String get linkShareIos =>
      'https://apps.apple.com/us/app/id$_iosAppId';

  static String get linkShareAndroid =>
      'https://play.google.com/store/apps/details?id=$_androidAppId';

  static String getDeepLinks({required String params}) {
    return GetPlatform.isAndroid
        ? '$_deepLinksAndroid$params'
        : '$_deepLinksIos$params';
  }
}
