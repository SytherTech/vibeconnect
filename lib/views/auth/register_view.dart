import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../../../utils/styles.dart';
import '../../../widgets/button_widget.dart';
import '../../../widgets/textfield_widget.dart';
import 'package:image_picker/image_picker.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

enum Gender { Male, Female, Others }

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController ageController = TextEditingController();

  DateTime? selectedDate;

  File? _image;

  // Function to open the image picker dialog
  Future<void> _pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = (await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    ))!;
    final DateFormat dateFormat = DateFormat('MMMM d, y');
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        ageController.text = dateFormat.format(selectedDate as DateTime);
      });
    }
  }

  Gender? selectedGender;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Create An Account",
          style: GoogleFonts.varelaRound(color: Colors.white),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(Style.PRIMARY_COLOR),
                Color(Style.SECONDARY_COLOR)
              ], // Set your gradient colors
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: SvgPicture.asset("assets/svg/arrow_left.svg")),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 50,
            ),
            Stack(
              children: [
                Image.asset(
                  "assets/png/float.png",
                  height: 140,
                ),
                Container(
                  height: 140,
                  width: 140,
                  decoration: BoxDecoration(
                      image: _image == null
                          ? null
                          : DecorationImage(
                              image: FileImage(File(_image!.path))),
                      color: Color(0xffE4E4E4),
                      shape: BoxShape.circle),
                  child: Center(
                    child: IconButton(
                      onPressed: () => _showPicker(context),
                      icon: SvgPicture.asset("assets/svg/camera.svg"),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            TextFieldWidget(
                controller: nameController,
                hintText: "Full Name",
                svgPath: "assets/svg/person.svg",
                isPassword: false),
            const SizedBox(
              height: 10,
            ),
            TextFieldWidget(
                controller: emailController,
                hintText: "Email",
                svgPath: "assets/svg/email.svg",
                isPassword: false),
            const SizedBox(
              height: 10,
            ),
            TextFieldWidget(
                controller: passwordController,
                hintText: "Password",
                svgPath: "assets/svg/password.svg",
                isPassword: true),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () => _selectDate(context),
              child: TextFieldWidget(
                  canEdit: false,
                  controller: ageController,
                  hintText: "Age",
                  svgPath: "assets/svg/age.svg",
                  isPassword: false),
            ),
            const SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child:
                  Text('Gender', style: GoogleFonts.varelaRound(fontSize: 16)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: RadioListTile<Gender>(
                    title: Text(
                      'Male',
                      style: TextStyle(fontSize: 14),
                    ),
                    value: Gender.Male,
                    groupValue: selectedGender,
                    onChanged: (Gender? value) {
                      setState(() {
                        selectedGender = value;
                      });
                    },
                    contentPadding: EdgeInsets.zero,
                    activeColor: Color(
                        0xff8A5ED4), // Set the radio button color to purple
                  ),
                ),
                Expanded(
                  child: RadioListTile<Gender>(
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      'Female',
                      style: TextStyle(fontSize: 14),
                    ),
                    value: Gender.Female,
                    groupValue: selectedGender,
                    onChanged: (Gender? value) {
                      setState(() {
                        selectedGender = value;
                      });
                    },
                    activeColor: Color(
                        0xff8A5ED4), // Set the radio button color to purple
                  ),
                ),
                Expanded(
                  child: RadioListTile<Gender>(
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      'Others',
                      style: TextStyle(fontSize: 14),
                    ),
                    value: Gender.Others,
                    groupValue: selectedGender,
                    onChanged: (Gender? value) {
                      setState(() {
                        selectedGender = value;
                      });
                    },
                    activeColor: Color(
                        0xff8A5ED4), // Set the radio button color to purple
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ButtonWidget(
                  onpressed: () {},
                  text: "Register",
                  color: [Color(0xff8A5ED4), Color(0xff8A5ED4)],
                  borderRadius: 15),
            ),
          ],
        ),
      ),
    );
  }

  void _showPicker(context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.photo_library),
                title: Text('Gallery'),
                onTap: () {
                  _pickImage(ImageSource.gallery);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: Icon(Icons.photo_camera),
                title: Text('Camera'),
                onTap: () {
                  _pickImage(ImageSource.camera);
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
