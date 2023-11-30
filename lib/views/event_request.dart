import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tcard/tcard.dart';
import 'package:vibeconnect/utils/userdata.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../utils/styles.dart';

class EventRequestScreen extends StatefulWidget {
  @override
  State<EventRequestScreen> createState() => _EventRequestScreenState();
}

class _EventRequestScreenState extends State<EventRequestScreen> {
  TCardController controller = TCardController();
  List<Widget> cards = List.generate(
    UserData().users.length,
    (int index) {
      return Stack(
        children: [
          Container(
            width: double.infinity, // Set the width to your desired value
            height: double.infinity, // Set the height to your desired value
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16.0),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 17),
                  blurRadius: 23.0,
                  spreadRadius: -13.0,
                  color: Colors.black54,
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: Image.network(
                UserData().users[index].imgUrl.toString(),
                fit: BoxFit.cover, // Adjust the fit property as needed
              ),
            ),
          ),
          Positioned(
            bottom: 40,
            left: 10,
            child: Container(
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Color.fromARGB(99, 0, 0, 0),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(UserData().users[index].name.toString(),
                            style: GoogleFonts.roboto(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold)),
                        Text(
                          'Age: ${UserData().users[index].age} Years Old',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                )),
          ),
        ],
      );
    },
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: Text(
              "Requests For Joining",
              style: GoogleFonts.roboto(color: Colors.white, fontSize: 18),
            ),
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
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ))),
        body: TCard(
          controller: controller,
          onForward: (index, info) {
            if (info.direction == SwipDirection.Right) {
              Fluttertoast.showToast(
                msg: "Accepted",
                toastLength: Toast
                    .LENGTH_SHORT, // You can use Toast.LENGTH_LONG for a longer duration
                gravity:
                    ToastGravity.TOP, // Set the gravity (TOP, CENTER, BOTTOM)
                timeInSecForIosWeb: 1, // Time in seconds for iOS and web
                backgroundColor: Colors.green, // Background color
                textColor: Colors.white, // Text color
                fontSize: 16.0, // Text size
              );
            } else {
              Fluttertoast.showToast(
                msg: "Rejected",
                toastLength: Toast
                    .LENGTH_SHORT, // You can use Toast.LENGTH_LONG for a longer duration
                gravity:
                    ToastGravity.TOP, // Set the gravity (TOP, CENTER, BOTTOM)
                timeInSecForIosWeb: 1, // Time in seconds for iOS and web
                backgroundColor: Colors.red, // Background color
                textColor: Colors.white, // Text color
                fontSize: 16.0, // Text size
              );
            }
          },
          lockYAxis: true,
          size: Size(MediaQuery.of(context).size.width,
              MediaQuery.of(context).size.height),
          cards: cards,
        ));
  }
}
