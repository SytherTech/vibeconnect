import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:vibeconnect/controller/event_controller.dart';
import 'package:vibeconnect/controller/user_controller.dart';
import 'package:vibeconnect/utils/userdata.dart';

import '../../controller/chat_controller.dart';
import '../../widgets/send_chat_widget.dart';

enum msgStatus { sent, dilivered, seen }

class MessageView extends StatefulWidget {
  const MessageView({super.key});

  @override
  State<MessageView> createState() => _MessageViewState();
}

class _MessageViewState extends State<MessageView> {
  @override
  Widget build(BuildContext context) {
    var user = context.watch<UserController>().userModel;
    var eventModel = context
        .watch<EventController>()
        .events
        .where((element) => element.ownerId == user.id)
        .first;
    var chatProvider = Provider.of<ChatMessageProvider>(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Row(
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
            ),
          )
        ],
        backgroundColor: Colors.white,
        leading: Icon(null),
        elevation: 1,
        title: Row(
          children: [
            SizedBox(
              height: 50,
              width: 50,
              child: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: NetworkImage(user.imgUrl.toString()),
                        fit: BoxFit.fill)),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              "${user.name.toString()}'s Event Chat",
              style:
                  GoogleFonts.roboto(fontSize: 15, fontWeight: FontWeight.w600),
            )
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                // SizedBox(
                //   width: MediaQuery.of(context).size.width / 1,
                //   child: Image.asset('assets/back.jpg', fit: BoxFit.fill),
                // ),
                ListView.builder(
                  itemCount: chatProvider.chats.length,
                  reverse: true,
                  itemBuilder: (context, index) {
                    final message = chatProvider.chats.reversed.toList()[index];

                    return Align(
                      alignment: message.isSender
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      child: Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 16),
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 16),
                          decoration: BoxDecoration(
                              color: message.isSender
                                  ? Color.fromARGB(255, 106, 37, 158)
                                  : Color(0xff8B5DD3),
                              borderRadius: message.isSender
                                  ? const BorderRadius.only(
                                      topRight: Radius.circular(0),
                                      topLeft: Radius.circular(25),
                                      bottomRight: Radius.circular(25),
                                      bottomLeft: Radius.circular(25))
                                  : const BorderRadius.only(
                                      bottomLeft: Radius.circular(25),
                                      topRight: Radius.circular(25),
                                      topLeft: Radius.circular(0),
                                      bottomRight: Radius.circular(25))),
                          //  padding: const EdgeInsets.all(10),
                          child: Flex(
                            direction: Axis.vertical,
                            children: [
                              Column(
                                crossAxisAlignment: message.isSender
                                    ? CrossAxisAlignment.end
                                    : CrossAxisAlignment.start,
                                children: [
                                  message.isSender
                                      ? Text("")
                                      : Text(
                                          UserData()
                                              .users
                                              .where((element) =>
                                                  element.id ==
                                                  eventModel.joinedUser![0].id)
                                              .first
                                              .name
                                              .toString(),
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12),
                                        ),
                                  Text(
                                    message.text,
                                    style: const TextStyle(
                                        fontSize: 16, color: Colors.white),
                                  ),
                                  SizedBox(
                                    width: 70,
                                    child: Row(
                                      children: [
                                        Text(
                                          DateFormat('hh:mm a')
                                              .format(message.time),
                                          style: const TextStyle(
                                              fontSize: 11,
                                              color: Colors.white54),
                                        ),
                                        const SizedBox(width: 4),
                                        message.isSender
                                            ? Icon(
                                                message.messageStatus ==
                                                        msgStatus.sent
                                                    ? Icons.done
                                                    : message.messageStatus ==
                                                            msgStatus.dilivered
                                                        ? Icons.done_all
                                                        : Icons.done_all,
                                                size: 16,
                                                color: message.messageStatus ==
                                                        msgStatus.sent
                                                    ? Colors.white54
                                                    : message.messageStatus ==
                                                            msgStatus.dilivered
                                                        ? Colors.white54
                                                        : Colors.white,
                                              )
                                            : Container(),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ],
                          )),
                    );
                  },
                ),
              ],
            ),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: SendChatWidget(
                sendMessage: (message, file) {
                  chatProvider.sendMessage(message);
                  print(chatProvider.chats.length);
                },
              )),
        ],
      ),
    );
  }
}
