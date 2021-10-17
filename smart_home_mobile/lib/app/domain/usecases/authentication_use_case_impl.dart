import 'package:smart_home/app/common/helper/storage_helper.dart';
import 'package:smart_home/app/domain/entities/authentication/login_entity.dart';
import 'package:smart_home/app/domain/repositories/authentication_repository.dart';
import 'package:smart_home/app/domain/requests/login_request.dart';
import 'package:smart_home/app/presentation/journey/login/use_case/authentication_use_case.dart';

class LoginUseCaseImpl extends LoginUseCase {
  final AuthenticationRepository authenticationRepository;

  LoginUseCaseImpl(this.authenticationRepository);

  @override
  Future<LoginEntity> login(LoginRequest request) async {
    final response =
        await authenticationRepository.login(loginRequest: request);
    return LoginEntity.parseModel(response);
  }

  @override
  Future<String?> getSavedLoginId() async {
    return await StorageHelper.getLoginId() ?? "";
  }

  @override
  Future<void> saveLoginId(String loginId) async {
    await StorageHelper.setLoginId(loginId);
  }
}