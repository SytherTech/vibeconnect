import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SwitchLanguage extends StatefulWidget {
  const SwitchLanguage({super.key});

  @override
  State<SwitchLanguage> createState() => _SwitchLanguageState();
}

class _SwitchLanguageState extends State<SwitchLanguage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Get.updateLocale(
                    const Locale('ro', 'RO')); // Change to Romanian
                addLocaleRo();
              },
              child: const Text('Change to Romanian'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.updateLocale(const Locale('en', 'US')); // Change to English
                addLocaleUs();
              },
              child: const Text('Change to English'),
            ),
          ],
        ),
      ),
    );
  }

  void addLocaleUs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString("loc", "en");

    print(prefs.getString("loc").toString());
  }

  void addLocaleRo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString("loc", "ro");
    print(prefs.getString("loc").toString());
  }
}
