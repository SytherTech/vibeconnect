import 'package:flutter/material.dart';
import 'package:vibeconnect/utils/userdata.dart';

class LocationDrawer extends StatefulWidget {
  @override
  _LocationDrawerState createState() => _LocationDrawerState();
}

class _LocationDrawerState extends State<LocationDrawer> {
  bool isNotificationEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Container(
        color: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: const BoxDecoration(color: Colors.white),
              child: Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.settings),
                      Row(
                        children: [
                          SizedBox(
                            height: 25,
                            width: 30,
                            child: Image(
                              image: NetworkImage(
                                  'https://tse1.mm.bing.net/th?id=OIP.zH41bgoFt1vWg2zFXxTIrAHaDu&pid=Api&P=0&h=220'),
                              fit: BoxFit.fill,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            '100',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          )
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  // BUY BUTTON
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const SizedBox(
                        height: 70,
                        width: 70,
                      ),
                      SizedBox(
                        height: 100,
                        width: 100,
                        child: ClipOval(
                          child: Image(
                            image: NetworkImage(
                              UserData().users[0].imgUrl![0].toString(),
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const Spacer(),
                      Container(
                        width: 50,
                        height: 30,
                        decoration: BoxDecoration(
                            color: Colors.purple,
                            borderRadius: BorderRadius.circular(18)),
                        child: const Center(
                          child: Text(
                            'Buy',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Notifiche',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Switch(
                    activeColor: Colors.purple,
                    value: isNotificationEnabled,
                    onChanged: (value) {
                      setState(() {
                        isNotificationEnabled = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            const Divider(),
            ListTile(
              title: const Text(
                'Premium',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {
                // Handle the tap on the Home item
                Navigator.pop(context); // Close the drawer
              },
            ),
            const Divider(),
            ListTile(
              title: const Text(
                'Regole',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {
                // Handle the tap on the Settings item
                Navigator.pop(context); // Close the drawer
              },
            ),
            const Divider(),
            ListTile(
              title: const Text(
                'Tutorial',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {
                // Handle the tap on the Settings item
                Navigator.pop(context); // Close the drawer
              },
            ),
            const Divider(),
            ListTile(
              title: const Text(
                'Privacy & Policy',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {
                // Handle the tap on the Settings item
                Navigator.pop(context); // Close the drawer
              },
            ),
            const Divider(),
            ListTile(
              title: const Text(
                'Chi siamo?',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {
                // Handle the tap on the Settings item
                Navigator.pop(context); // Close the drawer
              },
            ),
          ],
        ),
      ),
    );
  }
}
