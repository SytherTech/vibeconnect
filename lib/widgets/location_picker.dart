import 'package:flutter/material.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:vibeconnect/controller/event_controller.dart';
import 'package:vibeconnect/model/event_model.dart';
import 'package:vibeconnect/utils/userdata.dart';
import 'package:vibeconnect/widgets/button_widget.dart';
import 'package:vibeconnect/widgets/custom_market.dart';

class LocationPicker extends StatefulWidget {
  final String date;
  final String startTime;
  final String endTime;
  final String eventDetails;
  final String EventCost;
  final String Category;
  final int userLimit;
  const LocationPicker(
      {super.key,
      required this.date,
      required this.startTime,
      required this.endTime,
      required this.eventDetails,
      required this.EventCost,
      required this.Category,
      required this.userLimit});

  @override
  _LocationPickerState createState() => _LocationPickerState();
}

class _LocationPickerState extends State<LocationPicker> {
  late GoogleMapController _mapController;
  LatLng _selectedLocation = LatLng(37.7749, -122.4194); // Initial location
  Marker _marker = Marker(
      markerId: MarkerId("selectedLocation"),
      position: LatLng(37.7749, -122.4194),
      draggable: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pick A Location'),
      ),
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: _selectedLocation,
              zoom: 15.0,
            ),
            onMapCreated: (GoogleMapController controller) {
              _mapController = controller;
            },
            onTap: (LatLng location) {
              updateMarker(location);
            },
            markers: Set<Marker>.of([_marker]),
          ),
          Positioned(
              bottom: 16,
              left: 16,
              right: 16,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 60),
                child: ButtonWidget(
                    onpressed: () {
                      context.read<EventController>().addEvent(EventModel(
                          globalKey: GlobalKey(),
                          Marker: CustomMarker(user: UserData().users[0]),
                          category: widget.Category,
                          date: widget.date,
                          startTime: widget.startTime,
                          endTime: widget.endTime,
                          eventImages: [
                            'https://www.chase.com/content/dam/structured-images/chase-ux/heroimage/primary/personal/credit-card/education/basics/seo_how-to-plan-a-birthday-party_12282022.jpg',
                            'https://blog-6aa0.kxcdn.com/wp-content/uploads/2022/06/Partysta%CC%88dte-in-Europa_11_Easy-Resize.com_.jpg'
                          ],
                          eventLocation: _marker.position,
                          eventType: widget.EventCost,
                          id: DateTime.now().toString(),
                          ownerId: UserData().users[0].id,
                          longDes: widget.eventDetails,
                          userLimit: widget.userLimit,
                          shortDes: truncateString(widget.eventDetails),
                          joinedUser: [],
                          requestedUsers: []));
                      _showEventCreatedDialog();
                    },
                    text: 'Pick & Create Event',
                    color: [Color(0xff8767DA), Color(0xff943CBD)],
                    borderRadius: 15),
              )),
        ],
      ),
    );
  }

  void _showEventCreatedDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Event Created'),
          content: Text('Your event has been successfully created!'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                context.read<EventController>().getEvent();
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  String truncateString(String inputString) {
    if (inputString.length > 60) {
      return inputString.substring(0, 60);
    } else {
      return inputString;
    }
  }

  void updateMarker(LatLng location) {
    setState(() {
      _selectedLocation = location;
      _marker = Marker(
        markerId: MarkerId("selectedLocation"),
        position: location,
        draggable: true,
        onDragEnd: (LatLng newPosition) {
          setState(() {
            _selectedLocation = newPosition;
          });
        },
      );
    });
  }
}
