import 'package:smart_home/app/domain/requests/login_request.dart';

abstract class AuthenticationRepository {
  Future login({required LoginRequest loginRequest});
}
