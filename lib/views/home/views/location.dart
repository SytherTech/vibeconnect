import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:vibeconnect/utils/styles.dart';
import 'package:vibeconnect/views/home/message_view.dart';
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

class _LocationScreenState extends State<LocationScreen> {
  final Map<String, Marker> _markers = {};

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
  bool _isloaded = false;
  bool showInfoContainer = false;
  late GoogleMapController mapController;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) => _onBuildCompleted());

    // TODO: implement initState
    super.initState();
  }

  List<EventModel> eventProvider = [];
  EventModel? eventModel;
  @override
  Widget build(BuildContext context) {
    eventProvider = Provider.of<EventController>(context).events;

    return Scaffold(
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: ImageButton(),
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
                      setState(() {
                        showInfoContainer = false;
                      });
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
                    zoomControlsEnabled: true,
                    indoorViewEnabled: false,
                    trafficEnabled: false,
                    mapToolbarEnabled: true,
                    initialCameraPosition: CameraPosition(
                      target: LatLng(37.7749, -122.4194),
                      zoom: 13.0,
                    ),
                    markers: _markers.values.toSet()),
                if (showInfoContainer)
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                          padding: const EdgeInsets.only(bottom: 30),
                          child: EventCardWidget(
                            eventModel: eventModel!,
                          ))),
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
                              IconButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              MyProfileView()));
                                },
                                icon: SvgPicture.asset(
                                  "assets/svg/profile.svg",
                                  color: Color(Style.MAIN_COLOR),
                                  height: 30,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Expanded(child: RoundedSearchBar())
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20, right: 10),
                            child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color(0xff3370f5)),
                                    padding: const EdgeInsets.all(5),
                                    child: IconButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      EventRequestScreen()));
                                        },
                                        icon: Icon(
                                          Icons.checklist_sharp,
                                          color: Colors.white,
                                        )),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color(0xffd6587f)),
                                    padding: const EdgeInsets.all(5),
                                    child: IconButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      GroupChatScreen()));
                                        },
                                        icon: SvgPicture.asset(
                                          "assets/svg/msg.svg",
                                          color: Colors.white,
                                        )),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color(0xfffcb75e)),
                                    padding: const EdgeInsets.all(5),
                                    child: IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.wallet_giftcard,
                                          color: Colors.white,
                                        )),
                                  ),
                                  const SizedBox(
                                    height: 15,
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
                            ),
                          )
                        ],
                      ),
                    ))
              ],
            )
          : ListView.builder(
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
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      mapController = controller;
      _setMapStyle();
    });
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
      RenderRepaintBoundary boundary = data.globalKey.currentContext
          ?.findRenderObject() as RenderRepaintBoundary;

      ui.Image image = await boundary.toImage(pixelRatio: 2.7);

      ByteData? bytedata =
          await image.toByteData(format: ui.ImageByteFormat.png);
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
          icon: BitmapDescriptor.fromBytes(bytedata!.buffer.asUint8List()));
    } catch (e) {
      print(e.toString());
    }
    return Marker(markerId: MarkerId(""));
  }
}

class InvertedConeShapePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromPoints(Offset(0, 0), Offset(size.width, size.height));
    Paint paint = Paint()
      ..shader = LinearGradient(
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
                width: 95, // Adjust the width as needed
                height: 95, // Adjust the height as needed
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