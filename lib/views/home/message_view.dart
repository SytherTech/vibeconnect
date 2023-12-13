// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:intl/intl.dart';
// import 'package:provider/provider.dart';
// import 'package:vibeconnect/controller/event_controller.dart';
// import 'package:vibeconnect/controller/user_controller.dart';
// import 'package:vibeconnect/utils/userdata.dart';

// import '../../controller/chat_controller.dart';
// import '../../widgets/send_chat_widget.dart';

// enum msgStatus { sent, dilivered, seen }

// class MessageView extends StatefulWidget {
//   const MessageView({super.key});

//   @override
//   State<MessageView> createState() => _MessageViewState();
// }

// class _MessageViewState extends State<MessageView> {
//   @override
//   Widget build(BuildContext context) {
//     var user = context.watch<UserController>().userModel;
//     var eventModel = context
//         .watch<EventController>()
//         .events
//         .where((element) => element.ownerId == user.id)
//         .first;
//     var chatProvider = Provider.of<ChatMessageProvider>(context);
//     return Scaffold(
//       appBar: AppBar(
//         actions: [
//           Padding(
//             padding: const EdgeInsets.only(right: 10),
//             child: Row(
//               children: [
//                 SvgPicture.asset("assets/svg/group.svg"),
//                 const SizedBox(
//                   width: 4,
//                 ),
//                 Text(
//                   "${eventModel.joinedUser!.length}/${eventModel.userLimit}",
//                   style: GoogleFonts.varelaRound(
//                       fontSize: 14, fontWeight: FontWeight.w700),
//                 )
//               ],
//             ),
//           )
//         ],
//         backgroundColor: Colors.white,
//         leading: Icon(null),
//         elevation: 1,
//         title: Row(
//           children: [
//             SizedBox(
//               height: 50,
//               width: 50,
//               child: Container(
//                 decoration: BoxDecoration(
//                     shape: BoxShape.circle,
//                     image: DecorationImage(
//                         image: NetworkImage(user.imgUrl.toString()),
//                         fit: BoxFit.fill)),
//               ),
//             ),
//             const SizedBox(
//               width: 10,
//             ),
//             Text(
//               "${user.name.toString()}'s Event Chat",
//               style:
//                   GoogleFonts.varelaRound(fontSize: 15, fontWeight: FontWeight.w600),
//             )
//           ],
//         ),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: Stack(
//               children: [
//                 // SizedBox(
//                 //   width: MediaQuery.of(context).size.width / 1,
//                 //   child: Image.asset('assets/back.jpg', fit: BoxFit.fill),
//                 // ),
//                 ListView.builder(
//                   itemCount: chatProvider.chats.length,
//                   reverse: true,
//                   itemBuilder: (context, index) {
//                     final message = chatProvider.chats.reversed.toList()[index];

//                     return Align(
//                       alignment: message.isSender
//                           ? Alignment.centerRight
//                           : Alignment.centerLeft,
//                       child: Container(
//                           margin: const EdgeInsets.symmetric(
//                               vertical: 10, horizontal: 16),
//                           padding: const EdgeInsets.symmetric(
//                               vertical: 10, horizontal: 16),
//                           decoration: BoxDecoration(
//                               color: message.isSender
//                                   ? Color.fromARGB(255, 106, 37, 158)
//                                   : Color(0xff8B5DD3),
//                               borderRadius: message.isSender
//                                   ? const BorderRadius.only(
//                                       topRight: Radius.circular(0),
//                                       topLeft: Radius.circular(25),
//                                       bottomRight: Radius.circular(25),
//                                       bottomLeft: Radius.circular(25))
//                                   : const BorderRadius.only(
//                                       bottomLeft: Radius.circular(25),
//                                       topRight: Radius.circular(25),
//                                       topLeft: Radius.circular(0),
//                                       bottomRight: Radius.circular(25))),
//                           //  padding: const EdgeInsets.all(10),
//                           child: Flex(
//                             direction: Axis.vertical,
//                             children: [
//                               Column(
//                                 crossAxisAlignment: message.isSender
//                                     ? CrossAxisAlignment.end
//                                     : CrossAxisAlignment.start,
//                                 children: [
//                                   message.isSender
//                                       ? Text("")
//                                       : Text(
//                                           UserData()
//                                               .users
//                                               .where((element) =>
//                                                   element.id ==
//                                                   eventModel.joinedUser![0].id)
//                                               .first
//                                               .name
//                                               .toString(),
//                                           style: TextStyle(
//                                               color: Colors.white,
//                                               fontSize: 12),
//                                         ),
//                                   Text(
//                                     message.text,
//                                     style: const TextStyle(
//                                         fontSize: 16, color: Colors.white),
//                                   ),
//                                   SizedBox(
//                                     width: 70,
//                                     child: Row(
//                                       children: [
//                                         Text(
//                                           DateFormat('hh:mm a')
//                                               .format(message.time),
//                                           style: const TextStyle(
//                                               fontSize: 11,
//                                               color: Colors.white54),
//                                         ),
//                                         const SizedBox(width: 4),
//                                         message.isSender
//                                             ? Icon(
//                                                 message.messageStatus ==
//                                                         msgStatus.sent
//                                                     ? Icons.done
//                                                     : message.messageStatus ==
//                                                             msgStatus.dilivered
//                                                         ? Icons.done_all
//                                                         : Icons.done_all,
//                                                 size: 16,
//                                                 color: message.messageStatus ==
//                                                         msgStatus.sent
//                                                     ? Colors.white54
//                                                     : message.messageStatus ==
//                                                             msgStatus.dilivered
//                                                         ? Colors.white54
//                                                         : Colors.white,
//                                               )
//                                             : Container(),
//                                       ],
//                                     ),
//                                   )
//                                 ],
//                               ),
//                             ],
//                           )),
//                     );
//                   },
//                 ),
//               ],
//             ),
//           ),
//           Align(
//               alignment: Alignment.bottomCenter,
//               child: SendChatWidget(
//                 sendMessage: (message, file) {
//                   chatProvider.sendMessage(message);
//                   print(chatProvider.chats.length);
//                 },
//               )),
//         ],
//       ),
//     );
//   }
// }
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:vibeconnect/utils/userdata.dart';
import 'package:vibeconnect/views/home/message_experience.dart';
import 'package:vibeconnect/widgets/button_widget.dart';
import '../../model/user_model.dart';

import '../../controller/event_controller.dart';
import '../../controller/user_controller.dart';
import '../../utils/styles.dart';

class GroupChatScreen extends StatefulWidget {
  @override
  _GroupChatScreenState createState() => _GroupChatScreenState();
}

class _GroupChatScreenState extends State<GroupChatScreen> {
  TextEditingController _messageController = TextEditingController();
  List<ChatMessage> chatMessages = [];

  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    // var user = context.watch<UserController>().userModel;
    var eventModel = context
        .watch<EventController>()
        .events
        .where((element) => element.ownerId == "owner_2")
        .first;
    return Container(
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
      child: Scaffold(
        backgroundColor: Colors.transparent,
        // appBar: AppBar(
        //   // flexibleSpace: Container(
        //   //   decoration: const BoxDecoration(
        //   //     gradient: LinearGradient(
        //   //       colors: [
        //   //         Color(Style.PRIMARY_COLOR),
        //   //         Color(Style.SECONDARY_COLOR)
        //   //       ], // Set your gradient colors
        //   //       begin: Alignment.topLeft,
        //   //       end: Alignment.bottomRight,
        //   //     ),
        //   //   ),
        //   // ),
        //   leading: IconButton(
        //       onPressed: () {
        //         Navigator.pop(context);
        //       },
        //       icon: const Icon(
        //         Icons.arrow_back_ios,
        //         color: Colors.white,
        //       )),
        //   // title: Column(
        //   //   crossAxisAlignment: CrossAxisAlignment.start,
        //   //   children: [
        //   //     Text(
        //   //       "${user.name}'s Event Chat",
        //   //       style: GoogleFonts.lato(
        //   //           fontSize: 18,
        //   //           fontWeight: FontWeight.w600,
        //   //           color: Colors.white),
        //   //     ),
        //   //   ],
        //   // ),
        // ),
        body: Column(
          children: [
            SizedBox(
              child: Stack(
                fit: StackFit.passthrough,
                clipBehavior: Clip.none,
                children: [
                  SizedBox(
                    height: deviceSize.height * 0.26,
                    width: deviceSize.width,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(150),
                          bottomLeft: Radius.circular(150)),
                      child: CachedNetworkImage(
                        imageUrl: eventModel.eventImages![0],
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Positioned(
                      top: 30,
                      left: deviceSize.width * 0.85,
                      child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromARGB(173, 241, 216, 214)),
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.close,
                            color: Colors.black,
                          ),
                        ),
                      )),
                  Positioned(
                      top: 30,
                      left: 20,
                      child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromARGB(173, 241, 216, 214)),
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.exit_to_app,
                            color: Colors.black,
                          ),
                        ),
                      )),
                  Positioned(
                    top: 150,
                    child: SizedBox(
                      width: deviceSize.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 0, vertical: 5),
                            child: Column(
                              children: [
                                Text(
                                  eventModel.startTime.toString(),
                                  style: const TextStyle(color: Colors.white),
                                ),
                                const Text(
                                  "11 Dec",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              CircleAvatar(
                                radius: 45,
                                backgroundImage: NetworkImage(UserData()
                                    .users
                                    .where((element) =>
                                        element.id == eventModel.ownerId)
                                    .first
                                    .imgUrl![0]
                                    .toString()),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                "@ Marlin Arian",
                                style: GoogleFonts.lexend(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MessageExperience(
                                      joinedUser: eventModel.joinedUser),
                                ),
                              );
                            },
                            child: Column(
                              children: [
                                Text(
                                  "${eventModel.joinedUser!.length}/${eventModel.userLimit}",
                                  style: GoogleFonts.varelaRound(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                // if (eventModel.joinedUser != null &&
                                //     eventModel.joinedUser!.isNotEmpty)
                                //   for (int i = 0;
                                //       i < eventModel.joinedUser!.length;
                                //       i++)
                                //     GestureDetector(
                                //       onTap: () {
                                //         try {
                                //           Navigator.push(
                                //             context,
                                //             MaterialPageRoute(
                                //               builder: (context) =>
                                //                   MessageExperience(
                                //                       joinedUser:
                                //                           eventModel.joinedUser),
                                //             ),
                                //           );
                                //         } catch (e) {
                                //           print('Navigation error: $e');
                                //         }
                                //       },
                                //       child: Padding(
                                //         padding: i == 0
                                //             ? const EdgeInsets.only()
                                //             : EdgeInsets.only(
                                //                 left: 5 * (i + 1),
                                //                 top: 2 * (i + .5),
                                //               ),
                                //         child: CircleAvatar(
                                //           backgroundImage: NetworkImage(UserData()
                                //               .users
                                //               .where((element) =>
                                //                   element.id ==
                                //                   eventModel.joinedUser![i].id)
                                //               .first
                                //               .imgUrl![0]
                                //               .toString()),
                                //           radius: 20,
                                //         ),
                                //       ),
                                //     ),
                                Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    CircleAvatar(
                                      backgroundImage: NetworkImage(UserData()
                                          .users
                                          .where((element) =>
                                              element.id == eventModel.ownerId)
                                          .first
                                          .imgUrl![0]
                                          .toString()),
                                      radius: 20,
                                    ),
                                    if (eventModel.joinedUser != null &&
                                        eventModel.joinedUser!.isNotEmpty)
                                      for (int i = 0;
                                          i < eventModel.joinedUser!.length - 1;
                                          i++)
                                        Positioned(
                                          left: 5 * (i + 1),
                                          top: 5 * (i + 1),
                                          child: CircleAvatar(
                                            backgroundImage: NetworkImage(
                                                UserData()
                                                    .users
                                                    .where((element) =>
                                                        element.id ==
                                                        eventModel
                                                            .joinedUser![i].id)
                                                    .first
                                                    .imgUrl![0]
                                                    .toString()),
                                            radius: 20,
                                          ),
                                        ),
                                  ],
                                ),
                              ],
                            ),
                          ),

                          // Container(
                          //   decoration: BoxDecoration(
                          //       color: Colors.white,
                          //       borderRadius: BorderRadius.circular(15),
                          //       boxShadow: const [
                          //         BoxShadow(
                          //             blurRadius: 3,
                          //             blurStyle: BlurStyle.solid,
                          //             offset: Offset(-2, 2))
                          //       ]),
                          //   padding: const EdgeInsets.symmetric(
                          //       horizontal: 30, vertical: 5),
                          //   child: Text("Free"),
                          // ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.transparent,
                child: ListView.builder(
                  itemCount: chatMessages.length,
                  itemBuilder: (context, index) {
                    return ChatContainer(chatMessage: chatMessages[index]);
                  },
                ),
              ),
            ),
            _buildMessageInput(eventModel.joinedUser![0]),
          ],
        ),
      ),
    );
  }
  // widget of type message

  Widget _buildMessageInput(UserModel userModel) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Color.fromARGB(0, 255, 255, 255),
        boxShadow: [
          // BoxShadow(
          //   color: const Color.fromARGB(0, 158, 158, 158).withOpacity(0.5),
          //   spreadRadius: 2,
          //   blurRadius: 7,
          //   offset: Offset(0, -3),
          // ),
        ],
      ),
      child: Row(
        children: [
          IconButton(
            icon: Icon(
              Icons.camera_alt,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: const Color.fromARGB(52, 255, 255, 255)),
              child: TextField(
                style: const TextStyle(color: Colors.white),
                controller: _messageController,
                decoration: const InputDecoration(
                  hintText: 'Type a message...',
                  hintStyle: TextStyle(color: Colors.white),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(
              Icons.send,
              color: Colors.white,
            ),
            onPressed: () {
              _sendMessage(userModel);
            },
          ),
        ],
      ),
    );
  }

  //  sender meassage
  void _sendMessage(UserModel receiverModel) {
    if (_messageController.text.isNotEmpty) {
      setState(() {
        chatMessages.add(
          ChatMessage(
            isSender: true,
            senderName: '',
            senderImage:
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTDYyPWMq0N_iJpqPQK32OogxIOO95eyDXOtzELd_f1kTNYUoRMQ93zN5bd_BKBSX7DQXw&usqp=CAU',
            message: _messageController.text,
            time: _getCurrentTime(),
          ),
        );
        _messageController.clear();

        Future.delayed(Duration(seconds: 1), () {
          _receiveDummyMessage(receiverModel);
        });
      });
    }
  }

  // receiver message

  void _receiveDummyMessage(UserModel user) {
    setState(() {
      chatMessages.add(
        ChatMessage(
          isSender: false,
          senderName: user.name.toString(),
          senderImage: user.imgUrl.toString(),
          message: 'Hey its ${user.name} here!',
          time: _getCurrentTime(),
        ),
      );
    });
  }

  String _getCurrentTime() {
    return TimeOfDay.now().format(context);
  }
}

// chat container widget class

class ChatContainer extends StatelessWidget {
  final ChatMessage chatMessage;

  ChatContainer({required this.chatMessage});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: chatMessage.isSender == true
          ? Alignment.centerRight
          : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Column(
          crossAxisAlignment: chatMessage.isSender == true
              ? CrossAxisAlignment.end
              : CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                if (chatMessage.isSender == false)
                  CircleAvatar(
                    backgroundImage: NetworkImage(chatMessage.senderImage),
                    radius: 16,
                  ),
                SizedBox(width: 8),
                Text(
                  chatMessage.senderName,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: chatMessage.isSender == true
                        ? Colors.black
                        : Colors.black,
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: chatMessage.isSender == true
                    ? Color.fromARGB(255, 252, 90, 252)
                    : Color(0xff592acd),
                borderRadius: BorderRadius.only(
                  topLeft:
                      Radius.circular(chatMessage.isSender == true ? 20 : 0),
                  topRight:
                      Radius.circular(chatMessage.isSender == true ? 0 : 20),
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Text(
                chatMessage.message,
                style: TextStyle(
                  color: chatMessage.isSender == true
                      ? Colors.white
                      : Colors.white,
                ),
              ),
            ),
            SizedBox(height: 4),
            Text(
              chatMessage.time,
              style: TextStyle(
                fontSize: 12,
                color:
                    chatMessage.isSender == true ? Colors.black : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChatMessage {
  final String senderName;
  final bool isSender;
  final String senderImage;
  final String message;
  final String time;

  ChatMessage({
    required this.isSender,
    required this.senderName,
    required this.senderImage,
    required this.message,
    required this.time,
  });
}
