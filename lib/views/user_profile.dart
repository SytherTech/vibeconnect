import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:vibeconnect/utils/userdata.dart';
import '../controller/user_controller.dart';
import '../lang/app_text.dart';
import '../model/user_model.dart';
import '../widgets/button_widget.dart';

import '../../utils/styles.dart';
import '../widgets/fullscreen_photo_view.dart';

class MyProfileView extends StatefulWidget {
  @override
  State<MyProfileView> createState() => _MyProfileViewState();
}

class _MyProfileViewState extends State<MyProfileView> {
  bool showFullText = false;

  @override
  Widget build(BuildContext context) {
    var userModel = UserData().users[0];
    var deviceHeight = MediaQuery.of(context).size.height;
    var deviceWidth = MediaQuery.of(context).size.width;
    String displayedText = showFullText
        ? userModel.about.toString()
        : userModel.about.toString().substring(0, 100) +
            (userModel.about.toString().length > 100 ? "..." : "");
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            title: Text(
              '@ ${userModel.name}',
              style: GoogleFonts.varelaRound(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            centerTitle: true,
            actions: [
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  "assets/svg/drawer.svg",
                  color: Color(Style.MAIN_COLOR),
                  height: 35,
                  fit: BoxFit.cover,
                ),
              ),
            ],
            // title: TextButton(
            //   onPressed: () {},
            //   child: Text(
            //     "My Profile",
            //     style: GoogleFonts.varelaRound(color: Colors.white, fontSize: 18),
            //   ),
            // ),
            // flexibleSpace: Container(
            //   decoration: const BoxDecoration(
            //     gradient: LinearGradient(
            //       colors: [
            //         Color(Style.PRIMARY_COLOR),
            //         Color(Style.SECONDARY_COLOR)
            //       ], // Set your gradient colors
            //       begin: Alignment.topLeft,
            //       end: Alignment.bottomRight,
            //     ),
            //   ),
            // ),
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Color(Style.MAIN_COLOR),
              ),
            )),
        body: GestureDetector(
          onHorizontalDragEnd: (details) {
            if (details.primaryVelocity! > 0) {
              Navigator.pop(context);
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Stack(
                          children: [
                            Image.asset(
                              "assets/png/float.png",
                              height: 150,
                            ),
                            Positioned(
                              child: CircleAvatar(
                                radius: 75,

                                backgroundImage: NetworkImage(userModel
                                    .imgUrl![0]
                                    .toString()), // Replace with your image asset
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: deviceWidth * .05,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                Text(
                                  "26",
                                  style: GoogleFonts.varelaRound(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Meet',
                                  style: GoogleFonts.varelaRound(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: deviceHeight * .06,
                            ),
                            Column(
                              children: [
                                Text(
                                  "1123",
                                  style: GoogleFonts.varelaRound(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  AppText.vibe.tr,
                                  style: GoogleFonts.varelaRound(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppText.age.tr,
                      style: GoogleFonts.varelaRound(
                          fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      '${userModel.age}',
                      style: GoogleFonts.varelaRound(
                          fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      width: deviceWidth * .1,
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Column(
                  children: [
                    Text(
                      displayedText,
                      style: GoogleFonts.varelaRound(
                        fontSize: 12,
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          setState(() {
                            showFullText = !showFullText;
                          });
                        },
                        child: showFullText
                            ? Text(
                                "Less",
                                style: TextStyle(color: Color(0xff8A5ED4)),
                              )
                            : Text(
                                "More",
                                style: TextStyle(color: Color(0xff8A5ED4)),
                              ))
                  ],
                ),
                // SizedBox(height: 5),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.start,
                //   children: [
                //     Text(
                //       'More Photos',
                //       style: GoogleFonts.varelaRound(
                //         fontSize: 18,
                //       ),
                //     ),
                //   ],
                // ),
                const SizedBox(
                  height: 15,
                ),
                Expanded(
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 2.0,
                            mainAxisSpacing: 3.0,
                            mainAxisExtent: 110),
                    itemCount: userModel.imgUrl!
                        .length, // Replace with the number of images you have
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FullScreenPhotoView(
                                photoUrl: userModel.imgUrl![index]
                                    .toString(), // Update with your image URL
                              ),
                            ),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
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
                            child: Hero(
                              tag: 'photo$index',
                              child: Image.network(
                                userModel.imgUrl![index]
                                    .toString(), // Replace with your image URL
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
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
        //             GoogleFonts.varelaRound(fontSize: 16, fontWeight: FontWeight.w600),
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
        //                     style: GoogleFonts.varelaRound(
        //                         fontWeight: FontWeight.w600, fontSize: 15),
        //                   ),
        //                   const SizedBox(
        //                     height: 5,
        //                   ),
        //                   Text(
        //                     userModel.name.toString(),
        //                     style: GoogleFonts.varelaRound(fontSize: 15),
        //                   )
        //                 ],
        //               ),
        //               Column(
        //                 crossAxisAlignment: CrossAxisAlignment.start,
        //                 children: [
        //                   Text(
        //                     "Age",
        //                     style: GoogleFonts.varelaRound(
        //                         fontWeight: FontWeight.w600, fontSize: 15),
        //                   ),
        //                   const SizedBox(
        //                     height: 5,
        //                   ),
        //                   Text(
        //                     "${userModel.age.toString()} Years Old",
        //                     style: GoogleFonts.varelaRound(fontSize: 15),
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
        //             style: GoogleFonts.varelaRound(
        //                 fontWeight: FontWeight.w600, fontSize: 15),
        //           ),
        //           const SizedBox(
        //             height: 10,
        //           ),
        //           Text(
        //             userModel.about.toString(),
        //             style: GoogleFonts.varelaRound(),
        //             textAlign: TextAlign.start,
        //           ),
        //         ],
        //       )
        //     ]),
        //   ),
        // ),
      ),
    );
  }
}
