import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../model/event_model.dart';
import '../../../utils/userdata.dart';
import '../../../widgets/custom_market.dart';

class EventController with ChangeNotifier {
  List<EventModel> _events = [
    EventModel(
        id: '1',
        category: 'Party',
        eventType: 'Free',
        userLimit: 4,
        joinedUser: [
          UserData().users.where((element) => element.id == 'owner_4').first
        ],
        requestedUsers: [
          UserData().users.where((element) => element.id == 'owner_2').first,
          UserData().users.where((element) => element.id == 'owner_3').first,
          UserData().users.where((element) => element.id == 'owner_3').first,
        ],
        Marker: CustomMarker(
            user: UserData()
                .users
                .where((element) => element.id == 'owner_1')
                .first),
        globalKey: GlobalKey(),
        shortDes:
            'Hey There , Looking For Some Fun ? Im Arranging a Party Come !',
        longDes:
            'Hey There , Looking For Some Fun ? Im Arranging a Party Come . Every one should have to come at 9 PM , Its a great party dont forget to bring some gifts . heheh !!!',
        startTime: '8 PM',
        endTime: '10 PM',
        eventLocation: const LatLng(45.484716, 9.148910),
        ownerId: 'owner_1',
        eventImages: [
          'https://ibexmag.com/wp-content/uploads/2012/06/EventManagement.jpg',
          'https://5.imimg.com/data5/SELLER/Default/2021/8/HJ/QB/CH/5844513/corporate-event-management-services-500x500.jpg'
        ]),
    EventModel(
        id: '2',
        category: 'Party',
        userLimit: 7,
        joinedUser: [
          UserData().users.where((element) => element.id == 'owner_4').first,
          UserData().users.where((element) => element.id == 'owner_5').first,
        ],
        requestedUsers: [],
        eventType: 'Paid',
        globalKey: GlobalKey(),
        Marker: CustomMarker(
            user: UserData()
                .users
                .where((element) => element.id == 'owner_2')
                .first),
        shortDes:
            'Hey There , Looking For Some Fun ? Im Arranging a Party Come !',
        longDes:
            'Hey There , Looking For Some Fun ? Im Arranging a Party Come . Every one should have to come at 9 PM , Its a great party dont forget to bring some gifts . heheh !!!',
        startTime: '7 PM',
        eventImages: [
          'https://img.freepik.com/free-photo/close-up-women-bar-with-drinks_23-2149119686.jpg',
          'https://img.freepik.com/premium-photo/young-people-celebrating-party-drink-dance_31965-26061.jpg'
        ],
        endTime: '9 PM',
        eventLocation: const LatLng(45.466966, 9.187493),
        ownerId: 'owner_2'),
    EventModel(
        eventType: 'Paid',
        id: '3',
        category: 'Party',
        userLimit: 10,
        joinedUser: [],
        requestedUsers: [],
        globalKey: GlobalKey(),
        Marker: CustomMarker(
            user: UserData()
                .users
                .where((element) => element.id == 'owner_3')
                .first),
        shortDes:
            'Hey There , Looking For Some Fun ? Im Arranging a Party Come !',
        longDes:
            'Hey There , Looking For Some Fun ? Im Arranging a Party Come . Every one should have to come at 9 PM , Its a great party dont forget to bring some gifts . heheh !!!',
        startTime: '7 PM',
        eventImages: [
          'https://www.chase.com/content/dam/structured-images/chase-ux/heroimage/primary/personal/credit-card/education/basics/seo_how-to-plan-a-birthday-party_12282022.jpg',
          'https://blog-6aa0.kxcdn.com/wp-content/uploads/2022/06/Partysta%CC%88dte-in-Europa_11_Easy-Resize.com_.jpg'
        ],
        endTime: '9 PM',
        eventLocation: const LatLng(45.499026, 9.197087),
        ownerId: 'owner_3'),
    EventModel(
        eventType: 'Paid',
        id: '4',
        category: 'Party',
        userLimit: 10,
        joinedUser: [],
        requestedUsers: [],
        globalKey: GlobalKey(),
        Marker: CustomMarker(
            user: UserData()
                .users
                .where((element) => element.id == 'owner_3')
                .first),
        shortDes:
            'Hey There , Looking For Some Fun ? Im Arranging a Party Come !',
        longDes:
            'Hey There , Looking For Some Fun ? Im Arranging a Party Come . Every one should have to come at 9 PM , Its a great party dont forget to bring some gifts . heheh !!!',
        startTime: '7 PM',
        eventImages: [
          'https://www.chase.com/content/dam/structured-images/chase-ux/heroimage/primary/personal/credit-card/education/basics/seo_how-to-plan-a-birthday-party_12282022.jpg',
          'https://blog-6aa0.kxcdn.com/wp-content/uploads/2022/06/Partysta%CC%88dte-in-Europa_11_Easy-Resize.com_.jpg'
        ],
        endTime: '9 PM',
        eventLocation: const LatLng(45.466250, 9.169324),
        ownerId: 'owner_3'),
    EventModel(
        eventType: 'Paid',
        id: '5',
        category: 'Party',
        userLimit: 10,
        joinedUser: [],
        requestedUsers: [],
        globalKey: GlobalKey(),
        Marker: CustomMarker(
            user: UserData()
                .users
                .where((element) => element.id == 'owner_3')
                .first),
        shortDes:
            'Hey There , Looking For Some Fun ? Im Arranging a Party Come !',
        longDes:
            'Hey There , Looking For Some Fun ? Im Arranging a Party Come . Every one should have to come at 9 PM , Its a great party dont forget to bring some gifts . heheh !!!',
        startTime: '7 PM',
        eventImages: [
          'https://www.chase.com/content/dam/structured-images/chase-ux/heroimage/primary/personal/credit-card/education/basics/seo_how-to-plan-a-birthday-party_12282022.jpg',
          'https://blog-6aa0.kxcdn.com/wp-content/uploads/2022/06/Partysta%CC%88dte-in-Europa_11_Easy-Resize.com_.jpg'
        ],
        endTime: '9 PM',
        eventLocation: const LatLng(45.498883, 9.136866),
        ownerId: 'owner_3'),
    EventModel(
        eventType: 'Paid',
        id: '6',
        category: 'Party',
        userLimit: 10,
        joinedUser: [],
        requestedUsers: [],
        globalKey: GlobalKey(),
        Marker: CustomMarker(
            user: UserData()
                .users
                .where((element) => element.id == 'owner_3')
                .first),
        shortDes:
            'Hey There , Looking For Some Fun ? Im Arranging a Party Come !',
        longDes:
            'Hey There , Looking For Some Fun ? Im Arranging a Party Come . Every one should have to come at 9 PM , Its a great party dont forget to bring some gifts . heheh !!!',
        startTime: '7 PM',
        eventImages: [
          'https://www.chase.com/content/dam/structured-images/chase-ux/heroimage/primary/personal/credit-card/education/basics/seo_how-to-plan-a-birthday-party_12282022.jpg',
          'https://blog-6aa0.kxcdn.com/wp-content/uploads/2022/06/Partysta%CC%88dte-in-Europa_11_Easy-Resize.com_.jpg'
        ],
        endTime: '9 PM',
        eventLocation: const LatLng(45.478561, 9.213418),
        ownerId: 'owner_3'),
    EventModel(
        eventType: 'Paid',
        id: '7',
        category: 'Party',
        userLimit: 10,
        joinedUser: [],
        requestedUsers: [],
        globalKey: GlobalKey(),
        Marker: CustomMarker(
            user: UserData()
                .users
                .where((element) => element.id == 'owner_3')
                .first),
        shortDes:
            'Hey There , Looking For Some Fun ? Im Arranging a Party Come !',
        longDes:
            'Hey There , Looking For Some Fun ? Im Arranging a Party Come . Every one should have to come at 9 PM , Its a great party dont forget to bring some gifts . heheh !!!',
        startTime: '7 PM',
        eventImages: [
          'https://www.chase.com/content/dam/structured-images/chase-ux/heroimage/primary/personal/credit-card/education/basics/seo_how-to-plan-a-birthday-party_12282022.jpg',
          'https://blog-6aa0.kxcdn.com/wp-content/uploads/2022/06/Partysta%CC%88dte-in-Europa_11_Easy-Resize.com_.jpg'
        ],
        endTime: '9 PM',
        eventLocation: const LatLng(45.456800, 9.198312),
        ownerId: 'owner_3'),
    EventModel(
        eventType: 'Paid',
        id: '8',
        category: 'Party',
        userLimit: 10,
        joinedUser: [],
        requestedUsers: [],
        globalKey: GlobalKey(),
        Marker: CustomMarker(
            user: UserData()
                .users
                .where((element) => element.id == 'owner_3')
                .first),
        shortDes:
            'Hey There , Looking For Some Fun ? Im Arranging a Party Come !',
        longDes:
            'Hey There , Looking For Some Fun ? Im Arranging a Party Come . Every one should have to come at 9 PM , Its a great party dont forget to bring some gifts . heheh !!!',
        startTime: '7 PM',
        eventImages: [
          'https://www.chase.com/content/dam/structured-images/chase-ux/heroimage/primary/personal/credit-card/education/basics/seo_how-to-plan-a-birthday-party_12282022.jpg',
          'https://blog-6aa0.kxcdn.com/wp-content/uploads/2022/06/Partysta%CC%88dte-in-Europa_11_Easy-Resize.com_.jpg'
        ],
        endTime: '9 PM',
        eventLocation: const LatLng(45.466536, 9.152380),
        ownerId: 'owner_3'),
  ];

  List<EventModel> get events => [..._events];

  void getEvent() async {
    _events = events;
    notifyListeners();
  }

  void addEvent(EventModel model) {
    _events.add(model);
    notifyListeners();
  }
}
