import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:vibeconnect/utils/userdata.dart';
import '../controller/user_controller.dart';
import '../model/user_model.dart';
import '../widgets/button_widget.dart';

import '../../utils/styles.dart';
import '../widgets/fullscreen_photo_view.dart';

class MyProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var userModel = UserData().users[0];
    var deviceHeight = MediaQuery.of(context).size.height;
    var deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
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
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Row(
                        //   children: [
                        //     // RatingBar.builder(
                        //     //   initialRating: 3,
                        //     //   minRating: 1,
                        //     //   direction: Axis.horizontal,
                        //     //   allowHalfRating: true,
                        //     //   itemCount: 5,
                        //     //   itemSize: 12,
                        //     //   itemPadding:
                        //     //       const EdgeInsets.symmetric(horizontal: 1.0),
                        //     //   itemBuilder: (context, _) => const Icon(
                        //     //     Icons.star,
                        //     //     color: Colors.amber,
                        //     //   ),
                        //     //   onRatingUpdate: (rating) {
                        //     //     print(rating);
                        //     //   },
                        //     // ),
                        //     // const SizedBox(width: 4),
                        //     // const Text(
                        //     //   '(4.5 Reviews)',
                        //     //   style: TextStyle(
                        //     //     fontSize: 14,
                        //     //     color: Colors.grey,
                        //     //   ),
                        //     // ),
                        //   ],
                        // ),
                        Stack(
                          children: [
                            Image.asset(
                              "assets/png/float.png",
                              height: 130,
                            ),
                            Positioned(
                              child: CircleAvatar(
                                radius: 60,

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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Text(
                                  "26",
                                  style: GoogleFonts.varelaRound(
                                    fontSize: 14,
                                  ),
                                ),
                                Text(
                                  'Meet',
                                  style: GoogleFonts.varelaRound(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: deviceHeight * .02,
                            ),
                            Column(
                              children: [
                                Text(
                                  "10k",
                                  style: GoogleFonts.varelaRound(fontSize: 14),
                                ),
                                const SizedBox(
                                  height: 1,
                                ),
                                Text(
                                  'Connections',
                                  style: GoogleFonts.varelaRound(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: deviceWidth * .02,
                            ),
                            Column(
                              children: [
                                Text(
                                  "1123",
                                  style: GoogleFonts.varelaRound(
                                    fontSize: 14,
                                  ),
                                ),
                                Text(
                                  'Vibe',
                                  style: GoogleFonts.varelaRound(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                          ],
                        ),

                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                        //   children: [
                        //     Column(
                        //       children: [
                        //         Text(
                        //           "10k",
                        //           style: GoogleFonts.varelaRound(
                        //               fontSize: 16,
                        //               fontWeight: FontWeight.w600),
                        //         ),
                        //         SvgPicture.asset(
                        //           "assets/svg/connect.svg",
                        //           color: Colors.purple,
                        //         )
                        //         // Text(
                        //         //   'Connetion',
                        //         //   style: GoogleFonts.varelaRound(
                        //         //       fontSize: 16, fontWeight: FontWeight.w700),
                        //         // ),
                        //       ],
                        //     ),
                        //     SizedBox(
                        //       width: deviceHeight * .04,
                        //     ),

                        //     SizedBox(
                        //       width: deviceHeight * .02,
                        //     ),
                        //     // Column(
                        //     //   children: [
                        //     //     Text(
                        //     //       userModel.age.toString(),
                        //     //       style: GoogleFonts.varelaRound(fontSize: 14),
                        //     //     ),
                        //     //     const SizedBox(
                        //     //       height: 1,
                        //     //     ),
                        //     //     Text(
                        //     //       'Age',
                        //     //       style: GoogleFonts.varelaRound(
                        //     //           fontSize: 16, fontWeight: FontWeight.w700),
                        //     //     ),
                        //     //   ],
                        //     // ),
                        //     SizedBox(
                        //       width: deviceWidth * .05,
                        //     ),
                        //     Column(
                        //       children: [
                        //         Text(
                        //           "${userModel.likes.toString()}",
                        //           style: GoogleFonts.varelaRound(
                        //               fontSize: 16,
                        //               fontWeight: FontWeight.w600),
                        //         ),

                        //         SvgPicture.asset(
                        //           "assets/svg/bubble.svg",
                        //           color: Colors.purple,
                        //           fit: BoxFit.cover,
                        //           height: 35,
                        //           width: 35,
                        //         )
                        //         // Text(
                        //         //   'Vibe',
                        //         //   style: GoogleFonts.varelaRound(
                        //         //       fontSize: 16, fontWeight: FontWeight.w700),
                        //         // ),
                        //       ],
                        //     ),
                        //   ],
                        // ),
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 10),
                // Row(
                //   children: [
                //     Text(
                //       '@${userModel.name}',
                //       style: GoogleFonts.varelaRound(
                //         fontSize: 14,
                //         fontWeight: FontWeight.w600,
                //       ),
                //     ),
                //     SizedBox(
                //       width: deviceWidth * .05,
                //     ),
                //   ],
                // ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Age  ',
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
                Text(
                  userModel.about.toString(),
                  style: GoogleFonts.varelaRound(
                    fontSize: 12,
                  ),
                ),
                SizedBox(height: 5),
                // Text(
                //   '@${userModel.name}',
                //   style:
                //       GoogleFonts.varelaRound(fontSize: 18, fontWeight: FontWeight.w600),
                // ),
                // SizedBox(
                //   height: 20,
                // ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     Column(
                //       children: [
                //         Text(
                //           'Age',
                //           style: GoogleFonts.varelaRound(
                //               fontSize: 18, fontWeight: FontWeight.w700),
                //         ),
                //         SizedBox(
                //           height: 10,
                //         ),
                //         Text(
                //           userModel.age.toString(),
                //           style: GoogleFonts.varelaRound(fontSize: 18),
                //         ),
                //       ],
                //     ),
                //     SizedBox(width: 80),
                //     Column(
                //       children: [
                //         Text(
                //           'Likes',
                //           style: GoogleFonts.varelaRound(
                //               fontSize: 18, fontWeight: FontWeight.w700),
                //         ),
                //         SizedBox(
                //           height: 10,
                //         ),
                //         Text(
                //           userModel.likes.toString(),
                //           style: GoogleFonts.varelaRound(
                //             fontSize: 18,
                //           ),
                //         ),
                //       ],
                //     ),
                //   ],
                // ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'More Photos',
                      style: GoogleFonts.varelaRound(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Expanded(
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 10.0,
                            mainAxisSpacing: 8.0,
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
    );
  }
}
