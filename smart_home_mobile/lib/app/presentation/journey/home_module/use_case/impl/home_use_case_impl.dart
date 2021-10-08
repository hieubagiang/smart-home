import 'package:retrofit/http.dart';
import 'package:smart_home_mobile/app/common/helper/storage_helper.dart';
import 'package:smart_home_mobile/app/common/network/http/dio_config.dart';
import 'package:smart_home_mobile/app/domain/entities/room_entity/room_entity.dart';
import 'package:smart_home_mobile/app/domain/entities/user_entity/user_entity.dart';
import 'package:smart_home_mobile/app/domain/repositories/room_repository.dart';
import 'package:smart_home_mobile/app/domain/repositories/user_repository.dart';

import '../home_use_case.dart';

class HomeUseCaseImpl extends HomeUseCase {
  final UserRepository userRepository;
  final RoomRepository roomRepository;

  HomeUseCaseImpl(this.userRepository, this.roomRepository);

  @override
  Future<UserEntity?> getUserData() async {
    String accessToken = (await StorageHelper.getDataUser())?.accessToken ?? '';
    final response = await userRepository.getUserData(accessToken);
    return UserEntity.parseModel(response);
  }

  @override
  Future<List<RoomEntity>> getRoomList() async {
    String accessToken = (await StorageHelper.getDataUser())?.accessToken ?? '';
    List<RoomEntity> list = [];
    final listModel = await roomRepository.getRoom(accessToken);
    /*
    listModel.forEach((element) => {list.add(RoomEntity.parseModel(element))});
    print(list);*/
    return list;
  }
}
