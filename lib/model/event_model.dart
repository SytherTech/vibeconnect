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
}
