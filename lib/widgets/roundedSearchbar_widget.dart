import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RoundedSearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
            30.0), // Adjust the border radius for roundness
        color: Color(0xff592acd), // Set the background color
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search (Party , Walking , Fun)',
                hintStyle: GoogleFonts.roboto(
                    color: Color.fromARGB(255, 255, 255, 255), fontSize: 14),
                border: InputBorder.none, // Remove the default input border
                contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Icon(
              Icons.search,
              size: 25,
              color: Colors.white,
            ),
          ), // Add your search icon here
        ],
      ),
    );
  }
}
