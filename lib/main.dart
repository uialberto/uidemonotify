import 'package:flutter/material.dart';
import 'package:uidemonotify/screens/home_screen.dart';
import 'package:uidemonotify/screens/message_screen.dart';
import 'package:uidemonotify/services/push_notify_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PushNotifyService.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'home',
      routes: {'home': (_) => HomeScreen(), 'message': (_) => MessageScreen()},
    );
  }
}
