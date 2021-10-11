import 'package:smart_home/app/data/models/authentication/login_model.dart';

class LoginEntity {
  String accessToken;

  LoginEntity({
    required this.accessToken,
  });
  factory LoginEntity.parseModel(LoginModel model) {
    return LoginEntity(accessToken: model.accessToken);
  }
  LoginModel toModel() {
    return LoginModel.parseEntity(this);
  }

  @override
  String toString() {
    return 'LoginEntity{accessToken: $accessToken}';
  }
}
