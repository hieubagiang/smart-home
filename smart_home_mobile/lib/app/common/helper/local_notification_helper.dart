import 'dart:typed_data';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:smart_home_mobile/app/common/constants/colors_constant.dart';

const notificationChannel = "Pastel notification channel";
const notificationChannelId = "pastel_channel_id_0";
const notificationChannelDescription = "Channel for notification";
const notificationIconPath = 'app_icon';
const notificationSoundPath = '';

class LocalNotificationHelper {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  static final LocalNotificationHelper _localNotificationHelper =
      LocalNotificationHelper._internal();
  static int _notificationId = 1;

  factory LocalNotificationHelper() {
    return _localNotificationHelper;
  }

  LocalNotificationHelper._internal();

  Future<void> init() async {
    var initializationSettings = await _getPlatformSettings();
    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: selectNotification);

    _createNotificationChannel();
  }

  void _createNotificationChannel() async {
    var androidNotificationChannel = AndroidNotificationChannel(
      notificationChannelId,
      notificationChannel,
      notificationChannelDescription,
    );
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(androidNotificationChannel);
  }

  Future<InitializationSettings> _getPlatformSettings() async {
    final AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings(notificationIconPath);

    final IOSInitializationSettings initializationSettingsIOS =
        IOSInitializationSettings(
      requestSoundPermission: false,
      requestBadgePermission: false,
      requestAlertPermission: false,
      // uncomment if want to support ios <10.
      // onDidReceiveLocalNotification: onDidReceiveLocalNotification,
    );

    return InitializationSettings(
        android: initializationSettingsAndroid,
        iOS: initializationSettingsIOS,
        macOS: null);
  }

  Future<void> showNotification(
      {required String title, required String body, String? payload}) async {
    var vibrationPattern = Int64List(4);
    vibrationPattern[0] = 0;
    vibrationPattern[1] = 200;
    vibrationPattern[2] = 200;
    vibrationPattern[3] = 200;

    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      notificationChannelId,
      notificationChannel,
      notificationChannelDescription,
      icon: notificationIconPath,
      color: ColorUtils.primaryColor,
      vibrationPattern: vibrationPattern,
      importance: Importance.max,
      priority: Priority.max,
      //sound: RawResourceAndroidNotificationSound(notificationSoundPath)
    );
    IOSNotificationDetails iOSPlatformChannelSpecifics = IOSNotificationDetails(
        presentAlert: true,
        // Present an alert when the notification is displayed and the application is in the foreground (only from iOS 10 onwards)
        presentBadge: true,
        // Present the badge number when the notification is displayed and the application is in the foreground (only from iOS 10 onwards)
        presentSound: true,
        // Play a sound when the notification is displayed and the application is in the foreground (only from iOS 10 onwards)
        //sound: String?,  // Specifics the file path to play (only from iOS 10 onwards)
        badgeNumber: 0,
        // The application's icon badge number
        //attachments: List<IOSNotificationAttachment>?, (only from iOS 10 onwards)
        //subtitle: String?, //Secondary description  (only from iOS 10 onwards)
        threadIdentifier: _notificationId.toString());
    var platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(
      0,
      title,
      body,
      platformChannelSpecifics,
      payload: payload,
    );
  }

  Future<dynamic> selectNotification(String? payload) async {
    //Handle notification tapped logic here
  }
}
