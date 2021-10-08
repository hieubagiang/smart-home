import 'package:smart_home_mobile/app/domain/entities/authentication/login_entity.dart';
import 'package:smart_home_mobile/app/domain/requests/login_request.dart';

abstract class LoginUseCase {
  Future<LoginEntity> login(LoginRequest request);
}
