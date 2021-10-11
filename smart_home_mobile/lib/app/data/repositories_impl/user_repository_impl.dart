import 'package:smart_home/app/common/configs/configurations.dart';
import 'package:smart_home/app/data/datasources/remote/user_api.dart';
import 'package:smart_home/app/data/models/user_model/user_model.dart';
import 'package:smart_home/app/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserApi userApi;

  UserRepositoryImpl(this.userApi);
  @override
  Future<UserModel> getUserData(String accessToken) async {
    String authorization = Configurations.getBearerAuth(accessToken);
    final response = await userApi.getUserInfo(authorization);
    return response;
  }

}
