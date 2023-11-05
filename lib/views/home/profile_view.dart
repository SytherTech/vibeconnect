import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vibeconnect/model/user_model.dart';
import 'package:vibeconnect/widgets/button_widget.dart';

import '../../utils/styles.dart';

class ProfileViewScreen extends StatelessWidget {
  final UserModel userModel;
  const ProfileViewScreen({super.key, required this.userModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextButton(
            onPressed: () {},
            child: Text(
              "Viewing ${userModel.name}'s Profile",
              style: GoogleFonts.roboto(color: Colors.white),
            )),
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
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Container(
              height: 160,
              width: 160,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: NetworkImage(userModel.imgUrl.toString()),
                      fit: BoxFit.fill))),
          const SizedBox(
            height: 5,
          ),
          Text(
            "Likes : ${userModel.likes}",
            style:
                GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 15,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Name",
                        style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w600, fontSize: 15),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        userModel.name.toString(),
                        style: GoogleFonts.roboto(fontSize: 15),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Age",
                        style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w600, fontSize: 15),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "${userModel.age.toString()} Years Old",
                        style: GoogleFonts.roboto(fontSize: 15),
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              Text(
                "About",
                style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w600, fontSize: 15),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                userModel.about.toString(),
                style: GoogleFonts.roboto(),
                textAlign: TextAlign.start,
              ),
              const SizedBox(
                height: 15,
              ),
              ButtonWidget(
                  onpressed: () {},
                  text: 'Like',
                  color: [Color(0xff8767DA), Color(0xff943CBD)],
                  borderRadius: 15)
            ],
          )
        ]),
      ),
    );
  }
}
