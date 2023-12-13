import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vibeconnect/lang/app_text.dart';

class RoundedSearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
            30.0), // Adjust the border radius for roundness
        color: const Color.fromARGB(
            204, 255, 255, 255), // Set the background color
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: AppText.searchPartyWalkingFun.tr,
                hintStyle: GoogleFonts.varelaRound(
                    color: const Color(0xff592acd), fontSize: 14),
                border: InputBorder.none, // Remove the default input border
                contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 20),
            child: Icon(
              Icons.search,
              size: 25,
              color: Color(0xff592acd),
            ),
          ), // Add your search icon here
        ],
      ),
    );
  }
}
