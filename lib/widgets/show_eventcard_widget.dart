import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vibeconnect/lang/app_text.dart';
import '../model/event_model.dart';
import '../utils/userdata.dart';
import '../views/home/views/event_detail_view.dart';
import '../widgets/button_widget.dart';

class EventCardWidget extends StatefulWidget {
  final EventModel eventModel;

  const EventCardWidget({super.key, required this.eventModel});

  @override
  State<EventCardWidget> createState() => _EventCardWidgetState();
}

class _EventCardWidgetState extends State<EventCardWidget> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Card(
        color: Colors.transparent,
        child: Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(204, 255, 255, 255),
            borderRadius: BorderRadius.circular(15),
          ),
          padding: const EdgeInsets.all(7),
          child: Row(
            children: [
              CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage(
                  UserData()
                      .users
                      .where(
                          (element) => element!.id == widget.eventModel.ownerId)
                      .first
                      .imgUrl![0]
                      .toString(),
                ), // Replace with your image asset
              ),
              // SizedBox(
              //   height: 80,
              //   width: 90,
              //   child: Image.network(
              //     UserData()
              //         .users
              //         .where(
              //             (element) => element!.id == widget.eventModel.ownerId)
              //         .first
              //         .imgUrl![0]
              //         .toString(),
              //     fit: BoxFit.fill,
              //   ),
              // ),
              const SizedBox(
                width: 5,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 1.5,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${UserData().users.where((element) => element.id == widget.eventModel.ownerId).first.name.toString()} (${UserData().users.where((element) => element.id == widget.eventModel.ownerId).first.age.toString()})",
                          style: GoogleFonts.varelaRound(
                              fontSize: 18, fontWeight: FontWeight.w700),
                        ),
                        Row(
                          children: [
                            SvgPicture.asset("assets/svg/group.svg"),
                            const SizedBox(
                              width: 4,
                            ),
                            Text(
                              "${widget.eventModel.joinedUser!.length}/${widget.eventModel.userLimit}",
                              style: GoogleFonts.varelaRound(
                                  fontSize: 14, fontWeight: FontWeight.w700),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 1.6,
                    child: Text(
                      widget.eventModel.shortDes.toString(),
                      style: GoogleFonts.varelaRound(fontSize: 14),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 1.5,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${AppText.eventCost.tr} : ",
                              style: GoogleFonts.varelaRound(
                                  fontSize: 14, fontWeight: FontWeight.w600),
                            ),
                            Text(
                              "${widget.eventModel.eventType}",
                              style: GoogleFonts.varelaRound(
                                  fontSize: 14, fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 31,
                          width: 120,
                          child: ButtonWidget(
                              onpressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => EventDetailSceen(
                                          eventModel: widget.eventModel),
                                    ));
                              },
                              text: AppText.view.tr,
                              color: const [
                                Color(0xff8A5ED4),
                                Color(0xff9245C4)
                              ],
                              borderRadius: 15,
                              buttonTextSize: 14),
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
