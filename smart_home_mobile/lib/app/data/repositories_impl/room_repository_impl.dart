import 'package:smart_home_mobile/app/common/configs/configurations.dart';
import 'package:smart_home_mobile/app/data/datasources/remote/room_api.dart';
import 'package:smart_home_mobile/app/data/models/room_model/room_model.dart';
import 'package:smart_home_mobile/app/domain/repositories/room_repository.dart';
import 'package:smart_home_mobile/app/domain/requests/edit_device_request.dart';

class RoomRepositoryImpl implements RoomRepository {
  final RoomApi roomApi;

  RoomRepositoryImpl(this.roomApi);

  @override
  Future<List<RoomModel>> getRoom(String accessToken) async {
    String authorization = Configurations.getBearerAuth(accessToken);
    final response = await roomApi.getRoomList(authorization);
    return response;
  }

  @override
  Future<bool> addRoom(
      {required String accessToken,
        required EditDeviceRequest request}) async {
    String authorization = Configurations.getBearerAuth(accessToken);
    final response =
    await roomApi.addRoom(authorization, request.toJson());
    return response==1;
  }


  @override
  Future<bool> deleteRoom({required String accessToken, required String roomId}) async {
    String authorization = Configurations.getBearerAuth(accessToken);
    final response =
        await roomApi.deleteRoom(authorization, roomId);
    return response==1;  }

  @override
  Future<bool> editRoom(
      {required String accessToken,
      required String roomId,
      required EditDeviceRequest request}) async {
    String authorization = Configurations.getBearerAuth(accessToken);
    final response =
        await roomApi.editRoom(authorization, roomId, request.toJson());
    return response==1;
  }
}
