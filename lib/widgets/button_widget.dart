import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget(
      {required this.onpressed,
      super.key,
      required this.text,
      required this.color,
      required this.borderRadius,
      this.buttonTextSize = 18});
  final Function()? onpressed;
  final String text;
  final List<Color> color;
  final double borderRadius;
  final double buttonTextSize;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          gradient: LinearGradient(
              colors: color,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter)),
      width: MediaQuery.of(context).size.width, // Set the desired width
      height: 50.0, // Set the desired height

      child: Material(
        borderRadius: BorderRadius.circular(borderRadius),
        color: Colors.transparent,
        child: InkWell(
          splashColor: Colors.black26,
          borderRadius: BorderRadius.circular(borderRadius),
          onTap: onpressed,
          child: Center(
            child: Text(
              text,
              style: GoogleFonts.roboto(
                  fontSize: buttonTextSize, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
