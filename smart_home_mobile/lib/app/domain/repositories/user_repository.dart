import 'package:smart_home/app/data/models/user_model/user_model.dart';

abstract class UserRepository {
  Future<UserModel> getUserData(String accessToken);
}
