import 'package:get/get.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:smart_home_mobile/app/common/base/base_controller.dart';
import 'package:smart_home_mobile/app/common/helper/mqtt_helper.dart';
import 'package:smart_home_mobile/app/common/helper/socket_io_helper.dart';
import 'package:smart_home_mobile/app/domain/entities/device_entity/device_entity.dart';
import 'package:smart_home_mobile/app/domain/entities/room_entity/room_entity.dart';
import 'package:smart_home_mobile/app/domain/entities/user_entity/user_entity.dart';
import 'package:smart_home_mobile/app/presentation/journey/home_module/mock_data.dart';
import 'package:smart_home_mobile/app/presentation/journey/home_module/use_case/home_use_case.dart';
import 'package:smart_home_mobile/app/presentation/journey/home_module/use_case/impl/home_use_case_impl.dart';
import 'package:web_socket_channel/io.dart';

class HomeController extends BaseController {
  final HomeUseCase homeUseCase = Get.find<HomeUseCaseImpl>();
  var _obj = ''.obs;

  set obj(value) => _obj.value = value;

  get obj => _obj.value;
  RxList<RoomEntity> roomList = RxList([
    RoomEntity(
        id: 5,
        name: 'Phòng khách',
        roomType: "1",
        devices: MockData.devicesOfLivingRoom),
    RoomEntity(
        id: 6,
        name: 'Phòng ngủ',
        roomType: "2",
        devices: MockData.devicesOfBedRoom),
    RoomEntity(
        id: 7,
        name: 'Phòng bếp',
        roomType: "3",
        devices: MockData.devicesOfKitchen),
    RoomEntity(
        id: 8,
        name: 'Phòng tắm',
        roomType: "4",
        devices: MockData.devicesOfBathRoom),
    RoomEntity(
        id: 9, name: 'Sân', roomType: "5", devices: MockData.devicesOfYard),
  ]);
  RxList<DeviceEntity> deviceList = RxList([]);
  Rx<UserEntity?> userData = Rx(null);

  StreamSocket streamSocket = StreamSocket();

  @override
  Future<void> onInit() async {
    super.onInit();
    //connectAndListen();
    initData();

    MQTTHelper().onReceiveMessage = (mqttReceivedMessage) {
      final recMess = mqttReceivedMessage.payload as MqttPublishMessage;
      final payLoad =
          MqttPublishPayload.bytesToStringAsString(recMess.payload.message);
      if (mqttReceivedMessage.topic == 'smarthome/led' ||
          mqttReceivedMessage.topic == 'smarthome/flame' ||
          mqttReceivedMessage.topic == 'smarthome/watertree') {
        this.roomList.forEach((roomEntity) {
          roomEntity.changeDeviceStatus(mqttReceivedMessage.topic, payLoad);
        });
      }
    };
    //connectAndListen();
  }

  void connectAndListen() {
    /*  IO.Socket socket = IO.io('http://128.199.168.81:8089',
          OptionBuilder().setTransports(['websocket']).build());
    socket.onConnect((_) {
      print('socket connected');
    });
    socket.on('2', (data) => (){
      //streamSocket.addResponse(data);
      print('socket receive: $data');
    } );
    socket.onDisconnect((_) => print('disconnect'));*/

    var channel =
        IOWebSocketChannel.connect(Uri.parse('ws://broker.hivemq.com:8000'));

    channel.stream.listen((message) {
      print('message = $message}');
    });
  }

  Future<void> initData() async {
    homeUseCase.getUserData().then((value) => {userData.value = value});
    //await homeUseCase.getRoomList();
    //print('$roomList');
  }
}
