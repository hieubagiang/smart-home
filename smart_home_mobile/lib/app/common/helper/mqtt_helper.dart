import 'dart:io';

import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

class MQTTHelper {
  final client = MqttServerClient('broker.hivemq.com', '123123');

  Function(String)? handleNotificationTap;
  String? _payLoad;
  static final MQTTHelper _singleton = MQTTHelper._internal();
  Function(MqttReceivedMessage<MqttMessage?>)? onReceiveMessage;

  factory MQTTHelper() {
    return _singleton;
  }

  MQTTHelper._internal();

  Future initialize({Function(String)? handleNotificationTap}) async {
    client.logging(on: false);
    client.keepAlivePeriod = 3600;
    client.onDisconnected = onDisconnected;
    client.onConnected = onConnected;
    client.onSubscribed = onSubscribed;

    print('MQTT client connecting....');
    client.connectionMessage = connMess;
    try {
      await client.connect();
    } on NoConnectionException catch (e) {
      print('EXAMPLE::client exception - $e');
      client.disconnect();
    } on SocketException catch (e) {
      // Raised by the socket layer
      print('EXAMPLE::socket exception - $e');
      client.disconnect();
    }

    /// Check we are connected
    if (client.connectionStatus!.state == MqttConnectionState.connected) {
      print('MQTT client connected');
    } else {
      /// Use status here rather than state if you also want the broker return code.
      print(
          'EXAMPLE::ERROR Mosquitto client connection failed - disconnecting, status is ${client.connectionStatus}');
      client.disconnect();
    }

    client.updates!.listen((List<MqttReceivedMessage<MqttMessage?>>? c) {
      final recMess = c![0].payload as MqttPublishMessage;
      final pt =
          MqttPublishPayload.bytesToStringAsString(recMess.payload.message);

      /// The above may seem a little convoluted for users only interested in the
      /// payload, some users however may be interested in the received publish message,
      /// lets not constrain ourselves yet until the package has been in the wild
      /// for a while.
      /// The payload is a byte buffer, this will be specific to the topic
      print(
          'Message Receive: topic is <${c[0].topic}>, payload is <-- $pt -->');
      onReceiveMessage?.call(c[0]);
    });
  }

  Future<void> unSubscribeFromTopic(String topic) async {
    /// Finally, unsubscribe and exit gracefully
    print('EXAMPLE::Unsubscribing');
    client.unsubscribe(topic);
  }

  Future<void> subscribeToTopic(String topic) async {
    print('EXAMPLE::Subscribing to the $topic');
    client.subscribe(topic, MqttQos.atMostOnce);
  }

  Future<void> publishToTopic(String topic, String message) async {
    final builder = MqttClientPayloadBuilder();
    builder.addString(message);
    print('Publishing our topic $topic ==> $message');
    client.publishMessage(topic, MqttQos.exactlyOnce, builder.payload!);
  }

  void onConnected() {
    print('Client connection was successful');
  }

  void onSubscribed(String topic) {
    print('EXAMPLE::Subscription confirmed for topic $topic');
  }

  void onDisconnected() {
    print('EXAMPLE::OnDisconnected client callback - Client disconnection');
    if (client.connectionStatus!.disconnectionOrigin ==
        MqttDisconnectionOrigin.solicited) {
      print('EXAMPLE::OnDisconnected callback is solicited, this is correct');
    }
    initialize();
  }

  final connMess = MqttConnectMessage()
      .withClientIdentifier('Mqtt_MyClientUniqueId')
      .withWillTopic('willtopic') // If you set this you must set a will message
      .withWillMessage('My Will message')
      .startClean() // Non persistent session for testing
      .withWillQos(MqttQos.atLeastOnce);
}

