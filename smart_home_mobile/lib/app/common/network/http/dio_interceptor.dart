import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:smart_home/app/common/base/base_controller.dart';

class DioInterceptor extends Interceptor {
  @override
  void onError(DioError err, ErrorInterceptorHandler errorInterceptorHandler) {
    Get.put(BaseController()).showDialogMessage(
        message: err.response?.data['message'] ?? 'some_thing_went_wrong'.tr,
        title: 'error'.tr);
  }

  Future _handleRefreshToken(DioError err) async {
    RequestOptions options = err.response!.requestOptions;
/*
    final refreshToken =
        await Injector.container<AppPreference>().getRefreshToken();
    final response = await Injector.container<AuthenticationRepository>()
        .refreshToken(RefreshTokenRequest(
            grantType: AuthenticationGrantType.refresh_token.key,
            refreshToken: refreshToken));
    final tokenModel = LoginModel.parseModel(response);
    Injector.container<AppPreference>()
        .saveToken(tokenModel.accessToken, tokenModel.refreshToken);
    options.headers[Configurations.authentication] =
        Configurations.getBearerAuth(response.accessToken);
    return dio.request(options.path, options: options);
*/
  }
}
