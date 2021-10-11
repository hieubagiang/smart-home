import 'package:smart_home/app/domain/entities/authentication/login_entity.dart';
import 'package:smart_home/app/domain/requests/login_request.dart';

abstract class LoginUseCase {
  Future<LoginEntity> login(LoginRequest request);
  Future<String?> getSavedLoginId();
  Future<void> saveLoginId(String loginId);
}
