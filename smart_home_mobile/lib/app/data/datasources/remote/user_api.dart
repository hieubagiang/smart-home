import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:smart_home/app/common/configs/configurations.dart';
import 'package:smart_home/app/common/utils/urls.dart';
import 'package:smart_home/app/data/models/user_model/user_model.dart';

part 'user_api.g.dart';

@RestApi()
abstract class UserApi {
  factory UserApi(Dio dio) = _UserApi;

  @GET(UrlConstants.userInfo)
  Future<UserModel> getUserInfo(
      @Header(Configurations.authentication) String authorization);

}
