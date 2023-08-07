import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:woocomerceadmin/blocs/shop_bloc/shop_bloc.dart';
import 'package:woocomerceadmin/utils/theme.dart';

import 'config/notification/notification_api.dart';
import 'firebase_options.dart';
import 'utils/routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  NotificationApi.init();
  await Future.wait([
    Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    ),
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]),
  ]);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    notificationHandler(); // init the method on state of the application
  }

//create a method that handles notification
  void notificationHandler() {
    // ignore: unused_local_variable
    FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
    FirebaseMessaging.onMessage.listen((event) async {
      await NotificationApi.pushNotification(event);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShopBloc(),
      child: MaterialApp.router(
        routerConfig: router,
        debugShowCheckedModeBanner: false,
        theme: Themes.light,
        locale: const Locale('fr'),
        title: 'Woocomoerce Dashboard C',
      ),
    );
  }
}
