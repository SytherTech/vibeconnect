import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vibe_connect/model/event_model.dart';
import 'package:vibe_connect/utils/userdata.dart';
import 'package:vibe_connect/views/home/views/event_detail_view.dart';
import 'package:vibe_connect/widgets/button_widget.dart';

class EventCardWidget extends StatefulWidget {
  final EventModel eventModel;

  const EventCardWidget({super.key, required this.eventModel});

  @override
  State<EventCardWidget> createState() => _EventCardWidgetState();
}

class _EventCardWidgetState extends State<EventCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Container(
        color: Colors.white,
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
                        UserData()
                            .users
                            .where((element) =>
                                element.id == widget.eventModel.ownerId)
                            .first
                            .name
                            .toString(),
                        style: GoogleFonts.roboto(
                            fontSize: 16, fontWeight: FontWeight.w700),
                      ),
                      Row(
                        children: [
                          SvgPicture.asset("assets/svg/group.svg"),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            "${widget.eventModel.joinedUser!.length}/${widget.eventModel.userLimit}",
                            style: GoogleFonts.roboto(
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
                    style: GoogleFonts.roboto(fontSize: 13),
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
                            "Event-Cost:",
                            style: GoogleFonts.roboto(
                                fontSize: 14, fontWeight: FontWeight.w600),
                          ),
                          Text(
                            "${widget.eventModel.eventType}",
                            style: GoogleFonts.roboto(
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
                            text: "View",
                            color: [Color(0xff8A5ED4), Color(0xff9245C4)],
                            borderRadius: 0,
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
    );
  }
}
