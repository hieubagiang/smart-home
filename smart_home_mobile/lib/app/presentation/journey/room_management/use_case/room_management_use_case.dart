import 'package:smart_home/app/domain/entities/room_entity/room_entity.dart';
import 'package:smart_home/app/domain/requests/edit_device_request.dart';

abstract class RoomManagementUseCase {
  Future<List<RoomEntity>> getRoomList();

  Future<bool> createRoom({required EditDeviceRequest request});

  Future<bool> editRoom();

  Future<bool> deleteRoom();
}
