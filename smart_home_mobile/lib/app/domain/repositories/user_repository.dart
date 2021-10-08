import 'package:smart_home_mobile/app/data/models/user_model/user_model.dart';

abstract class UserRepository {
  Future<UserModel> getUserData(String accessToken);
}
