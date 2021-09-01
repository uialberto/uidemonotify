import 'package:flutter/material.dart';
import 'package:uidemonotify/screens/home_screen.dart';
import 'package:uidemonotify/screens/message_screen.dart';
import 'package:uidemonotify/services/push_notify_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PushNotifyService.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<NavigatorState> navigatorKey =
      new GlobalKey<NavigatorState>();
  final GlobalKey<ScaffoldMessengerState> messgengerKey =
      new GlobalKey<ScaffoldMessengerState>();

  @override
  void initState() {
    super.initState();

    PushNotifyService.messagesStream.listen((message) {
      // print('MyApp: $message');
      navigatorKey.currentState?.pushNamed('message', arguments: message);
      final snackBar = SnackBar(content: Text(message));
      messgengerKey.currentState?.showSnackBar(snackBar);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      navigatorKey: navigatorKey,
      scaffoldMessengerKey: messgengerKey,
      initialRoute: 'home',
      routes: {'home': (_) => HomeScreen(), 'message': (_) => MessageScreen()},
    );
  }
}
