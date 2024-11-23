import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseNotificationManager{
  static Future<void> initialize()async {
    final notificationSettings = await FirebaseMessaging.instance.requestPermission();
    final fcmToken = await FirebaseMessaging.instance.getToken();
    FirebaseMessaging.onMessage.listen(_message);
    FirebaseMessaging.onMessageOpenedApp.listen(_message);
    FirebaseMessaging.onBackgroundMessage(_onBackGroundMessage);
}
  static void _message(RemoteMessage message){
    print(message.data);
    print(message.notification?.title);
    print(message.notification?.body);
  }
  static Future<String?>getFcmToken() async {
    String? token = await FirebaseMessaging.instance.getToken();
    return token;
  }
  static Future<void>onRefreshFcmToken() async {
    FirebaseMessaging.instance.onTokenRefresh.listen((String? newToken){});
  }

  Future<void>subscribeToTopic(String topicName)async {
    await FirebaseMessaging.instance.subscribeToTopic(topicName);
  }
  Future<void>unSubscribeToTopic(String topicName)async {
    await FirebaseMessaging.instance.unsubscribeFromTopic(topicName);
  }
}

Future<void> _onBackGroundMessage(RemoteMessage message)async {
  print("message");
}