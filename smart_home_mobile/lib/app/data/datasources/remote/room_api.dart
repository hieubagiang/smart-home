import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:smart_home_mobile/app/common/configs/configurations.dart';
import 'package:smart_home_mobile/app/common/utils/urls.dart';
import 'package:smart_home_mobile/app/data/models/room_model/room_model.dart';

part 'room_api.g.dart';

@RestApi()
abstract class RoomApi {
  factory RoomApi(Dio dio) = _RoomApi;

  @GET(UrlConstants.roomUrl)
  Future<List<RoomModel>> getRoomList(
      @Header(Configurations.authentication) String authorization);

  @POST('${UrlConstants.roomUrl}')
  @FormUrlEncoded()
  Future<int> addRoom(
    @Header(Configurations.authentication) String authorization,
    @Body() Map<String, dynamic> map,
  );

  @PUT('${UrlConstants.roomUrl}/{room-id}')
  @FormUrlEncoded()
  Future<int> editRoom(
    @Header(Configurations.authentication) String authorization,
    @Path("room-id") String roomID,
    @Body() Map<String, dynamic> map,
  );
  @DELETE('${UrlConstants.roomUrl}/{room-id}')
  Future<int> deleteRoom(
    @Header(Configurations.authentication) String authorization,
    @Path("room-id") String roomID,
  );

}
