import 'package:smart_home/app/common/helper/storage_helper.dart';
import 'package:smart_home/app/domain/entities/room_entity/room_entity.dart';
import 'package:smart_home/app/domain/repositories/room_repository.dart';
import 'package:smart_home/app/domain/repositories/user_repository.dart';
import 'package:smart_home/app/domain/requests/edit_device_request.dart';

import '../room_management_use_case.dart';

class RoomManagementUseCaseImpl extends RoomManagementUseCase {
  final UserRepository userRepository;
  final RoomRepository roomRepository;

  RoomManagementUseCaseImpl(this.userRepository, this.roomRepository);

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
  Future<bool> createRoom({required EditDeviceRequest request}) async {
    String accessToken = (await StorageHelper.getDataUser())?.accessToken ?? '';
    List<RoomEntity> list = [];
    final listModel = await roomRepository.addRoom(
        accessToken: accessToken, request: request);
    return false;
  }

  @override
  Future<bool> deleteRoom() {
    // TODO: implement deleteRoomList
    throw UnimplementedError();
  }

  @override
  Future<bool> editRoom() {
    // TODO: implement editRoomList
    throw UnimplementedError();
  }
}
