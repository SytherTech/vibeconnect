import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
<<<<<<< HEAD
import 'package:vibeconnect/utils/styles.dart';
=======
import 'package:vibe_connect/utils/styles.dart';
>>>>>>> abidev

class SendChatWidget extends StatefulWidget {
  final Function(String, File?) sendMessage;

  SendChatWidget({required this.sendMessage});

  @override
  _SendChatWidgetState createState() => _SendChatWidgetState();
}

class _SendChatWidgetState extends State<SendChatWidget> {
  final TextEditingController _messageController = TextEditingController();
  File? _imageFile;

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    setState(() {
      _imageFile = File(pickedFile!.path);
    });
  }

  Widget _buildImagePickerButton() {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return SafeArea(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    leading: const Icon(Icons.camera_alt),
                    title: const Text('Take a photo'),
                    onTap: () {
                      _pickImage(ImageSource.camera);
                      Navigator.of(context).pop();
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.photo_library),
                    title: const Text('Choose from gallery'),
                    onTap: () {
                      _pickImage(ImageSource.gallery);
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            );
          },
        );
      },
      child: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
        ),
        padding: const EdgeInsets.all(8.0),
        child: const Icon(Icons.photo_library_outlined),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 233, 233, 233),
        borderRadius: BorderRadius.circular(50.0),
      ),
      margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        children: <Widget>[
          _imageFile == null
              ? _buildImagePickerButton()
              : InkWell(
                  onTap: () {
                    setState(() {
                      _imageFile = null;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.0),
                      image: DecorationImage(
                        image: FileImage(_imageFile!),
                        fit: BoxFit.cover,
                      ),
                    ),
                    width: 50.0,
                    height: 50.0,
                    child: const Icon(
                      Icons.close,
                      color: Colors.white,
                      size: 20.0,
                    ),
                  ),
                ),
          Expanded(
            child: TextField(
              controller: _messageController,
              decoration: InputDecoration(
                hintText: 'Type your message...',
                hintStyle: GoogleFonts.roboto(),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
              ),
            ),
          ),
          SizedBox(width: 8.0),
          Container(
            padding: EdgeInsets.all(2),
            height: 50,
            width: 50,
            child: FloatingActionButton(
              onPressed: () {
                widget.sendMessage(_messageController.text, _imageFile);
                _messageController.clear();
                setState(() {
                  _imageFile = null;
                });
              },
              backgroundColor: Color(0xff8864D8),
              child: const Icon(
                Icons.send,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
