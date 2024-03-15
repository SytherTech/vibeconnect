import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../lang/app_text.dart';
import '../views/auth/login_view.dart';
import '../views/auth/register_view.dart';
import '../widgets/button_widget.dart';

import '../utils/styles.dart';

class StarterScreen extends StatelessWidget {
  const StarterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: const BoxDecoration(
      //     gradient: LinearGradient(colors: [
      //   Color(Style.PRIMARY_COLOR),
      //   Color(Style.SECONDARY_COLOR),
      // ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
      child: Scaffold(
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
<<<<<<< HEAD
                        text: "Sign In",
                        color: const [Color(0xff8A5ED4), Color(0xff8A5ED4)],
=======
                        text: AppText.signIn.tr,
                        color: const [Color(0xff8767DA), Color(0xff943CBD)],
>>>>>>> 4f893d14962d21f62a56b75e5d1ec2ed9924e446
                        borderRadius: 15),
                    const SizedBox(
                      height: 10,
                    ),
                    ButtonWidget(
                        onpressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const RegisterScreen(),
                              ));
                        },
                        text: AppText.createAnAccount.tr,
                        color: const [
                          Color.fromARGB(172, 14, 84, 235),
                          Color(0xff592acd),
                        ],
                        borderRadius: 15),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
