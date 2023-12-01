import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
<<<<<<< HEAD
import 'package:vibeconnect/utils/styles.dart';
import 'package:vibeconnect/views/starter_view.dart';
=======
import 'package:vibe_connect/utils/styles.dart';
import 'package:vibe_connect/views/starter_view.dart';
>>>>>>> abidev

import '../controller/event_controller.dart';
import '../controller/user_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    Future.delayed(Duration(seconds: 3)).then((value) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => StarterScreen(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
        Color(Style.PRIMARY_COLOR),
        Color(Style.SECONDARY_COLOR),
      ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Image.asset("assets/png/logo.png")],
        ),
      ),
    );
  }
}
