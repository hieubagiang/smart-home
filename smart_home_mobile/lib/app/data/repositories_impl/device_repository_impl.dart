import 'package:smart_home/app/common/configs/configurations.dart';
import 'package:smart_home/app/data/datasources/remote/device_api.dart';
import 'package:smart_home/app/data/models/device_model/device_model.dart';
import 'package:smart_home/app/domain/repositories/device_repository.dart';
import 'package:smart_home/app/domain/requests/edit_device_request.dart';

class DeviceRepositoryImpl implements DeviceRepository {
  final DeviceApi roomApi;

  DeviceRepositoryImpl(this.roomApi);

  @override
  Future<List<DeviceModel>?> getDevice(String accessToken) async {
    String authorization = Configurations.getBearerAuth(accessToken);
    final response = await roomApi.getList(authorization);
    return response;
  }

  @override
  Future<bool> addDevice(
      {required String accessToken, required EditDeviceRequest request}) async {
    String authorization = Configurations.getBearerAuth(accessToken);
    final response = await roomApi.addDevice(authorization, request.toJson());
    return response == 1;
  }

  @override
  Future<bool> deleteDevice({
    required String accessToken,
    required String roomId,
    required String deviceId,
  }) async {
    String authorization = Configurations.getBearerAuth(accessToken);
    final response =
        await roomApi.deleteDevice(authorization, roomId, deviceId);
    return response == 1;
  }

  @override
  Future<bool> editDevice(
      {required String accessToken,
      required String roomId,
      required String deviceId,
      required EditDeviceRequest request}) async {
    String authorization = Configurations.getBearerAuth(accessToken);
    final response = await roomApi.editDevice(
        authorization, roomId, deviceId, request.toJson());
    return response == 1;
  }
}
