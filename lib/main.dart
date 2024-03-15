import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vibeconnect/controller/chat_controller.dart';
import 'package:vibeconnect/controller/event_controller.dart';
import 'package:vibeconnect/controller/user_controller.dart';
import 'package:vibeconnect/utils/styles.dart';
import 'package:vibeconnect/views/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
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
      child: MaterialApp(
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
