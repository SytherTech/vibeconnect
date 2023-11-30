import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vibe_connect/views/home/event_creation/event_details.dart';

import '../../../model/event_category_model.dart';

class SelectEventCategory extends StatelessWidget {
  SelectEventCategory({super.key});

  List<EventCategory> eventCategories = [
    EventCategory(
      id: 1,
      name: 'Jogging',
      imageUrl:
          'https://www.health.com/thmb/AZ3xSTI7Qjyy5iE4So6_9ANQZY0=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/walking-GettyImages-519625687-d8e188ed643b42088856ede78866288a.jpg', // Replace with actual image URL
    ),
    EventCategory(
      id: 2,
      name: 'Fun',
      imageUrl:
          'https://cdn.tinybuddha.com/wp-content/uploads/2014/09/Friends-Having-Fun.png', // Replace with actual image URL
    ),
    EventCategory(
      id: 3,
      name: 'Party',
      imageUrl:
          'https://t4.ftcdn.net/jpg/01/20/28/25/360_F_120282530_gMCruc8XX2mwf5YtODLV2O1TGHzu4CAb.jpg', // Replace with actual image URL
    ),
    EventCategory(
      id: 4,
      name: 'Concert',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/c/cb/Classical_spectacular10.jpg/1200px-Classical_spectacular10.jpg', // Replace with actual image URL
    ),
    EventCategory(
      id: 5,
      name: 'Hiking',
      imageUrl:
          'https://assets.simpleviewinc.com/simpleview/image/upload/c_fill,f_jpg,g_xy_center,h_465,q_65,w_640,x_1460,y_873/v1/clients/virginia/SV16112203V_023_70d51791-2ade-4e9d-a20d-13b348c58e43.jpg', // Replace with actual image URL
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Select A Category",
              style: GoogleFonts.lato(
                  fontSize: 18,
                  color: Colors.grey[700],
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
                child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Adjust the number of columns as needed
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
              ),
              itemCount: eventCategories
                  .length, // Adjust the number of grid tiles as needed
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EventDetailsScreen(
                              category: eventCategories[index].name),
                        ));
                  },
                  child: GridTile(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.network(
                            eventCategories[index]
                                .imageUrl, // Replace with your image path
                            fit: BoxFit.cover,
                            height:
                                150.0, // Adjust the height of the image as needed
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              eventCategories[index]
                                  .name, // Replace with your text
                              textAlign: TextAlign.center,
                              style: GoogleFonts.lato(fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ))
          ],
        ),
      ),
    );
  }
}
