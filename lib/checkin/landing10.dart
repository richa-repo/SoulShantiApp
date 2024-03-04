import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:navigation/checkin/landing11.dart';
import 'package:navigation/checkin/landing6..dart';

import '../navigator/navigation.dart';
import 'landing2.dart';
import 'landing3.dart';
import 'landing4.dart';

class CheckInPage10 extends StatefulWidget {
  @override
  _CheckInPageState createState() => _CheckInPageState();
}

class _CheckInPageState extends State<CheckInPage10> {
  int currentStep = 10;
  String selectedOption = "";

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
              Get.to(() =>  navigation());

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
      body: Stack(
        children: [
          GestureDetector(
            onTap: () {
              // Deselect the option when tapping outside the buttons
              setState(() {
                selectedOption = "";
              });
            },
            child: Container(
              color: Colors.transparent,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '$currentStep/11',
                  style: GoogleFonts.montserrat(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Over the last two weeks, how often have you been bothered by any of the following problems? Being so restless that it’s hard to sit still.',
                  style: GoogleFonts.montserrat(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildOptionButton('Nearly every day'),
                    SizedBox(height: 16),
                    buildOptionButton('More than half the days'),
                    SizedBox(height: 16),
                    buildOptionButton('Several days'),
                    SizedBox(height: 16),
                    buildOptionButton('Not at all'),
                    SizedBox(height: 16),

                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            width: 350,
            height: 45,
            child: ElevatedButton(
              onPressed: selectedOption.isNotEmpty
                  ? () {
                Get.to(() => CheckInPage11());
                // Handle next button press and save selectedOption
                print('Selected Option: $selectedOption');
                // Add your logic to save the selected option

                // Increment the current step


              }
                  : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: selectedOption.isNotEmpty
                    ? Colors.red[300]
                    : Colors.grey, // Adjust the colors as needed
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      20.0), // Adjust the value for the desired roundness
                ),
              ),
              child: Text(
                selectedOption.isNotEmpty ? 'Next' : 'Select an option first',
                style: GoogleFonts.montserrat(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildOptionButton(String option) {
    bool isSelected = selectedOption == option;

    return InkWell(
      onTap: () {
        setState(() {
          selectedOption = option;
        });
      },
      child: Container(
        width: 300,
        child: Card(
          color: isSelected ? Colors.brown[300] : Colors.brown[900],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0),
            side: BorderSide(color: Colors.white, width: 1.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                option,
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(
                  color: isSelected ? Colors.black : Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
