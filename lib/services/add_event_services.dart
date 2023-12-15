// import 'dart:convert';
// import 'package:http/http.dart' as http;

// import '../model/event_model.dart';

// class AddEventService {
//   static const String baseUrl = 'https://your-backend-api.com/events';

//   Future<EventModel?> createEvent(EventModel event) async {
//     try {
//       final response = await http.post(
//         Uri.parse(baseUrl),
//         headers: <String, String>{
//           'Content-Type': 'application/json; charset=UTF-8',
//         },
//         body: jsonEncode(event.toJson()), // Convert EventModel to JSON
//       );

//       if (response.statusCode == 201) {
//         // Event successfully created, parse and return response as EventModel
//         final Map<String, dynamic> responseBody = json.decode(response.body);
//         return EventModel.fromJson(responseBody);
//       } else {
//         // Handle other status codes or errors
//         return null;
//       }
//     } catch (e) {
//       // Handle network errors
//       return null;
//     }
//   }
// }
