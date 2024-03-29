import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vibeconnect/lang/app_text.dart';
import 'package:vibeconnect/views/home/views/location.dart';
import '../../../views/home/home_view.dart';
import '../../../widgets/button_widget.dart';
import '../../../widgets/textfield_widget.dart';

import '../../utils/styles.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            // Container(
            //   decoration: const BoxDecoration(
            //       gradient: LinearGradient(colors: [
            //     Color(Style.PRIMARY_COLOR),
            //     Color(Style.SECONDARY_COLOR),
            //   ], begin: Alignment.topLeft, end: Alignment.centerRight)),
            //   height: size.height,
            //   width: size.width,
            // ),
            Container(
              margin: const EdgeInsets.only(top: 50),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15))),
              height: size.height,
              width: size.width,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 320,
                      width: 320,
                      child: Image.asset(
                        "assets/png/logo.png",
                        fit: BoxFit.fill,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Text(
                          //   "Login To Join The Amazing Adventures !",
                          //   style: GoogleFonts.varelaRound(
                          //       fontSize: 24, fontWeight: FontWeight.w700),
                          //   textAlign: TextAlign.start,
                          // ),
                          // const SizedBox(
                          //   height: 20,
                          // ),
                          TextFieldWidget(
                            isPassword: false,
                            controller: _emailController,
                            hintText: "Email",
                            svgPath: "assets/svg/email.svg",
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFieldWidget(
                              isPassword: true,
                              controller: _passwordController,
                              hintText: AppText.password.tr,
                              svgPath: "assets/svg/password.svg"),
                          const SizedBox(
                            height: 5,
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: () {},
                              child: Text(
                                AppText.forgotPassword.tr,
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ButtonWidget(
                              onpressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => LocationScreen(),
                                    ));
                              },
                              text: "Login",
                              color: [Color(0xff8A5ED4), Color(0xff8A5ED4)],
                              borderRadius: 15),
                          const SizedBox(
                            height: 80,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                AppText.doHaveAnAccount.tr,
                                style: GoogleFonts.varelaRound(fontSize: 14),
                              ),
                              Text(
                                AppText.registerHere.tr,
                                style: GoogleFonts.varelaRound(
                                    fontSize: 14, fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
