
import 'env.dart';

class DefaultConfig extends EnvConfig {
  final _splashScreenSecondTimeOut = 2;
  final _host = 'http://128.199.168.81:8089/';
  final _baseImageUrl = 'statics/';
  final _productImageUrl = 'host/';
  final _environment = 'dev';
  final _basicAuth = 'anonymous';
  final _bearerAuth = 'Bearer';
  final _googleMapApiKey = '';
  final _productHost = 'domain/v1/api/public/';

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
    return 'deeplink';
  }

  @override
  String getDeepLinksIos() {
    return 'deeplink';
  }

  @override
  String getProductHost() {
    return _productHost;
  }

  @override
  String getAndroidAppId() {
    return 'com.smart.home';
  }

  @override
  String getIosAppId() {
    return 'iosappid';
  }
}
