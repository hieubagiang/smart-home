// class UserRepositoryImpl implements UserRepository {
//   final UserRemoteDataSourece userRemoteDatasource;
//   final UserLocalDataSource userLocalDataSource;
//
//   UserRepositoryImpl(this.userRemoteDatasource, this.userLocalDataSource);
//
//   @override
//   Future createUser(UserEntity userEntity,String uid) async {
//     final userModel = userEntity.toModel();
//     await userRemoteDatasource.createUser(userModel,uid);
//     await userLocalDataSource.saveUserInfo(userEntity);
//   }
//
//   @override
//   Future<UserEntity?> getUser(String uid) async {
//     if (userLocalDataSource.hasUserInfo()) {
//       return userLocalDataSource.getUser();
//     }
//     final user = await userRemoteDatasource.getUser(uid);
//     if (user != null) {
//       await userLocalDataSource.saveUserInfo(user);
//     }
//   }
//
//   @override
//   User? getCurrentUser() => userRemoteDatasource.getCurrentUser();
// }
