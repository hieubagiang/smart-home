
import 'package:smart_home/app/common/configs/env.dart';


class StageConfig extends EnvConfig {
  final _splashScreenSecondTimeOut = 2;
  final _host = 'https://iphui-stg.acaziasoft.com/';
  final _baseImageUrl = 'statics/';
  final _productImageUrl = 'https://youngkidsfc.com/statics/';
  final _environment = 'stage';
  final _basicAuth = 'anonymous';
  final _bearerAuth = 'Bearer';
  final _firebaseServerAuth = 'server';
  final _googleMapApiKey = 'AIzaSyDdM0cR-vVDPjT0rWs6HdHBfbokSOcRz6Q';
  final _productHost = 'https://youngkidsfc.com/v1/api/public/';

  @override
  String getBaseImageUrl() {
    return _host + _baseImageUrl;
  }

  @override
  String getEnvironment() {
    return _environment;
  }

  @override
  String getHost() {
    return _host;
  }

  @override
  String getBasicAuth() {
    return _basicAuth;
  }

  @override
  String getBearerAuth() {
    return _bearerAuth;
  }

  @override
  String getGoogleMapApiKey() {
    return _googleMapApiKey;
  }

  @override
  String getProductImageUrl() {
    return _productImageUrl;
  }

  @override
  int getSplashScreenSecondTimeOut() {
    return _splashScreenSecondTimeOut;
  }

  @override
  String getDeepLinksAndroid() {
    return 'https://football-applink.acaziasoft.com';
  }

  @override
  String getDeepLinksIos() {
    return 'app://football-applink.acaziasoft.com';
  }

  @override
  String getProductHost() {
    return _productHost;
  }

  @override
  String getAndroidAppId() {
    return 'com.acaziasoft.phuiplus';
  }

  @override
  String getIosAppId() {
    return '1552416853';
  }

  @override
  String getFirebaseServerAuth() {
    return _firebaseServerAuth;
  }
}
