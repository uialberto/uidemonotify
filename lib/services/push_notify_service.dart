// SHA1: E8:F7:80:FF:34:B0:9C:B5:D3:9E:F2:BB:6C:4A:E0:AA:FA:2D:6A:DA

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotifyService {
  static FirebaseMessaging messaging = FirebaseMessaging.instance;
  static String? token;

  static Future initializeApp() async {
    // PUSH Notificaciones

    await Firebase.initializeApp();

    token = await FirebaseMessaging.instance.getToken();

    print('Token Device: $token');
  }
}
