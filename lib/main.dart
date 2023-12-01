import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
<<<<<<< HEAD
import 'package:vibeconnect/controller/chat_controller.dart';
import 'package:vibeconnect/controller/event_controller.dart';
import 'package:vibeconnect/controller/user_controller.dart';
import 'package:vibeconnect/utils/styles.dart';
import 'package:vibeconnect/views/splash.dart';
=======
import 'package:vibe_connect/controller/chat_controller.dart';
import 'package:vibe_connect/controller/event_controller.dart';
import 'package:vibe_connect/controller/user_controller.dart';
import 'package:vibe_connect/utils/styles.dart';
import 'package:vibe_connect/views/splash.dart';
>>>>>>> abidev

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
          // This is the theme of your application.
          //
          // TRY THIS: Try running your application with "flutter run". You'll see
          // the application has a blue toolbar. Then, without quitting the app,
          // try changing the seedColor in the colorScheme below to Colors.green
          // and then invoke "hot reload" (save your changes or press the "hot
          // reload" button in a Flutter-supported IDE, or press "r" if you used
          // the command line to start the app).
          //
          // Notice that the counter didn't reset back to zero; the application
          // state is not lost during the reload. To reset the state, use hot
          // restart instead.
          //
          // This works for code too, not just values: Most code changes can be
          // tested with just a hot reload.
          colorScheme:
              ColorScheme.fromSeed(seedColor: Color(Style.SECONDARY_COLOR)),
          useMaterial3: true,
        ),
        home: SplashScreen(),
      ),
    );
  }
}
