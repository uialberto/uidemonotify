// SHA1: E8:F7:80:FF:34:B0:9C:B5:D3:9E:F2:BB:6C:4A:E0:AA:FA:2D:6A:DA

import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotifyService {
  static FirebaseMessaging messaging = FirebaseMessaging.instance;
  static String? token;

  static StreamController<String> _messageStream = new StreamController();

  static Stream<String> get messagesStream => _messageStream.stream;

  static Future _backgroudHandler(RemoteMessage message) async {
    // print('onbackgroud Handler: ${message.messageId}');
    print(message.data);
    _messageStream.add(message.data['product'] ?? 'No Data');
  }

  static Future _onMessageHandler(RemoteMessage message) async {
    // print('onMessage Handler: ${message.messageId}');
    print(message.data);
    _messageStream.add(message.data['product'] ?? 'No Data');
  }

  static Future _onOpenMessageHandler(RemoteMessage message) async {
    // print('onOpenMessage Handler: ${message.messageId}');
    print(message.data);
    _messageStream.add(message.data['product'] ?? 'No Data');
  }

  static Future initializeApp() async {
    // PUSH Notificaciones

    await Firebase.initializeApp();

    token = await FirebaseMessaging.instance.getToken();

    print('Token Device: $token');

    FirebaseMessaging.onBackgroundMessage(_backgroudHandler);
    FirebaseMessaging.onMessage.listen(_onMessageHandler);
    FirebaseMessaging.onMessageOpenedApp.listen(_onOpenMessageHandler);
  }

  static closeStreams() {
    _messageStream.close();
  }
}
