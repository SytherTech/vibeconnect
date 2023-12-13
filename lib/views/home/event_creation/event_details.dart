import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vibeconnect/lang/app_text.dart';
import '../../../model/event_model.dart';
import '../../../utils/userdata.dart';
import '../../../widgets/custom_market.dart';

import '../../../widgets/button_widget.dart';
import '../../../widgets/location_picker.dart';

class EventDetailsScreen extends StatefulWidget {
  final String category;

  const EventDetailsScreen({super.key, required this.category});

  @override
  _EventDetailsScreenState createState() => _EventDetailsScreenState();
}

class _EventDetailsScreenState extends State<EventDetailsScreen> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppText.eventDetails.tr),
      ),
      body: Padding(
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
              TextField(
                controller: detailsController,
                decoration: InputDecoration(labelText: AppText.eventDetails.tr),
                maxLines: null, // Allow multiple lines
                onChanged: (value) {
                  setState(() {
                    eventDetails = value;
                  });
                },
              ),
              TextField(
                decoration: InputDecoration(labelText: AppText.usersLimit.tr),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    userLimit = int.parse(value);
                  });
                },
              ),
              const SizedBox(height: 16.0),
              DropdownButtonFormField<String>(
                value: eventCost,
                decoration: InputDecoration(labelText: AppText.eventCost.tr),
                items: ['Free', 'Paid'].map((String cost) {
                  return DropdownMenuItem<String>(
                    value: cost,
                    child: Text(cost),
                  );
                }).toList(),
                onChanged: (String? value) {
                  setState(() {
                    eventCost = value!;
                    if (value == 'Paid') {
                      showCostPerPersonTextField = true;
                    } else {
                      showCostPerPersonTextField = false;
                    }
                  });
                },
              ),
              const SizedBox(height: 16.0),
              if (showCostPerPersonTextField)
                TextField(
                  controller: costPerPersonController,
                  decoration:
                      InputDecoration(labelText: AppText.costPerPerson.tr),
                  onChanged: (value) {
                    setState(() {
                      costPerPerson = value;
                    });
                  },
                ),
              const SizedBox(height: 32.0),
              ButtonWidget(
                  onpressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LocationPicker(
                              Category: widget.category,
                              EventCost: showCostPerPersonTextField == true
                                  ? "$eventCost($costPerPerson)"
                                  : eventCost,
                              date: startDate!.toIso8601String(),
                              startTime: formatTimeOfDay(startTime!),
                              endTime: formatTimeOfDay(endTime!),
                              eventDetails: eventDetails,
                              userLimit: userLimit),
                        ));
                  },
                  text: AppText.continuE.tr,
                  color: const [Color(0xff8767DA), Color(0xff943CBD)],
                  borderRadius: 15)
            ],
          ),
        ),
      ),
    );
  }
}

String formatTimeOfDay(TimeOfDay timeOfDay) {
  int hour = timeOfDay.hourOfPeriod;
  int minute = timeOfDay.minute;
  String period = timeOfDay.period == DayPeriod.am ? 'AM' : 'PM';

  // Format the hour to have two digits
  String formattedHour = hour.toString().padLeft(2, '0');

  // Format the minute to have two digits
  String formattedMinute = minute.toString().padLeft(2, '0');

  // Combine everything to create the formatted time
  return '$formattedHour:$formattedMinute $period';
}
