import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:vibeconnect/lang/app_text.dart';
import 'package:vibeconnect/utils/styles.dart';
import 'package:vibeconnect/views/home/message_view.dart';
import 'package:vibeconnect/views/home/views/all_messages.dart';
import 'package:vibeconnect/views/switch_language.dart';
import 'package:vibeconnect/widgets/location_drawer.dart';
import '../../../widgets/show_eventcard_widget.dart';
import '../../../controller/event_controller.dart';
import '../../../controller/user_controller.dart';
import '../../../model/event_model.dart';
import '../../../widgets/custom_market.dart';
import '../../../widgets/roundedSearchbar_widget.dart';
import 'package:flutter/material.dart';
import '../../../widgets/show_eventcard_widget.dart';

import '../../event_request.dart';
import '../../user_profile.dart';
import '../event_creation/select_category.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen>
    with TickerProviderStateMixin {
  final Map<String, Marker> _markers = {};
  late AnimationController _controller;
  late Animation<double> _animation;

  // List<Map<String, dynamic>> data = [
  //   {
  //     'id': '1',
  //     'globalKey': GlobalKey(),
  //     'position': const LatLng(37.7749, -122.4194),
  //     'widget': CustomMarker()
  //   },
  //   {
  //     'id': '2',
  //     'globalKey': GlobalKey(),
  //     'position': const LatLng(37.7759, -122.4294),
  //     'widget': CustomMarker()
  //   }
  // ];

  //load event
  //get

  bool _isloaded = false;
  bool showInfoContainer = false;
  late GoogleMapController mapController;
  bool isRefreshing = false;

  @override
  void initState() {
    isRefreshing = false;
    WidgetsBinding.instance.addPostFrameCallback((_) => _onBuildCompleted());

    // TODO: implement initState
    super.initState();
    // Set up the animation controller
    _controller = AnimationController(
      duration: const Duration(milliseconds: 100),
      vsync: this,
    );

    // Set up the animation with a Tween
    _animation = Tween<double>(begin: -10.0, end: 10.0).animate(_controller)
      ..addListener(() {
        setState(() {
          // The animation has changed
        });
      });

    // Reverse the animation when it completes to give a back-and-forth effect
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _controller.forward();
      }
    });
    _controller.forward();

    Future.delayed(Duration(milliseconds: 1200)).then((value) {
      _controller.stop();
    });
  }

  List<EventModel> eventProvider = [];
  EventModel? eventModel;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void openDrawer() {
    _scaffoldKey.currentState?.openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    var deviceHeight = MediaQuery.of(context).size.height;
    eventProvider = Provider.of<EventController>(context).events;
    // drawer

    return Scaffold(
      key: _scaffoldKey,
      drawer: LocationDrawer(),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: Transform.translate(
          offset: Offset(_animation.value, 0.0),
          child: ImageButton(_controller)),
      // appBar: AppBar(
      //   title: RoundedSearchBar(),
      //   // actions: [
      //   //   IconButton(
      //   //       onPressed: () {
      //   //         showDatePicker(
      //   //             context: context,
      //   //             initialDate: DateTime.now(),
      //   //             firstDate: DateTime.now(),
      //   //             lastDate: DateTime(2999));
      //   //       },
      //   //       icon: const Icon(
      //   //         Icons.date_range,
      //   //         color: Colors.purple,
      //   //       ))
      //   // ],
      //   automaticallyImplyLeading: false,
      //   leading: IconButton(
      //     onPressed: () {},
      //     icon: SvgPicture.asset(
      //       "assets/svg/drawer.svg",
      //       color: Colors.purple,
      //       height: 30,
      //       fit: BoxFit.cover,
      //     ),
      //   ),
      // ),
      body: _isloaded
          ? Stack(
              children: [
                GoogleMap(
                    onMapCreated: _onMapCreated,
                    onTap: (latlng) {
<<<<<<< HEAD
                      if (showInfoContainer) {
=======
                      if (showInfoContainer == true) {
>>>>>>> 4f893d14962d21f62a56b75e5d1ec2ed9924e446
                        setState(() {
                          showInfoContainer = false;
                        });
                      }
                      if (eventProvider
<<<<<<< HEAD
                          .where((element) => element.eventLocation == latlng)
                          .isNotEmpty) {
=======
                              .where(
                                  (element) => element.eventLocation == latlng)
                              .first
                              .eventLocation !=
                          null) {
>>>>>>> 4f893d14962d21f62a56b75e5d1ec2ed9924e446
                        setState(() {
                          showInfoContainer = true;
                        });
                      }
                    },
                    mapType: MapType.normal,
                    buildingsEnabled: true,
                    myLocationButtonEnabled: true,
                    myLocationEnabled: true,
                    compassEnabled: true,
                    zoomGesturesEnabled: true,
                    rotateGesturesEnabled: true,
                    scrollGesturesEnabled: true,
                    tiltGesturesEnabled: true,
                    zoomControlsEnabled: false,
                    indoorViewEnabled: false,
                    trafficEnabled: false,
                    mapToolbarEnabled: true,
                    initialCameraPosition: const CameraPosition(
                      target: LatLng(45.4642, 9.1900),
                      zoom: 13.0,
                    ),
                    markers: _markers.values.toSet()),
                if (showInfoContainer)
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 110),
                      child: EventCardWidget(
                        eventModel: eventModel!,
                      ),
                    ),
                  ),
                // Align(
                //   alignment: Alignment.topRight,
                //   child: InkWell(
                //     onTap: () => Navigator.push(
                //         context,
                //         MaterialPageRoute(
                //           builder: (context) => EventRequestScreen(),
                //         )),
                //     child: Card(
                //       child: SizedBox(
                //         height: 50,
                //         width: 50,
                //         child: Center(
                //           child: Stack(
                //             fit: StackFit.passthrough,
                //             clipBehavior: Clip.none,
                //             children: [
                //               SvgPicture.asset(
                //                 "assets/svg/event.svg",
                //                 color: Colors.purple,
                //               ),
                //               const Positioned(
                //                 top: 17,
                //                 left: 15,
                //                 child: Text(
                //                   "5",
                //                   style: TextStyle(
                //                       color: Colors.black,
                //                       fontSize: 13,
                //                       fontWeight: FontWeight.w600),
                //                 ),
                //               )
                //             ],
                //           ),
                //         ),
                //       ),
                //     ),
                //   ),
                // )

                Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 40, right: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.all(5),
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color:
                                        ui.Color.fromARGB(204, 255, 255, 255)),
                                child: IconButton(
                                  onPressed: openDrawer,
                                  icon: SvgPicture.asset(
                                    "assets/svg/drawer.svg",
                                    color: Color(Style.MAIN_COLOR),
                                    height: 25,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              // IconButton(
                              //   onPressed: () {
                              //     Navigator.push(
                              //       context,
                              //       MaterialPageRoute(
                              //         builder: (context) => MyProfileView(),
                              //       ),
                              //     );
                              //   },
                              //   icon: Container(
                              //     decoration: const BoxDecoration(
                              //         shape: BoxShape.circle,
                              //         color: Color(Style.MAIN_COLOR)),
                              //     child: SvgPicture.asset(
                              //       "assets/svg/profile.svg",
                              //       color: const ui.Color.fromARGB(
                              //           218, 255, 255, 255),
                              //       height: 30,
                              //       fit: BoxFit.cover,
                              //     ),
                              //   ),
                              // ),
                              Expanded(
                                child: RoundedSearchBar(),
                              ),
                              IconButton(
                                onPressed: () {
                                  showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime.now(),
                                    lastDate: DateTime(2999),
                                    builder:
                                        (BuildContext context, Widget? child) {
                                      return Theme(
                                        data: ThemeData.light().copyWith(
                                          primaryColor: Colors
                                              .teal, // Set your primary color

                                          colorScheme: const ColorScheme.light(
                                              primary: Color(Style.MAIN_COLOR)),
                                          buttonTheme: const ButtonThemeData(
                                              textTheme:
                                                  ButtonTextTheme.primary),
                                        ),
                                        child: child!,
                                      );
                                    },
                                  );
                                },
                                icon: Container(
                                    padding: const EdgeInsets.all(12),
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: ui.Color.fromARGB(
                                            204, 255, 255, 255)),
                                    child: const Icon(
                                      size: 25,
                                      Icons.calendar_month,
                                      color: Color(Style.MAIN_COLOR),
                                    )),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20, right: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 2,
                                ),
                                Container(
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: ui.Color.fromARGB(
                                          204, 255, 255, 255)),
                                  padding: const EdgeInsets.all(5),
                                  child: IconButton(
                                      onPressed: () async {
                                        await Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    EventRequestScreen()));
                                        _controller.forward();
                                        Future.delayed(
                                                Duration(milliseconds: 1200))
                                            .then((value) {
                                          _controller.stop();
                                        });
                                      },
                                      icon: const Icon(
                                        Icons.checklist_sharp,
                                        color: Colors.blue,
                                      )),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Container(
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: ui.Color.fromARGB(
                                          204, 255, 255, 255)),
                                  padding: const EdgeInsets.all(5),
                                  child: IconButton(
<<<<<<< HEAD
                                      onPressed: () async {
                                        await Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    AllMessages()));
                                        _controller.forward();
                                        Future.delayed(
                                                Duration(milliseconds: 1200))
                                            .then((value) {
                                          _controller.stop();
                                        });
                                      },
=======
                                      onPressed: () {},
>>>>>>> 4f893d14962d21f62a56b75e5d1ec2ed9924e446
                                      icon: SvgPicture.asset(
                                        "assets/svg/msg.svg",
                                        color: const Color(0xffd6587f),
                                      )),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                // Container(
                                //   decoration: const BoxDecoration(
                                //       shape: BoxShape.circle,
                                //       color: ui.Color.fromARGB(
                                //           204, 255, 255, 255)),
                                //   padding: const EdgeInsets.all(5),
                                //   child: IconButton(
                                //       onPressed: () {},
                                //       icon: const Icon(
                                //         Icons.wallet_giftcard,
                                //         color: Color(0xfffcb75e),
                                //       )),
                                // ),

                                Container(
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color:
                                        ui.Color.fromARGB(204, 255, 255, 255),
                                  ),
                                  padding: const EdgeInsets.all(5),
                                  child: IconButton(
                                    onPressed: () async {
                                      await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => MyProfileView(),
                                        ),
                                      );
                                      _controller.forward();
                                      Future.delayed(
                                              Duration(milliseconds: 1200))
                                          .then((value) {
                                        _controller.stop();
                                      });
                                    },
                                    icon: SvgPicture.asset(
                                      "assets/svg/profile.svg",
                                      color: const ui.Color.fromARGB(
                                          255, 247, 195, 40),
                                      height: 25,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                // Container(
                                //   decoration: BoxDecoration(
                                //       shape: BoxShape.circle,
                                //       color: Colors.purple[900]),
                                //   padding: const EdgeInsets.all(5),
                                //   child: IconButton(
                                //       onPressed: () {},
                                //       icon: Icon(
                                //         Icons.card_giftcard,
                                //         color: Colors.white,
                                //       )),
                                // ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ))
              ],
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: deviceHeight * .5,
                ),
                Center(
                  child: Hero(
                    tag: 'loading_tag',
                    child: Column(
                      children: [
                        const CircularProgressIndicator(),
                        SizedBox(
                          height: deviceHeight * .02,
                        ),
                        Text(
                          isRefreshing
                              ? AppText.refreshingEvents.tr
                              : AppText.loadingEvents.tr,
                          style: GoogleFonts.varelaRound(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: eventProvider.length,
                      itemBuilder: (context, index) {
                        return Transform.translate(
                          offset: Offset(-MediaQuery.of(context).size.width * 2,
                              -MediaQuery.of(context).size.height),
                          child: RepaintBoundary(
                            key: eventProvider[index].globalKey,
                            child: eventProvider[index].Marker,
                          ),
                        );
                      }),
                ),
              ],
            ),
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      mapController = controller;
      _setMapStyle();
    });
  }

  void refreshScreen() {
    isRefreshing = true;
    _isloaded = false;
    _onBuildCompleted();
    setState(() {});
  }

  void _setMapStyle() async {
    String style =
        await DefaultAssetBundle.of(context).loadString('assets/mapstyle.json');
    mapController.setMapStyle(style);
  }

  Future<void> _onBuildCompleted() async {
    await Future.wait(eventProvider.map((value) async {
      Marker marker = await _generateMarkersFromWidgets(value);
      _markers[marker.markerId.value] = marker;
    }));

    setState(() {
      _isloaded = true;
    });
  }

  Future<Marker> _generateMarkersFromWidgets(EventModel data) async {
    try {
      await Future.delayed(const Duration(milliseconds: 1600));
      if (data.globalKey.currentContext != null) {
        RenderRepaintBoundary boundary = data.globalKey.currentContext!
            .findRenderObject() as RenderRepaintBoundary;

        ui.Image image = await boundary.toImage(pixelRatio: 2.7);

        ByteData? bytedata =
            await image.toByteData(format: ui.ImageByteFormat.png);
        if (bytedata != null) {
          return Marker(
            onTap: () {
              print(data.id);
              setState(() {
                eventModel = data;
                showInfoContainer = true;
              });
            },
            markerId: MarkerId(data.id.toString()),
            position: data.eventLocation as LatLng,
            icon: BitmapDescriptor.fromBytes(bytedata.buffer.asUint8List()),
          );
        }
      }
    } catch (e) {
      print(e.toString());
    }
    // Handle cases where marker creation fails
    return Marker(markerId: MarkerId(data.id.toString()));
  }

  // Future<Marker> _generateMarkersFromWidgets(EventModel data) async {
  //   try {
  //     RenderRepaintBoundary boundary = data.globalKey.currentContext
  //         ?.findRenderObject() as RenderRepaintBoundary;

  //     ui.Image image = await boundary.toImage(pixelRatio: 2.7);

  //     ByteData? bytedata =
  //         await image.toByteData(format: ui.ImageByteFormat.png);
  //     return Marker(
  //         onTap: () {
  //           print(data.id);
  //           setState(() {
  //             eventModel = data;
  //             showInfoContainer = true;
  //           });
  //         },
  //         markerId: MarkerId(data.id.toString()),
  //         position: data.eventLocation as LatLng,
  //         icon: BitmapDescriptor.fromBytes(bytedata!.buffer.asUint8List()));
  //   } catch (e) {
  //     print(e.toString());
  //   }
  //   return const Marker(markerId: MarkerId(""));
  // }
}

class InvertedConeShapePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final rect =
        Rect.fromPoints(const Offset(0, 0), Offset(size.width, size.height));
    Paint paint = Paint()
      ..shader = const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0xff501CA0),
          Color(0xff6B1E8F)
        ], // Set the gradient colors
      ).createShader(rect);

    final path = Path()
      ..moveTo(size.width / 2, size.height) // Starting point at the bottom
      ..lineTo(0, 0) // Draw a line to the top left corner
      ..lineTo(size.width, 0) // Draw a line to the top right corner
      ..close(); // Close the path to complete the cone shape

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class ImageButton extends StatelessWidget {
  final AnimationController _controller;

  ImageButton(this._controller);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SelectEventCategory(),
            ));
        _controller.forward();
        Future.delayed(Duration(milliseconds: 1200)).then((value) {
          _controller.stop();
        });
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
                width: 95, // Adjust the width as needed
                height: 95, // Adjust the height as needed
              ),
<<<<<<< HEAD
              SizedBox(
                height: 25,
                width: 25,
=======
              const SizedBox(
                height: 50,
                width: 50,
>>>>>>> 4f893d14962d21f62a56b75e5d1ec2ed9924e446
                child: ImageIcon(
                  AssetImage(
                    "assets/png/add.png",
                  ),
                  color: Colors.white,
                ),
              )
              // const Icon(
              //   Icons.add, // You can change the icon as needed
              //   color: Colors.white,
              //   size: 40,
              // ),
            ],
          )),
    );
  }
}
