import 'package:flutter/material.dart';
import 'package:vibeconnect/views/auth/login_view.dart';
import 'package:vibeconnect/views/auth/register_view.dart';
import 'package:vibeconnect/widgets/button_widget.dart';

import '../utils/styles.dart';

class StarterScreen extends StatelessWidget {
  const StarterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        Color(Style.PRIMARY_COLOR),
        Color(Style.SECONDARY_COLOR),
      ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                child: Image.asset(
                  "assets/png/logo.png",
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(
                    left: 10, right: 10, bottom: 40, top: 50),
                child: Column(
                  children: [
                    ButtonWidget(
                        onpressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginScreen(),
                              ));
                        },
                        text: "Sign In",
                        color: [Color(0xff24008B), Color(0xff24008B)],
                        borderRadius: 15),
                    const SizedBox(
                      height: 10,
                    ),
                    ButtonWidget(
                        onpressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RegisterScreen(),
                              ));
                        },
                        text: "Create An Account",
                        color: [Color(0xff1B1A1A), Color(0xff1B1A1A)],
                        borderRadius: 15),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
