import 'package:smart_home/app/data/datasources/remote/authentication_api.dart';
import 'package:smart_home/app/domain/repositories/authentication_repository.dart';
import 'package:smart_home/app/domain/requests/login_request.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final AuthenticationApi authenticationApi;

  AuthenticationRepositoryImpl(this.authenticationApi);

  @override
  Future login({required LoginRequest loginRequest}) async {
    final response = await authenticationApi.login(loginRequest.toJson());
    return response;
  }
}
