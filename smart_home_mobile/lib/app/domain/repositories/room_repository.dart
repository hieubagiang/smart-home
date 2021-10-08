import 'package:smart_home_mobile/app/data/models/room_model/room_model.dart';
import 'package:smart_home_mobile/app/domain/requests/edit_device_request.dart';

abstract class RoomRepository {
  Future<List<RoomModel>> getRoom(String accessToken);
  Future<bool> addRoom({required String accessToken ,required EditDeviceRequest request});
  Future<bool> editRoom({required String accessToken ,required String roomId,required EditDeviceRequest request});
  Future<bool> deleteRoom({required String accessToken, required String roomId});
}
