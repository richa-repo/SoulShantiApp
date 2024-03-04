import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:navigation/navigator/navigation.dart';

import '../home/home.dart';

class CheckInPage11 extends StatefulWidget {
  @override
  _CheckInPageState createState() => _CheckInPageState();
}

class _CheckInPageState extends State<CheckInPage11> {
  String reflectionText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[900],
      appBar: AppBar(
        backgroundColor: Colors.brown[800],
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            // Handle back button press
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Check-in',
          textAlign: TextAlign.center,
          style: GoogleFonts.montserrat(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.close, color: Colors.white),
            onPressed: () {
              // Handle close button press
              Get.to(() =>  const navigation());

            },
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(2),
          child: Container(
            color: Colors.white,
            height: 2,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: kToolbarHeight), // Spacer to push content below app bar
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '11/11',
                  style: GoogleFonts.montserrat(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 35,
                ),
              ],
            ),
            SizedBox(height: 16),
            Text(
              'Use this space to reflect on how you’ve been feeling this month',
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 16),

            Container(
              width: 350,
              height: 198, // Adjust the width as needed
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: TextField(
                  style: GoogleFonts.montserrat(
                    color: Colors.white,
                  ),
                  maxLines: null, // Allows the text field to expand vertically as needed
                  decoration: InputDecoration(
                    border: InputBorder.none, // Remove the border from the text field
                    hintText: 'Write a few words here',
                    hintStyle: GoogleFonts.montserrat(
                      color: Colors.white.withOpacity(0.5),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      reflectionText = value;
                    });
                  },
                ),
              ),
            ),

            SizedBox(height: 25),

            Center(
              child: SizedBox(
                width: 250, // Adjust the width as needed
                child: ElevatedButton(
                  onPressed: () {
                    // Handle save button press
                    print('Reflection text: $reflectionText');
                    Get.to(() =>  navigation());

                    // Add your logic to save the reflection text
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red[300],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Text(
                      'Save',
                      style: GoogleFonts.montserrat(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
