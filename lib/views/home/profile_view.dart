import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../model/user_model.dart';

import '../../utils/styles.dart';
import '../../widgets/button_widget.dart';
import '../../widgets/fullscreen_photo_view.dart';

class ProfileViewScreen extends StatelessWidget {
  final UserModel userModel;
  const ProfileViewScreen({super.key, required this.userModel});

  @override
  Widget build(BuildContext context) {
    var deviceWidth = MediaQuery.of(context).size.width;
    var deviceHeight = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: TextButton(
            onPressed: () {},
            child: Text(
              "@ ${userModel.name}",
              style: GoogleFonts.lexend(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
            )),
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
        // leading: IconButton(
        //   onPressed: () {
        //     Navigator.pop(context);
        //   },
        //   icon: SvgPicture.asset("assets/svg/arrow_left.svg"),
        //   color: Colors.black,
        //   disabledColor: Colors.black,
        // ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
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
                    radius: 60,

                    backgroundImage: NetworkImage(userModel.imgUrl![0]
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
                // CircleAvatar(
                //   radius: 50,
                //   backgroundImage: NetworkImage(userModel.imgUrl![0]
                //       .toString()), // Replace with your image asset
                // ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Row(
                    //   children: [
                    //     RatingBar.builder(
                    //       initialRating: 3,
                    //       minRating: 1,
                    //       direction: Axis.horizontal,
                    //       allowHalfRating: true,
                    //       itemCount: 5,
                    //       itemSize: 12,
                    //       itemPadding:
                    //           const EdgeInsets.symmetric(horizontal: 1.0),
                    //       itemBuilder: (context, _) => const Icon(
                    //         Icons.star,
                    //         color: Colors.amber,
                    //       ),
                    //       onRatingUpdate: (rating) {
                    //         print(rating);
                    //       },
                    //     ),
                    //     const SizedBox(width: 4),
                    //     const Text(
                    //       '(4.5 Reviews)',
                    //       style: TextStyle(
                    //         fontSize: 14,
                    //         color: Colors.grey,
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    const SizedBox(
                      height: 4,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Text(
                              "26",
                              style: GoogleFonts.lato(
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              'Meet',
                              style: GoogleFonts.lato(
                                  fontSize: 16, fontWeight: FontWeight.w700),
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
                              style: GoogleFonts.lato(fontSize: 14),
                            ),
                            const SizedBox(
                              height: 1,
                            ),
                            Text(
                              'Connections',
                              style: GoogleFonts.lato(
                                  fontSize: 16, fontWeight: FontWeight.w700),
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
                              style: GoogleFonts.lato(
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              'Vibe',
                              style: GoogleFonts.lato(
                                  fontSize: 16, fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     CircleAvatar(
            //       radius: 60,
            //       backgroundImage: NetworkImage(userModel.imgUrl.toString()),
            //     ),
            //     Column(
            //       children: [
            //         Text(
            //           'Age',
            //           style: GoogleFonts.lato(
            //               fontSize: 18, fontWeight: FontWeight.w700),
            //         ),
            //         const SizedBox(height: 10),
            //         Text(
            //           userModel.age.toString(),
            //           style: GoogleFonts.lato(fontSize: 18),
            //         ),
            //       ],
            //     ),
            //     Column(
            //       children: [
            //         Text(
            //           'Likes',
            //           style: GoogleFonts.lato(
            //               fontSize: 18, fontWeight: FontWeight.w700),
            //         ),
            //         const SizedBox(height: 10),
            //         Text(
            //           userModel.likes.toString(),
            //           style: GoogleFonts.lato(fontSize: 18),
            //         ),
            //       ],
            //     ),
            //     GestureDetector(
            //       onTap: () {
            //         // Add functionality here when the like icon is tapped
            //         // For example, toggle like state, increment likes count, etc.
            //       },
            //       child: Container(
            //         padding: const EdgeInsets.all(8),
            //         decoration: BoxDecoration(
            //           shape: BoxShape.circle,
            //           color: Colors.grey.withOpacity(0.3),
            //         ),
            //         child: const Icon(
            //           Icons.thumb_up_alt_outlined,
            //           color: Colors.black,
            //           size: 30,
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
            const SizedBox(height: 20),
            Row(
              children: [
                Text(
                  'Age  ',
                  style: GoogleFonts.lato(
                      fontSize: 18, fontWeight: FontWeight.w600),
                ),
                Text(
                  '${userModel.age}',
                  style: GoogleFonts.lato(
                      fontSize: 18, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  width: deviceWidth * .1,
                ),
              ],
            ),
            const SizedBox(height: 5),
            Text(
              userModel.about.toString(),
              style: GoogleFonts.lato(
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 10),
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
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 8.0,
                    mainAxisExtent: 110),
                itemCount: userModel.imgUrl!
                    .length, // Replace with the number of images you have
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FullScreenPhotoView(
                            photoUrl: userModel.imgUrl![index].toString(),
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
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.network(
                          userModel.imgUrl![index]
                              .toString(), // Replace with your image assets
                          fit: BoxFit.cover,
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
      // body: Padding(
      //   padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      //   child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      //     Container(
      //         height: 160,
      //         width: 160,
      //         decoration: BoxDecoration(
      //             shape: BoxShape.circle,
      //             image: DecorationImage(
      //                 image: NetworkImage(userModel.imgUrl.toString()),
      //                 fit: BoxFit.fill))),
      //     const SizedBox(
      //       height: 5,
      //     ),
      //     Text(
      //       "Likes : ${userModel.likes}",
      //       style:
      //           GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.w600),
      //     ),
      //     const SizedBox(
      //       height: 15,
      //     ),
      //     Column(
      //       crossAxisAlignment: CrossAxisAlignment.start,
      //       children: [
      //         Row(
      //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //           children: [
      //             Column(
      //               crossAxisAlignment: CrossAxisAlignment.start,
      //               children: [
      //                 Text(
      //                   "Name",
      //                   style: GoogleFonts.roboto(
      //                       fontWeight: FontWeight.w600, fontSize: 15),
      //                 ),
      //                 const SizedBox(
      //                   height: 5,
      //                 ),
      //                 Text(
      //                   userModel.name.toString(),
      //                   style: GoogleFonts.roboto(fontSize: 15),
      //                 )
      //               ],
      //             ),
      //             Column(
      //               crossAxisAlignment: CrossAxisAlignment.start,
      //               children: [
      //                 Text(
      //                   "Age",
      //                   style: GoogleFonts.roboto(
      //                       fontWeight: FontWeight.w600, fontSize: 15),
      //                 ),
      //                 const SizedBox(
      //                   height: 5,
      //                 ),
      //                 Text(
      //                   "${userModel.age.toString()} Years Old",
      //                   style: GoogleFonts.roboto(fontSize: 15),
      //                 )
      //               ],
      //             ),
      //           ],
      //         ),
      //         const SizedBox(
      //           height: 25,
      //         ),
      //         Text(
      //           "About",
      //           style: GoogleFonts.roboto(
      //               fontWeight: FontWeight.w600, fontSize: 15),
      //         ),
      //         const SizedBox(
      //           height: 10,
      //         ),
      //         Text(
      //           userModel.about.toString(),
      //           style: GoogleFonts.roboto(),
      //           textAlign: TextAlign.start,
      //         ),
      //         const SizedBox(
      //           height: 15,
      //         ),
      //         ButtonWidget(
      //             onpressed: () {},
      //             text: 'Like',
      //             color: [Color(0xff8767DA), Color(0xff943CBD)],
      //             borderRadius: 15)
      //       ],
      //     )
      //   ]),
      // ),
    );
  }
}
