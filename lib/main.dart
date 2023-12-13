import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vibeconnect/controller/chat_controller.dart';
import 'package:vibeconnect/controller/event_controller.dart';
import 'package:vibeconnect/controller/user_controller.dart';
import 'package:vibeconnect/utils/styles.dart';
import 'package:vibeconnect/views/splash.dart';

import 'lang/translation_services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? savedLocale = prefs.getString("loc");
  savedLocale ??= 'en';
  runApp(MyApp(
    savedLocale: savedLocale,
  ));
}

class MyApp extends StatelessWidget {
  final String savedLocale;
  const MyApp({super.key, required this.savedLocale});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Locale locale = Locale(savedLocale);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => EventController(),
        ),
        ChangeNotifierProvider(
          create: (context) => UserController(),
        ),
        ChangeNotifierProvider(
          create: (context) => ChatMessageProvider(),
        )
      ],
      child: GetMaterialApp(
        translations: TranslationSerivce(),
        locale: locale,
        fallbackLocale: const Locale('en', 'US'),
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme:
              ColorScheme.fromSeed(seedColor: Color(Style.SECONDARY_COLOR)),
          useMaterial3: true,
        ),
        home: SplashScreen(),
      ),
    );
  }
}
