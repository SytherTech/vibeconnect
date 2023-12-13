import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vibeconnect/views/home/profile_view.dart';
import '../../model/user_model.dart';
import '../../utils/styles.dart';

class MessageExperience extends StatefulWidget {
  final List<UserModel>? joinedUser;
  const MessageExperience({super.key, required this.joinedUser});

  @override
  State<MessageExperience> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MessageExperience> {
  @override
  Widget build(BuildContext context) {
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
        body: Padding(
          padding: const EdgeInsets.only(top: 40),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back),
                      color: Colors.white),
                  const Spacer(),
                  Text(
                    "User who joined",
                    style: GoogleFonts.varelaRound(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                  const Spacer(),
                ],
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: widget.joinedUser!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                            widget.joinedUser![index].imgUrl![0].toString()),
                        radius: 30,
                      ),
                      title: Text(
                          "${widget.joinedUser![index].name.toString()} (${widget.joinedUser![index].age.toString()})",
                          style: GoogleFonts.varelaRound(color: Colors.white)),
                      subtitle: Text('View Profile',
                          style: GoogleFonts.varelaRound(color: Colors.white)),
                      trailing: const Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProfileViewScreen(
                                  userModel: widget.joinedUser![index])),
                        );
                      },
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
