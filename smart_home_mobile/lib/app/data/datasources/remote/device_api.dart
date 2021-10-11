import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:smart_home/app/common/configs/configurations.dart';
import 'package:smart_home/app/common/utils/urls.dart';
import 'package:smart_home/app/data/models/device_model/device_model.dart';

part 'device_api.g.dart';

@RestApi()
abstract class DeviceApi {
  factory DeviceApi(Dio dio) = _DeviceApi;

  @GET('${UrlConstants.roomUrl}/{room-id}${UrlConstants.deviceUrl}')
  Future<List<DeviceModel>> getList(
      @Header(Configurations.authentication) String authorization);

  @POST('${UrlConstants.roomUrl}/{room-id}${UrlConstants.deviceUrl}')
  @FormUrlEncoded()
  Future<int> addDevice(
    @Header(Configurations.authentication) String authorization,
    @Body() Map<String, dynamic> map,
  );

  @PUT(
      '${UrlConstants.roomUrl}/{room-id}${UrlConstants.deviceUrl}/{device-id}')
  @FormUrlEncoded()
  Future<int> editDevice(
    @Header(Configurations.authentication) String authorization,
    @Path("room-id") String roomId,
    @Path("device-id") String deviceId,
    @Body() Map<String, dynamic> map,
  );

  @DELETE(
      '${UrlConstants.roomUrl}/{room-id}${UrlConstants.deviceUrl}/{device-id}')
  Future<int> deleteDevice(
    @Header(Configurations.authentication) String authorization,
    @Path("room-id") String roomId,
    @Path("device-id") String deviceId,
  );
}
