// import 'dart:convert';
//
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:smart_home_mobile/app/common//helper/local_notification_helper.dart';
// import 'package:smart_home_mobile/app/common//utils/functions.dart';
//
// class PushNotificationHelper {
//   late FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
//
//   Function(String)? handleNotificationTap;
//   String? _fcmToken;
//   String? _payLoad;
//   static final PushNotificationHelper _singleton =
//       PushNotificationHelper._internal();
//
//   factory PushNotificationHelper() {
//     return _singleton;
//   }
//
//   PushNotificationHelper._internal();
//
//   Future initialize({Function(String)? handleNotificationTap}) async {
//     await Firebase.initializeApp();
//     this.handleNotificationTap = handleNotificationTap;
//     await _fcmInitialization();
//     await FirebaseMessaging.instance
//         .setForegroundNotificationPresentationOptions(
//       alert: true,
//       badge: true,
//       sound: true,
//     );
//   }
//
//   Future _fcmInitialization() async {
//     try {
//       if (_fcmToken == null) {
//         _fcmToken = await _firebaseMessaging.getToken();
//       }
//
//       FunctionUtils.logWhenDebug(this, 'fcm token: $_fcmToken');
//       RemoteMessage? initMessage = await _firebaseMessaging.getInitialMessage();
//       if (initMessage != null) {
//         _payLoad = jsonEncode(initMessage);
//       }
//
//       FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//         _payLoad = getNotificationContent(message);
//         FunctionUtils.logWhenDebug(this, 'onMessage: $_payLoad');
//         if (message.notification != null) {
//           LocalNotificationHelper().showNotification(
//               title: message.notification?.title ?? '',
//               body: message.notification?.body ?? '');
//         }
//       });
//       FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
//       FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
//         _payLoad = getNotificationContent(message);
//         handleNotificationTap!(_payLoad!);
//       });
//     } catch (e) {}
//   }
//
//   Future<void> unSubscribeFromTopic(String topic) async {
//     await _firebaseMessaging.unsubscribeFromTopic(topic);
//   }
//
//   Future<void> subscribeToTopic(String topic) async {
//     await _firebaseMessaging.subscribeToTopic(topic);
//   }
//
//   String? getFcmToken() => _fcmToken;
//
//   Future<void> deleteToken() async {
//     _fcmToken = null;
//     await _firebaseMessaging.deleteToken();
//   }
// }
//
// String getNotificationContent(RemoteMessage? message) {
//   if (message == null) return 'RemoteMessage is Null';
//   final body = {
//     'notification': {
//       'title': message.notification?.title,
//       'body': message.notification?.body,
//     },
//     'data': message.data,
//     "collapse_key": message.collapseKey,
//     "message_id": message.messageId,
//     "sent_time": message.sentTime?.millisecondsSinceEpoch,
//     "from": message.from,
//     "ttl": message.ttl,
//   };
//   return jsonEncode(body);
// }
//
// Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   await Firebase.initializeApp();
//   print('Handling a background message ${message.messageId}');
// }
