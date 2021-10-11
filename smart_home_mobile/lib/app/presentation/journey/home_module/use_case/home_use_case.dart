import 'package:smart_home/app/domain/entities/room_entity/room_entity.dart';
import 'package:smart_home/app/domain/entities/user_entity/user_entity.dart';

abstract class HomeUseCase{
  Future<UserEntity?> getUserData();
  Future<List<RoomEntity>> getRoomList();

  Future<void> initMqtt();
}