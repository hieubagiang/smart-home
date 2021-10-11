import 'package:smart_home/app/data/models/device_model/device_model.dart';
import 'package:smart_home/app/domain/requests/edit_device_request.dart';

abstract class DeviceRepository {
  Future<List<DeviceModel>?> getDevice(String accessToken);

  Future<bool> addDevice(
      {required String accessToken, required EditDeviceRequest request});

  Future<bool> editDevice(
      {required String accessToken,
        required String roomId,
        required String deviceId,
      required EditDeviceRequest request});

  Future<bool> deleteDevice(
      {required String accessToken,required String roomId ,required String deviceId});
}
