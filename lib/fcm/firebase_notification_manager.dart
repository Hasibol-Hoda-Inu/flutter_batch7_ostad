import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseNotificationManager{
  static Future<void> initialize()async {
    final notificationSettings = await FirebaseMessaging.instance.requestPermission();
    final fcmToken = await FirebaseMessaging.instance.getToken();
    FirebaseMessaging.onMessage.listen(_message);
    FirebaseMessaging.onMessageOpenedApp.listen(_message);
    FirebaseMessaging.onBackgroundMessage(_onBackGroundMessage);
}
  static void _message(RemoteMessage message){}
}

Future<void> _onBackGroundMessage(RemoteMessage message)async {
  print("message");
}