import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
                itemCount: eventModel.joinedUser!.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => GroupChatScreen()));
                    },
                    child: Card(
                      elevation: 4,
                      margin: const EdgeInsets.all(8.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage:
                              NetworkImage(eventModel.eventImages![0]),
                        ),
                        title: const Text('Johson Math Event'),
                        subtitle: const Text('Subtitle for Event '),
                        trailing: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              eventModel.endTime!,
                              style: const TextStyle(
                                  fontSize: 12.0, color: Colors.grey),
                            ),
                            const Text(
                              'My Event',
                              style: TextStyle(fontSize: 12.0),
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
