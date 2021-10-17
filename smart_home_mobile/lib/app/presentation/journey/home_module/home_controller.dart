import 'dart:convert';

import 'package:get/get.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:smart_home/app/common/base/base_controller.dart';
import 'package:smart_home/app/common/helper/mqtt_helper.dart';
import 'package:smart_home/app/common/helper/socket_io_helper.dart';
import 'package:smart_home/app/common/helper/storage_helper.dart';
import 'package:smart_home/app/data/models/message_model.dart';
import 'package:smart_home/app/domain/entities/device_entity/device_entity.dart';
import 'package:smart_home/app/domain/entities/message_entity.dart';
import 'package:smart_home/app/domain/entities/room_entity/room_entity.dart';
import 'package:smart_home/app/domain/entities/user_entity/user_entity.dart';
import 'package:smart_home/app/presentation/journey/home_module/mock_data.dart';
import 'package:smart_home/app/presentation/journey/home_module/use_case/home_use_case.dart';
import 'package:smart_home/app/presentation/journey/home_module/use_case/impl/home_use_case_impl.dart';
import 'package:smart_home/app/presentation/routes/app_pages.dart';

class HomeController extends BaseController {
  final HomeUseCase homeUseCase = Get.find<HomeUseCaseImpl>();
  var _obj = ''.obs;

  set obj(value) => _obj.value = value;

  get obj => _obj.value;
  RxDouble temp = RxDouble(20);
  RxDouble humidity = RxDouble(80);

  //RxList<RoomEntity> roomList = RxList.empty(growable: true);

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
        id: 9, name: 'Vườn', roomType: "5", devices: MockData.devicesOfYard),
  ]);
  RxList<DeviceEntity> deviceList = RxList([]);
  Rx<UserEntity?> userData = Rx(null);

  StreamSocket streamSocket = StreamSocket();

  @override
  Future<void> onInit() async {
    super.onInit();
    //connectAndListen();
    MQTTHelper().onReceiveMessage = (mqttReceivedMessage) {
      final recMess = mqttReceivedMessage.payload as MqttPublishMessage;
      final payLoad =
          MqttPublishPayload.bytesToStringAsString(recMess.payload.message);
      if (mqttReceivedMessage.topic == 'smarthome') {
        print('recevied: $payLoad');
        final messageEntity = MessageEntity.parseModel(MessageModel.fromJson(jsonDecode(payLoad)));
        this.roomList.forEach((roomEntity) {
          roomEntity.changeDeviceStatus(messageEntity);
        });
        temp.value = messageEntity.data?[0]??temp.value;
        humidity.value = messageEntity.data?[1]??humidity.value;
        roomList.refresh();
      }
    };
//connectAndListen();
  }

  void onReady(){
    super.onReady();
    initData();

  }
  void connectAndListen() {
  }

  Future<void> initData() async {
    showLoadingDialog();
    userData.value = await homeUseCase.getUserData();
    /*roomList.value =*/
    await homeUseCase.getRoomList();
    hideDialog();

    await MQTTHelper().initialize();

    MQTTHelper().subscribeToTopic('smarthome');
    //await homeUseCase.getRoomList();
    //print('$roomList');
  }

  void onTapLogout() {
    showConfirmDialog(
        title: 'logout'.tr,
        message: 'logout_confirm_message'.tr,
        onConfirm: () {
          Get.offNamed(RouteList.LOGIN);
          StorageHelper.clearUserLogin();
          MQTTHelper().client.disconnect();
        });
  }
}
