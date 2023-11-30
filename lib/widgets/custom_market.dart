import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:vibe_connect/model/event_model.dart';
import 'package:vibe_connect/model/user_model.dart';
import 'package:vibe_connect/utils/styles.dart';

import 'dart:ui' as ui;

class CustomMarker extends StatelessWidget {
  final UserModel user;

  const CustomMarker({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      width: 75,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              width: 40, // Set the width of the container
              height: 30, // Set the height of the container
              child: CustomPaint(
                painter: InvertedConeShapePainter(),
              ),
            ),
          ),
          Container(
            width: 60, // Set the width of the outer circle
            height: 60, // Set the height of the outer circle
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [Color(0xff501CA0), Color(0xff6B1E8F)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Center(
              child: ClipOval(
                child: Container(
                  width: 50, // Set the width of the inner circle
                  height: 50, // Set the height of the inner circle
                  color: Colors.white, // Background color of the inner circle
                  child: Center(
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 70, // Set the radius of the image circle
                      backgroundImage: NetworkImage(
                          user.imgUrl.toString()), // Replace with your image
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class InvertedConeShapePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromPoints(Offset(0, 0), Offset(size.width, size.height));
    Paint paint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0xff501CA0),
          Color(0xff6B1E8F)
        ], // Set the gradient colors
      ).createShader(rect);

    final path = Path()
      ..moveTo(size.width / 2, size.height) // Starting point at the bottom
      ..lineTo(0, 0) // Draw a line to the top left corner
      ..lineTo(size.width, 0) // Draw a line to the top right corner
      ..close(); // Close the path to complete the cone shape

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
