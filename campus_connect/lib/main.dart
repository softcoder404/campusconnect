import 'package:bot_toast/bot_toast.dart';
import 'package:campus_connect/presentation/config/routes/app.routes.dart';
import 'package:campus_connect/presentation/config/themes/colors.dart';
import 'package:campus_connect/presentation/config/themes/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: black,
  ));
  runApp(BaseApp());
}

class BaseApp extends StatelessWidget {
  const BaseApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: theme(context),
      builder: BotToastInit(),
      navigatorObservers: [BotToastNavigatorObserver()],
      title: 'School Connect',
      initialRoute: '/splash',
      getPages: AppRoutes.getRoutes(),
    );
  }
}
