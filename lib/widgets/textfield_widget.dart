import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/styles.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    required this.controller,
    required this.hintText,
    required this.svgPath,
    required this.isPassword,
    this.canEdit = true,
    this.hintsize = 14,
  });
  final TextEditingController controller;
  final String hintText;
  final String svgPath;
  final bool isPassword;
  final bool canEdit;
  final double hintsize;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color(0xffEFEFEF), borderRadius: BorderRadius.circular(18)),
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: TextField(
        obscureText: isPassword,
        controller: controller,
        style: TextStyle(fontSize: hintsize),
        cursorColor: const Color(Style.PRIMARY_COLOR),
        decoration: InputDecoration(
            hintStyle: const TextStyle(fontSize: 14),
            enabled: canEdit,
            prefixIconConstraints:
                const BoxConstraints(minWidth: 60, minHeight: 20),
            contentPadding: const EdgeInsets.only(left: 10),
            hintText: hintText,
            prefixIcon: SvgPicture.asset(
              svgPath,
              color: Color(0xff8A5ED4),
            ),
            border: InputBorder.none),
      ),
    );
  }
}
