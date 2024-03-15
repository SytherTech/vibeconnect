import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import '../../controller/event_controller.dart';
import '../../controller/user_controller.dart';
import '../../views/event_request.dart';
import '../../views/home/event_creation/select_category.dart';
import '../../views/home/message_view.dart';
import '../../views/home/views/location.dart';

import '../../views/user_profile.dart';
import '../../widgets/custom_market.dart';
import '../../widgets/show_eventcard_widget.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _tabIndex = 2;
  int get tabIndex => _tabIndex;
  set tabIndex(int v) {
    _tabIndex = v;
    setState(() {});
  }

  late PageController pageController;

  @override
  void initState() {
    context.read<UserController>().getUserData();
    context.read<EventController>().getEvent();
    super.initState();
  

    pageController = PageController(initialPage: _tabIndex);
    Future.delayed(Duration(seconds: 2)).then((value) {
      setState(() {
        _tabIndex = 0;
        pageController.jumpToPage(tabIndex);
      });
    });
  }

  late GoogleMapController mapController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: pageController,
          onPageChanged: (v) {
            print(v);
            tabIndex = v;
          },
          children: [
            LocationScreen(),
            GroupChatScreen(),
            EventRequestScreen(),
            Container()
        
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Color(0xff541D9E),
          currentIndex: tabIndex,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "assets/svg/location.svg",
                  color: tabIndex == 0 ? Colors.purple : null,
                ),
                label: "home"),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "assets/svg/msg.svg",
                  color: tabIndex == 1 ? Colors.purple : null,
                ),
                label: "message"),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/svg/event.svg',
                  color: tabIndex == 2 ? Colors.purple : null,
                ),
                label: "request"),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "assets/svg/profile.svg",
                  color: tabIndex == 3 ? Colors.purple : null,
                ),
                label: "profile"),
          ],
          onTap: (index) {
            tabIndex = index;
            if (tabIndex == 3) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyProfileView(),
                  ));
            } else {
              pageController.jumpToPage(tabIndex);
            }
          },
        ),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniCenterDocked,
        floatingActionButton: _tabIndex == 1 ? null : ImageButton()
        // bottomNavigationBar: CircleNavBar(

        //   activeIcons: const [
        //     Icon(Icons.person, color: Colors.deepPurple),
        //     Icon(Icons.home, color: Colors.deepPurple),
        //     Icon(Icons.favorite, color: Colors.deepPurple),
        //   ],
        //   inactiveIcons: const [
        //     Text("My"),
        //     Text("Home"),
        //     Text("Like"),
        //   ],
        //   color: Colors.white,
        //   height: 60,
        //   circleWidth: 60,
        //   activeIndex: tabIndex,
        //   onTap: (index) {
        //     tabIndex = index;
        //     pageController.jumpToPage(tabIndex);
        //   },
        //   shadowColor: Colors.deepPurple,
        //   elevation: 10,
        // ),
        );
  }
}

class ImageButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SelectEventCategory(),
            ));
      },
      child: Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Stack(
            alignment: Alignment.center,
            clipBehavior: Clip.none,
            fit: StackFit.passthrough,
            children: [
              Image.asset(
                'assets/png/float.png', // Replace with the path to your image
                width: 80, // Adjust the width as needed
                height: 80, // Adjust the height as needed
              ),
              const Icon(
                Icons.add, // You can change the icon as needed
                color: Colors.white,
                size: 30,
              ),
            ],
          )),
    );
  }
}
