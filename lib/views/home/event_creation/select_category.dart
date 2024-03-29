import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vibeconnect/lang/app_text.dart';
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

            colorScheme:
                const ColorScheme.light(primary: Color(Style.MAIN_COLOR)),
            buttonTheme:
                const ButtonThemeData(textTheme: ButtonTextTheme.primary),
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

            colorScheme:
                const ColorScheme.light(primary: Color(Style.MAIN_COLOR)),
            buttonTheme:
                const ButtonThemeData(textTheme: ButtonTextTheme.primary),
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
        reverse: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Select A Category",
                style: GoogleFonts.varelaRound(
                    fontSize: 18,
                    color: Colors.grey[700],
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 200,
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
                          surfaceTintColor: Colors.white,
                          elevation: 3,
                          color: eventCategories[index].name == selectedCategory
                              ? Color(0xff8767DA)
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
                                  width: 200,
                                  height:
                                      140.0, // Adjust the height of the image as needed
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(
                                  eventCategories[index]
                                      .name, // Replace with your text
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.varelaRound(
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
                                style: GoogleFonts.varelaRound(
                                    fontWeight: FontWeight.w600),
                                decoration: InputDecoration(
                                  hintText: startDate != null
                                      ? "${startDate!.day}/${startDate!.month}/${startDate!.year}"
                                      : AppText.selectDate.tr,
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
                                style: GoogleFonts.varelaRound(
                                    fontWeight: FontWeight.w600),
                                enabled: false,
                                decoration: InputDecoration(
                                  hintText: startTime != null
                                      ? "${startTime!.hour}:${startTime!.minute}"
                                      : AppText.startTime.tr,
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
                                style: GoogleFonts.varelaRound(
                                    fontWeight: FontWeight.w600),
                                decoration: InputDecoration(
                                  hintText: endTime != null
                                      ? "${endTime!.hour}:${endTime!.minute}"
                                      : AppText.endTime.tr,
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
                              cursorColor: Color(0xff8767DA),
                              controller: detailsController,
                              style: GoogleFonts.varelaRound(
                                  fontWeight: FontWeight.w600),
                              decoration: const InputDecoration(
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Color(0xff8767DA))),
                                  hintText: 'Event Details'),
                              maxLines: null, // Allow multiple lines
                              onChanged: (value) {
                                setState(() {
                                  eventDetails = value;
                                });
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return AppText.pleaseEnterEventDetails.tr;
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              cursorColor: Color(0xff8767DA),
                              style: GoogleFonts.varelaRound(
                                  fontWeight: FontWeight.w600),
                              decoration: InputDecoration(
                                hintText: 'Users Limit',
                                focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xff8767DA))),
                              ),
                              keyboardType: TextInputType.number,
                              onChanged: (value) {
                                setState(() {
                                  userLimit = int.parse(value);
                                });
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return AppText.pleaseEnteruserlimit.tr;
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 16.0),
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
                                      : Border.all(
                                          color: const Color(0xff8A5ED4))),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 5),
                              child: Text(
                                AppText.free.tr,
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
                                AppText.paid.tr,
                                style: GoogleFonts.varelaRound(
                                    fontSize: 16,
                                    color:
                                        isFree ? Colors.black : Colors.white),
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 5.0),
                      if (!isFree)
                        TextField(
                          controller: costPerPersonController,
                          decoration: InputDecoration(
                              labelText: AppText.costPerPersonEURO.tr),
                          onChanged: (value) {
                            setState(() {
                              costPerPerson = value;
                            });
                          },
                        ),
                      const SizedBox(height: 32.0),
                    ],
                  ),
                ),
              ),
              Center(
                child: FloatingActionButton.extended(
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
              ),
            ],
          ),
        ),
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      // floatingActionButton: FloatingActionButton.extended(
      //   extendedPadding: const EdgeInsets.symmetric(horizontal: 100),
      //   backgroundColor: const Color(0xff8A5ED4),
      //   onPressed: () {
      //     if (_formKey.currentState!.validate()) {
      //       Navigator.pushReplacement(
      //           context,
      //           MaterialPageRoute(
      //             builder: (context) => LocationPicker(
      //                 Category: selectedCategory,
      //                 EventCost: isFree == true
      //                     ? "Free"
      //                     : "Paid ${costPerPersonController.text} Euro",
      //                 date: startDate!.toIso8601String(),
      //                 startTime: formatTimeOfDay(startTime!),
      //                 endTime: formatTimeOfDay(endTime!),
      //                 eventDetails: eventDetails,
      //                 userLimit: userLimit),
      //           ));
      //     }
      //   },
      //   label: const Text(
      //     "Continue",
      //     style: TextStyle(color: Colors.white, fontSize: 23),
      //   ),
      // ),
    );
  }
}
