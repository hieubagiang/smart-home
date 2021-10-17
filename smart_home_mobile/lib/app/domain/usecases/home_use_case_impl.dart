import 'package:smart_home/app/common/helper/storage_helper.dart';
import 'package:smart_home/app/domain/entities/room_entity/room_entity.dart';
import 'package:smart_home/app/domain/entities/user_entity/user_entity.dart';
import 'package:smart_home/app/domain/repositories/room_repository.dart';
import 'package:smart_home/app/domain/repositories/user_repository.dart';

import '../../presentation/journey/home/use_case/home_use_case.dart';

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
    listModel.forEach((element) => {list.add(RoomEntity.parseModel(element))});
    print(list);
    return list;
  }

  @override
  Future<void> initMqtt() {
    // TODO: implement initMqtt
    throw UnimplementedError();
  }
}
