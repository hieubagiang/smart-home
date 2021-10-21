import 'dart:convert';

import 'package:get/get.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:smart_home/app/common/base/base_controller.dart';
import 'package:smart_home/app/common/helper/mqtt_helper.dart';
import 'package:smart_home/app/common/helper/push_notificaction_helper/push_notification_helper.dart';
import 'package:smart_home/app/common/helper/socket_io_helper.dart';
import 'package:smart_home/app/common/helper/storage_helper.dart';
import 'package:smart_home/app/data/enum/statics_enum.dart';
import 'package:smart_home/app/data/enum/type_notification_enum.dart';
import 'package:smart_home/app/data/models/message_model.dart';
import 'package:smart_home/app/domain/entities/device_entity/device_entity.dart';
import 'package:smart_home/app/domain/entities/message_entity.dart';
import 'package:smart_home/app/domain/entities/room_entity/room_entity.dart';
import 'package:smart_home/app/domain/entities/user_entity/user_entity.dart';
import 'package:smart_home/app/domain/requests/push_notification/notification_request.dart';
import 'package:smart_home/app/domain/requests/push_notification/push_notification_data_request.dart';
import 'package:smart_home/app/domain/requests/push_notification/push_notification_request.dart';
import 'package:smart_home/app/domain/usecases/home_use_case_impl.dart';
import 'package:smart_home/app/presentation/journey/home/mock_data.dart';
import 'package:smart_home/app/presentation/journey/home/use_case/home_use_case.dart';
import 'package:smart_home/app/presentation/journey/main/main_use_case.dart';
import 'package:smart_home/app/presentation/routes/app_pages.dart';

class HomeController extends BaseController {
  final MainUseCase mainUseCase;
  final HomeUseCase homeUseCase = Get.find<HomeUseCaseImpl>();
  var _obj = ''.obs;

  HomeController(this.mainUseCase);

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
        final messageEntity = MessageEntity.parseModel(
            MessageModel.fromJson(jsonDecode(payLoad)));
        this.roomList.forEach((roomEntity) {
          roomEntity.changeDeviceStatus(messageEntity);
        });
        setStatics(messageEntity.data?[0] ?? this.temp.value,
            messageEntity.data?[1] ?? this.humidity.value);
        roomList.refresh();
      }
    };
//connectAndListen();
  }

  void onReady() {
    super.onReady();
    initData();
  }

  void connectAndListen() {}

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
        onConfirm: logout);
  }

  Future<void> logout() async {
    showLoadingDialog();
    await StorageHelper.clearUserLogin();
    MQTTHelper().client.disconnect();
    hideDialog();
    Get.offNamed(RouteList.LOGIN);
  }

  void setStatics(double temp, double humidity) {
    this.temp.value = temp;
    this.humidity.value = humidity;
    _sendPushNotification(temp, humidity);
  }

  void _sendPushNotification(double temp, double humidity) {
    final title = 'Smart Home';
    String body = '';
    String tags = '';
    String? channelId;
    final token = PushNotificationHelper().getFcmToken()!;
    if ((temp >= 25 && temp <= 28) && (humidity >= 65 && humidity <= 85)) {
      body = 'Nhiệt độ hiện tại là $temp độ, độ ẩm là $humidity%';
      tags = NotificationTypeEnum.getNotificationTypeFromMessage(
              StaticsType.TEMPERATURE, temp)
          .label;
      channelId = NotificationType.NORMAL.;
    } else if (temp < 25 || temp > 28) {
      body = 'Cảnh báo nhiệt độ vượt ngưỡng $temp độ';
      tags = NotificationTypeEnum.getNotificationTypeFromMessage(
              StaticsType.TEMPERATURE, temp)
          .label;
      channelId = NotificationType.ALERT.soundPath;
    }
    if (humidity > 85 || humidity < 65) {
      body = 'Cảnh báo độ ẩm vượt ngưỡng $humidity%';
      tags = NotificationTypeEnum.getNotificationTypeFromMessage(
              StaticsType.HUMIDITY, humidity)
          .label;
      channelId = NotificationType.NORMAL.soundPath;
    }
    mainUseCase.sendPushNotification(PushNotificationRequest(
        priority: 'HIGH',
        to: token,
        data: PushNotificationDataRequest(
          title: title,
          body: body,
          tag: tags,
          clickAction: 'FLUTTER_NOTIFICATION_CLICK',
        ),
        notification: NotificationRequest(
            title: title, body: body, tag: tags, sound: channelId)));
  }
}
