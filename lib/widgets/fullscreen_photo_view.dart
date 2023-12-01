import 'package:flutter/material.dart';

class FullScreenPhotoView extends StatelessWidget {
  final String photoUrl;

  const FullScreenPhotoView({required this.photoUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.clear),
        ),
      ),
      body: GestureDetector(
        onTap: () {},
        child: Center(
          child: Hero(
            tag: 'photoPath',
            child: Image.network(
              photoUrl,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
