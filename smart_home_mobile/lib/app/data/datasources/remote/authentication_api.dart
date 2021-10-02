// import 'package:dio/dio.dart';
// import 'package:retrofit/retrofit.dart';
// import 'package:smart_home_mobile/app/common/configs/configurations.dart';
// import 'package:smart_home_mobile/app/data/models/authentication/login_model.dart';
//
// part 'authentication_api.g.dart';
//
// @RestApi()
// abstract class AuthenticationApi {
//   factory AuthenticationApi(Dio dio) = _AuthenticationApi;
//
//   @POST('/oauth/register')
//   @FormUrlEncoded()
//   Future<LoginModel> register(
//     @Header(Configurations.authentication) String authorization,
//     @Body() Map<String, dynamic> map,
//   );
//
//   @POST('/oauth/token')
//   @FormUrlEncoded()
//   Future<LoginEntity> refreshToken(
//     @Header(Configurations.authentication) String authorization,
//     @Body() Map<String, dynamic> map,
//   );
// }
