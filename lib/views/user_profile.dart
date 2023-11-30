import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:vibeconnect/controller/user_controller.dart';
import 'package:vibeconnect/model/user_model.dart';
import 'package:vibeconnect/widgets/button_widget.dart';

import '../../utils/styles.dart';

class MyProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var userModel = context.watch<UserController>().userModel;
    return Scaffold(
      appBar: AppBar(
          title: TextButton(
              onPressed: () {},
              child: Text(
                "My Profile",
                style: GoogleFonts.roboto(color: Colors.white, fontSize: 18),
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
          leading: Icon(null)),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage(
                  userModel.imgUrl.toString()), // Replace with your image asset
            ),
            SizedBox(height: 20),
            Text(
              '@${userModel.name}',
              style:
                  GoogleFonts.lato(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text(
                      'Age',
                      style: GoogleFonts.lato(
                          fontSize: 18, fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      userModel.age.toString(),
                      style: GoogleFonts.lato(fontSize: 18),
                    ),
                  ],
                ),
                SizedBox(width: 80),
                Column(
                  children: [
                    Text(
                      'Likes',
                      style: GoogleFonts.lato(
                          fontSize: 18, fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      userModel.likes.toString(),
                      style: GoogleFonts.lato(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'More Photos',
                  style: GoogleFonts.lato(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 8.0,
                    mainAxisExtent: 230),
                itemCount: 6, // Replace with the number of images you have
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.network(
                        userModel.imgUrl
                            .toString(), // Replace with your image assets
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      // body: Padding(
      //   padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      //   child: SingleChildScrollView(
      //     child:
      //         Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      //       Container(
      //           height: 160,
      //           width: 160,
      //           decoration: BoxDecoration(
      //               shape: BoxShape.circle,
      //               image: DecorationImage(
      //                   image: NetworkImage(userModel.imgUrl.toString()),
      //                   fit: BoxFit.fill))),
      //       const SizedBox(
      //         height: 5,
      //       ),
      //       Text(
      //         "Likes : ${userModel.likes}",
      //         style:
      //             GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.w600),
      //       ),
      //       const SizedBox(
      //         height: 15,
      //       ),
      //       Column(
      //         crossAxisAlignment: CrossAxisAlignment.start,
      //         children: [
      //           Row(
      //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //             children: [
      //               Column(
      //                 crossAxisAlignment: CrossAxisAlignment.start,
      //                 children: [
      //                   Text(
      //                     "Name",
      //                     style: GoogleFonts.roboto(
      //                         fontWeight: FontWeight.w600, fontSize: 15),
      //                   ),
      //                   const SizedBox(
      //                     height: 5,
      //                   ),
      //                   Text(
      //                     userModel.name.toString(),
      //                     style: GoogleFonts.roboto(fontSize: 15),
      //                   )
      //                 ],
      //               ),
      //               Column(
      //                 crossAxisAlignment: CrossAxisAlignment.start,
      //                 children: [
      //                   Text(
      //                     "Age",
      //                     style: GoogleFonts.roboto(
      //                         fontWeight: FontWeight.w600, fontSize: 15),
      //                   ),
      //                   const SizedBox(
      //                     height: 5,
      //                   ),
      //                   Text(
      //                     "${userModel.age.toString()} Years Old",
      //                     style: GoogleFonts.roboto(fontSize: 15),
      //                   )
      //                 ],
      //               ),
      //             ],
      //           ),
      //           const SizedBox(
      //             height: 25,
      //           ),
      //           Text(
      //             "About",
      //             style: GoogleFonts.roboto(
      //                 fontWeight: FontWeight.w600, fontSize: 15),
      //           ),
      //           const SizedBox(
      //             height: 10,
      //           ),
      //           Text(
      //             userModel.about.toString(),
      //             style: GoogleFonts.roboto(),
      //             textAlign: TextAlign.start,
      //           ),
      //         ],
      //       )
      //     ]),
      //   ),
      // ),
    );
  }
}
