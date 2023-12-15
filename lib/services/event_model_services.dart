// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import '../model/event_model.dart';

// class EventController with ChangeNotifier {
//   List<EventModel> _events = [];

//   List<EventModel> get events => [..._events];

//   Future<void> fetchEvents() async {
//     try {
//       // Replace 'YOUR_API_ENDPOINT' with your actual API endpoint for fetching events
//       final response = await http.get(Uri.parse('YOUR_API_ENDPOINT'));

//       if (response.statusCode == 200) {
//         final List<dynamic> responseData = json.decode(response.body);

//         _events = responseData.map((eventData) {
//           // Assuming EventModel has a constructor that takes a Map
//           return EventModel.fromJson(eventData);
//         }).toList();

//         notifyListeners();
//       } else {
//         // Handle other status codes or errors
//         print('Failed to fetch events: ${response.statusCode}');
//       }
//     } catch (error) {
//       // Handle network errors
//       print('Error fetching events: $error');
//     }
//   }

//   void addEvent(EventModel model) {
//     _events.add(model);
//     notifyListeners();
//   }
// }
