import 'package:get/get.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:smart_home_mobile/app/common/helper/mqtt_helper.dart';
import 'package:smart_home_mobile/scopedModel/connectedModel.dart';

class HomePageController extends GetxController {
  var _obj = ''.obs;

  set obj(value) => _obj.value = value;

  get obj => _obj.value;
  Rx<ApplianceListModel> model = Rx(ApplianceListModel());

  @override
  void onInit() {
    super.onInit();
    MQTTHelper().onReceiveMessage = (mqttReceivedMessage){
      final recMess = mqttReceivedMessage.payload as MqttPublishMessage;
      final pt =
      MqttPublishPayload.bytesToStringAsString(recMess.payload.message);

      if(mqttReceivedMessage.topic=='smarthome/led'){
        model.value.changeDeviceStatus(mqttReceivedMessage.topic, pt);
        model.refresh();
      }
    };
  }
}
