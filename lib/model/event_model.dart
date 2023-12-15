import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../model/user_model.dart';

class EventModel {
  final String? id;
  final String? ownerId;
  final String? shortDes;
  final String? longDes;
  final String? startTime;
  final String? endTime;
  final String? date;
  final String? category;
  final LatLng? eventLocation;
  final int? userLimit;
  final Widget Marker;
  final String? eventType;
  final GlobalKey globalKey;
  List<String>? eventImages = [];
  List<UserModel>? joinedUser = [];
  List<UserModel>? requestedUsers = [];

  EventModel({
    this.id,
    this.ownerId,
    this.shortDes,
    this.eventType,
    this.longDes,
    this.userLimit,
    this.eventLocation,
    this.category,
    this.startTime,
    this.requestedUsers,
    this.joinedUser,
    this.eventImages,
    required this.globalKey,
    required this.Marker,
    this.endTime,
    this.date,
  });
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'ownerId': ownerId,
      'shortDes': shortDes,
      'longDes': longDes,
      'startTime': startTime,
      'endTime': endTime,
      'date': date,
      'category': category,
      'eventType': eventType,
      'eventImages': eventImages,
      'joinedUser': joinedUser,
      'requestedUsers': requestedUsers,
      'eventLocation': {
        'latitude': eventLocation?.latitude,
        'longitude': eventLocation?.longitude,
      },
      'userLimit': userLimit,
    };
  }
  //  factory EventModel.fromJson(Map<String, dynamic> json) {
  //   return EventModel(
  //     id: json['id'],
  //     ownerId: json['ownerId'],
  //     shortDes: json['shortDes'],
  //     longDes: json['longDes'],
  //     startTime: json['startTime'],
  //     endTime: json['endTime'],
  //     date: json['date'],
  //     category: json['category'],
  //     userLimit: json['userLimit'],
  //     eventType: json['eventType'],
  //     globalKey: GlobalKey(),
  //     Marker: /* Create your Marker widget here based on your requirements */,
  //     eventLocation: LatLng(
  //       json['eventLocation']['latitude'],
  //       json['eventLocation']['longitude'],
  //     ),
  //     eventImages: List<String>.from(json['eventImages']),
  //     // You'll need to handle 'joinedUser' and 'requestedUsers' similarly based on their structure
  //     joinedUser: json['joinedUser'] != null
  //         ? List<UserModel>.from(
  //             json['joinedUser'].map((user) => UserModel.fromJson(user)))
  //         : [],
  //     requestedUsers: json['requestedUsers'] != null
  //         ? List<UserModel>.from(
  //             json['requestedUsers'].map((user) => UserModel.fromJson(user)))
  //         : [],
  //   );
  // }
}
