import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_practice/fcm/firebase_notification_manager.dart';
import 'package:flutter/material.dart';

import 'application/app.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseNotificationManager.initialize();
  debugPrint("Token:");
  debugPrint(await FirebaseNotificationManager.getFcmToken());
  await FirebaseNotificationManager().subscribeToTopic("ostad");
  runApp(const MyApp());
}

