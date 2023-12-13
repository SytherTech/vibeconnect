import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:vibeconnect/utils/styles.dart';

import '../../../controller/event_controller.dart';
import '../message_view.dart';

class AllMessages extends StatefulWidget {
  const AllMessages({super.key});

  @override
  State<AllMessages> createState() => _AllMessagesState();
}

class _AllMessagesState extends State<AllMessages> {
  @override
  Widget build(BuildContext context) {
    var eventModel = context
        .watch<EventController>()
        .events
        .where((element) => element.ownerId == "owner_2")
        .first;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Event Chats",
          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 5.0, left: 5, right: 5),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => GroupChatScreen()));
                    },
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        gradient: LinearGradient(
                          colors: [
                            Color(Style.PRIMARY_COLOR),
                            Color(Style.SECONDARY_COLOR)
                          ], // Set your gradient colors
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 35,
                          backgroundImage:
                              NetworkImage(eventModel.eventImages![0]),
                        ),
                        title: Text(
                          'Johson Math Event (22)',
                          style: GoogleFonts.varelaRound(color: Colors.white),
                        ),
                        subtitle: Text(
                          'Sports',
                          style: GoogleFonts.varelaRound(color: Colors.white),
                        ),
                        trailing: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              eventModel.endTime!,
                              style: const TextStyle(
                                  fontSize: 14.0, color: Colors.grey),
                            ),
                            Text(
                              'My Event',
                              style:
                                  GoogleFonts.varelaRound(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
