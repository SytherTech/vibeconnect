import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import '../../../model/event_model.dart';
import '../../../views/home/profile_view.dart';
import '../../../utils/styles.dart';
import '../../../utils/userdata.dart';
import '../../../widgets/button_widget.dart';

class EventDetailSceen extends StatelessWidget {
  final EventModel eventModel;
  const EventDetailSceen({super.key, required this.eventModel});

  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: () {},
              child: Text(
                "Join Request",
                style: GoogleFonts.roboto(color: Colors.white),
              ))
        ],
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Container(
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.width / 2,
                ),
                child: FlutterCarousel(
                    options: CarouselOptions(
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 3),
                      disableCenter: true,
                      viewportFraction: deviceSize.width > 800.0 ? 0.8 : 1.0,
                      height: deviceSize.height * 0.45,
                      enableInfiniteScroll: true,
                      slideIndicator: const CircularSlideIndicator(
                          indicatorBackgroundColor: Colors.white,
                          currentIndicatorColor: Colors.black),
                    ),
                    items: eventModel.eventImages!
                        .map((e) => Image.network(
                              e,
                              fit: BoxFit.fitWidth,
                            ))
                        .toList()),
              ),
            ),
            const SizedBox(
              height: 7,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Event Owner",
                    style: GoogleFonts.roboto(
                        fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        height: 80,
                        width: 90,
                        child: Image.network(
                          UserData()
                              .users
                              .where(
                                  (element) => element.id == eventModel.ownerId)
                              .first
                              .imgUrl![0]
                              .toString(),
                          fit: BoxFit.fill,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            UserData()
                                .users
                                .where((element) =>
                                    element.id == eventModel.ownerId)
                                .first
                                .name
                                .toString(),
                            style: GoogleFonts.roboto(
                                fontSize: 16, fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 31,
                            width: 120,
                            child: ButtonWidget(
                                onpressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ProfileViewScreen(
                                            userModel: UserData()
                                                .users
                                                .where((element) =>
                                                    element.id ==
                                                    eventModel.ownerId)
                                                .first),
                                      ));
                                },
                                text: "View Profile",
                                color: [Color(0xff8A5ED4), Color(0xff9245C4)],
                                borderRadius: 0,
                                buttonTextSize: 12),
                          )
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    "Event Details",
                    style: GoogleFonts.roboto(
                        fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  Text(
                    eventModel.longDes.toString(),
                    style: GoogleFonts.roboto(),
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Timings",
                            style: GoogleFonts.roboto(
                                fontSize: 14, fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                              "${eventModel.startTime} To ${eventModel.endTime}")
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Event Type",
                            style: GoogleFonts.roboto(
                                fontSize: 12, fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text("${eventModel.category}")
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "People Who Joined",
                        style: GoogleFonts.roboto(
                            fontSize: 14, fontWeight: FontWeight.w600),
                      ),
                      Row(
                        children: [
                          SvgPicture.asset("assets/svg/group.svg"),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            "${eventModel.joinedUser!.length}/${eventModel.userLimit}",
                            style: GoogleFonts.roboto(
                                fontSize: 14, fontWeight: FontWeight.w700),
                          )
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
                      children: eventModel.joinedUser!.length == 0
                          ? [
                              const SizedBox(
                                height: 50,
                              ),
                              Center(
                                child: Text(
                                  "No User Joined Yet",
                                  style: GoogleFonts.roboto(
                                      color: Colors.grey[600]),
                                ),
                              )
                            ]
                          : eventModel.joinedUser!
                              .map((e) => Padding(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          height: 80,
                                          width: 90,
                                          child: Image.network(
                                            UserData()
                                                .users
                                                .where((element) =>
                                                    element.id == e.id)
                                                .first
                                                .imgUrl
                                                .toString(),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              UserData()
                                                  .users
                                                  .where((element) =>
                                                      element.id == e.id)
                                                  .first
                                                  .name
                                                  .toString(),
                                              style: GoogleFonts.roboto(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            SizedBox(
                                              width: deviceSize.width / 1.5,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  SizedBox(
                                                    height: 31,
                                                    width: 120,
                                                    child: ButtonWidget(
                                                        onpressed: () {
                                                          Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                builder: (context) => ProfileViewScreen(
                                                                    userModel: UserData()
                                                                        .users
                                                                        .where((element) =>
                                                                            element.id ==
                                                                            e.id)
                                                                        .first),
                                                              ));
                                                        },
                                                        text: "View Profile",
                                                        color: [
                                                          Color(0xff8A5ED4),
                                                          Color(0xff9245C4)
                                                        ],
                                                        borderRadius: 0,
                                                        buttonTextSize: 12),
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ))
                              .toList())
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
