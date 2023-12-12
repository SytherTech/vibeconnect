import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../utils/styles.dart';
import '../../../views/home/event_creation/event_details.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../model/event_category_model.dart';
import '../../../widgets/button_widget.dart';
import '../../../widgets/location_picker.dart';

class SelectEventCategory extends StatefulWidget {
  SelectEventCategory({super.key});

  @override
  State<SelectEventCategory> createState() => _SelectEventCategoryState();
}

class _SelectEventCategoryState extends State<SelectEventCategory> {
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
      name: 'Art & Culture',
      imageUrl:
          'https://jkgisv.com/blog/Arts-and-Culture/assets/ArtsNew.png', // Replace with actual image URL
    ),
    EventCategory(
      id: 4,
      name: 'Knowledge',
      imageUrl:
          'https://www.dictionary.com/e/wp-content/uploads/2020/01/WisdomvsKnowledge_1000x700_jpg_OHVUvmTo.jpg', // Replace with actual image URL
    ),
    EventCategory(
      id: 5,
      name: 'Party',
      imageUrl:
          'https://t4.ftcdn.net/jpg/01/20/28/25/360_F_120282530_gMCruc8XX2mwf5YtODLV2O1TGHzu4CAb.jpg', // Replace with actual image URL
    ),
    EventCategory(
      id: 6,
      name: 'Concert',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/c/cb/Classical_spectacular10.jpg/1200px-Classical_spectacular10.jpg', // Replace with actual image URL
    ),
    EventCategory(
      id: 7,
      name: 'Hiking',
      imageUrl:
          'https://assets.simpleviewinc.com/simpleview/image/upload/c_fill,f_jpg,g_xy_center,h_465,q_65,w_640,x_1460,y_873/v1/clients/virginia/SV16112203V_023_70d51791-2ade-4e9d-a20d-13b348c58e43.jpg', // Replace with actual image URL
    ),
  ];
  String selectedCategory = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedCategory = eventCategories[0].name;
  }

  DateTime? startDate;
  TimeOfDay? startTime;
  DateTime? endDate;
  TimeOfDay? endTime;

  String eventDetails = '';
  String eventCost = 'Free';
  String costPerPerson = '';
  int userLimit = 1;
  TextEditingController detailsController = TextEditingController();
  TextEditingController costController = TextEditingController();
  TextEditingController costPerPersonController = TextEditingController();

  bool showCostPerPersonTextField = false;

  Future<void> _selectDate(BuildContext context, bool isStartDate) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: Colors.teal, // Set your primary color

            colorScheme: ColorScheme.light(primary: Color(Style.MAIN_COLOR)),
            buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != (isStartDate ? startDate : endDate)) {
      setState(() {
        if (isStartDate) {
          startDate = picked;
        } else {
          endDate = picked;
        }
      });
    }
  }

  Future<void> _selectTime(BuildContext context, bool isStartTime) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: Colors.teal, // Set your primary color

            colorScheme: ColorScheme.light(primary: Color(Style.MAIN_COLOR)),
            buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != (isStartTime ? startTime : endTime)) {
      setState(() {
        if (isStartTime) {
          startTime = picked;
        } else {
          endTime = picked;
        }
      });
    }
  }

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isFree = true;
  @override
  Widget build(BuildContext context) {
    var deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
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
              SizedBox(
                height: 150,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  // gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  //     crossAxisCount: 2, // Adjust the number of columns as needed
                  //     crossAxisSpacing: 8.0,
                  //     mainAxisSpacing: 8.0,
                  //     mainAxisExtent: 200),
                  itemCount: eventCategories
                      .length, // Adjust the number of grid tiles as needed
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          selectedCategory = eventCategories[index].name;
                        });
                      },
                      child: SizedBox(
                        child: Card(
                          color: eventCategories[index].name == selectedCategory
                              ? Colors.purple
                              : Colors.white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              // CachedNetworkImage(
                              //   imageUrl: eventCategories[index]
                              //       .imageUrl, // Replace with your image URL
                              //   placeholder: (context, url) =>
                              //       CircularProgressIndicator(), // Placeholder widget while loading
                              //   errorWidget: (context, url, error) => Icon(Icons
                              //       .error), // Widget to display if image fails to load
                              // ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.network(
                                  eventCategories[index]
                                      .imageUrl, // Replace with your image path
                                  fit: BoxFit.cover,
                                  height:
                                      100.0, // Adjust the height of the image as needed
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  eventCategories[index]
                                      .name, // Replace with your text
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.lato(
                                      fontSize: 16,
                                      color: eventCategories[index].name ==
                                              selectedCategory
                                          ? Colors.white
                                          : Colors.black),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () => _selectDate(context, true),
                              child: TextFormField(
                                enabled: false,
                                decoration: InputDecoration(
                                  hintText: startDate != null
                                      ? "${startDate!.day}/${startDate!.month}/${startDate!.year}"
                                      : 'Select Date',
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16.0),
                      Row(
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () => _selectTime(context, true),
                              child: TextFormField(
                                enabled: false,
                                decoration: InputDecoration(
                                  hintText: startTime != null
                                      ? "${startTime!.hour}:${startTime!.minute}"
                                      : 'Start Time',
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 16.0),
                          Expanded(
                            child: InkWell(
                              onTap: () => _selectTime(context, false),
                              child: TextFormField(
                                enabled: false,
                                decoration: InputDecoration(
                                  hintText: endTime != null
                                      ? "${endTime!.hour}:${endTime!.minute}"
                                      : 'End Time',
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16.0),

                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            TextFormField(
                              controller: detailsController,
                              decoration: const InputDecoration(
                                  labelText: 'Event Details'),
                              maxLines: null, // Allow multiple lines
                              onChanged: (value) {
                                setState(() {
                                  eventDetails = value;
                                });
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter event details';
                                }
                                return null;
                              },
                            ),
                            TextFormField(
                              decoration:
                                  InputDecoration(labelText: 'Users Limit'),
                              keyboardType: TextInputType.number,
                              onChanged: (value) {
                                setState(() {
                                  userLimit = int.parse(value);
                                });
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter user limit';
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 16.0),
                      // DropdownButtonFormField<String>(
                      //   value: eventCost,
                      //   decoration: InputDecoration(labelText: 'Event Cost'),
                      //   items: ['Free', 'Paid'].map((String cost) {
                      //     return DropdownMenuItem<String>(
                      //       value: cost,
                      //       child: Text(cost),
                      //     );
                      //   }).toList(),
                      //   onChanged: (String? value) {
                      //     setState(() {
                      //       eventCost = value!;
                      //       if (value == 'Paid') {
                      //         showCostPerPersonTextField = true;
                      //       } else {
                      //         showCostPerPersonTextField = false;
                      //       }
                      //     });
                      //   },
                      // ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            onTap: () => setState(() {
                              isFree = true;
                            }),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: isFree
                                      ? const Color(0xff8A5ED4)
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(16),
                                  border: isFree
                                      ? null
                                      : Border.all(color: Color(0xff8A5ED4))),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 5),
                              child: Text(
                                "Free",
                                style: GoogleFonts.varelaRound(
                                    fontSize: 16,
                                    color:
                                        isFree ? Colors.white : Colors.black),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () => setState(() {
                              isFree = false;
                            }),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: isFree
                                      ? Colors.white
                                      : const Color(0xff8A5ED4),
                                  borderRadius: BorderRadius.circular(16),
                                  border: isFree
                                      ? Border.all(color: Color(0xff8A5ED4))
                                      : null),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 5),
                              child: Text(
                                "Paid",
                                style: GoogleFonts.varelaRound(
                                    fontSize: 16,
                                    color:
                                        isFree ? Colors.black : Colors.white),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 5.0),
                      if (!isFree)
                        TextField(
                          controller: costPerPersonController,
                          decoration: InputDecoration(
                              labelText: 'Cost Per Person (EURO)'),
                          onChanged: (value) {
                            setState(() {
                              costPerPerson = value;
                            });
                          },
                        ),
                      SizedBox(height: 32.0),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        extendedPadding: const EdgeInsets.symmetric(horizontal: 100),
        backgroundColor: const Color(0xff8A5ED4),
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => LocationPicker(
                      Category: selectedCategory,
                      EventCost: isFree == true
                          ? "Free"
                          : "Paid ${costPerPersonController.text} Euro",
                      date: startDate!.toIso8601String(),
                      startTime: formatTimeOfDay(startTime!),
                      endTime: formatTimeOfDay(endTime!),
                      eventDetails: eventDetails,
                      userLimit: userLimit),
                ));
          }
        },
        label: const Text(
          "Continue",
          style: TextStyle(color: Colors.white, fontSize: 23),
        ),
      ),
    );
  }
}
