import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../checkin/landing1.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Color stressButtonColor = Colors.brown.shade900!;
  Color anxietyButtonColor = Colors.brown.shade900!;
  Color stressButtonTextColor = Colors.white;
  Color anxietyButtonTextColor = Colors.white;
  String activeButton = '';



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[900],
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Profile Header
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               // CircleAvatar(
                  //radius: 24,
                 // backgroundImage: NetworkImage('https://example.com/profile.jpg'),
                //),
                SizedBox(height: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Ria Rathod',
                      style: GoogleFonts.montserrat(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    Text(
                      'Joined in 2023',
                      style: GoogleFonts.montserrat(fontSize: 14, color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 8),

            // Welcome Text Box
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: EdgeInsets.only(left: 16),
                child: Text(
                  'Welcome!',
                  style: GoogleFonts.montserrat(fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            // Rectangular Box
            Container(
              padding: EdgeInsets.all(17),
              margin: EdgeInsets.only(top: 8, left: 25, right: 25),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 2),
                  ),
                ],
                borderRadius: BorderRadius.circular(8),
                color: Colors.brown[600],
              ),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Beginning Medication',
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        'Learn the fundamentals',
                        style: GoogleFonts.montserrat(fontSize: 14, color: Colors.white),
                      ),
                    ],
                  ),
                  SizedBox(width: 8),
                  Spacer(),
                  Image.asset('assets/images/rubber.png', width: 75, height: 60),
                ],
              ),
            ),

            SizedBox(height: 8),

            // My Progress Section
            Container(
              margin: EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'My Progress',
                  style: GoogleFonts.montserrat(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (activeButton != 'stress') {
                        stressButtonColor = Colors.white;
                        stressButtonTextColor = Colors.black;
                        anxietyButtonColor = Colors.brown[900]!;
                        anxietyButtonTextColor = Colors.white;
                        activeButton = 'stress';
                      } else {
                        stressButtonColor = Colors.brown[900]!;
                        stressButtonTextColor = Colors.white;
                        activeButton = '';
                      }
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: stressButtonColor,
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    side: BorderSide(color: Colors.white, width: 1.5),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: stressButtonColor == Colors.brown[900] ? Colors.white : Colors.brown[900]!,
                        ),
                        margin: EdgeInsets.only(right: 8),
                      ),
                      Text(
                        'Stress',
                        style: GoogleFonts.montserrat(fontSize: 14, color: stressButtonTextColor),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 4),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (activeButton != 'anxiety') {
                        anxietyButtonColor = Colors.white;
                        anxietyButtonTextColor = Colors.black;
                        stressButtonColor = Colors.brown[900]!;
                        stressButtonTextColor = Colors.white;
                        activeButton = 'anxiety';
                      } else {
                        anxietyButtonColor = Colors.brown[900]!;
                        anxietyButtonTextColor = Colors.white;
                        activeButton = '';
                      }
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: anxietyButtonColor,
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    side: BorderSide(color: Colors.white, width: 1.5),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: anxietyButtonColor == Colors.brown[900] ? Colors.white : Colors.brown[900]!,
                        ),
                        margin: EdgeInsets.only(right: 8),
                      ),
                      Text(
                        'Anxiety',
                        style: GoogleFonts.montserrat(fontSize: 14, color: anxietyButtonTextColor),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            Container(
              width: double.infinity, // Set width to match the parent
              height: 120, // Set the desired height
              padding: EdgeInsets.all(16), // Add padding as needed
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 25), // Adjust margin as needed
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12), // Make it rounded
                border: Border.all(color: Colors.white), // Border color
                color: Colors.brown[900], // Background color
              ),
              child: Center(
                child: Text(
                  'START TRACKING YOUR ANXIETY OVER TIME WITH BI-WEEKLY CHECK-INS',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),


            SizedBox(height: 8),

            // Full-length Button
            ElevatedButton(
              onPressed: () {
                Get.to(() =>  CheckInPage());
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 110), // Adjust the horizontal padding
                backgroundColor: Color(0xFFD88E8E), // Set the background color to D88E8E
              ),
              child: Text('Check In', style: GoogleFonts.montserrat(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.white)),
            ),


            SizedBox(height: 8),

            // Activity History
            Container(
              margin: EdgeInsets.only(left: 16),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Activity History',
                      style: GoogleFonts.montserrat(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    Text(
                      'Looks like you don’t have anything in your history just yet. Want to start with a mini-meditation?',
                      style: GoogleFonts.montserrat(fontSize: 12, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 8),

            // Cards Section
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CardOption(title: 'Breathing', iconData: Icons.wind_power),
                CardOption(title: 'Body Scan', iconData: Icons.account_balance),
                CardOption(title: 'Unwind', iconData: Icons.spa),
              ]
            ),
          ],
        ),
      ),
    );
  }
}
class CardOption extends StatelessWidget {
  final String title;
  final IconData iconData;

  CardOption({required this.title, required this.iconData});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero, // Set margin to zero
      color: Colors.brown[900], // Set the background color of the card
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 2.0), // Set horizontal padding
        leading: Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: 1), // White border
            borderRadius: BorderRadius.circular(8),
            color: Colors.brown.shade400,
          ),
          child: Icon(
            iconData,
            color: Colors.white, // Set the icon color to white
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(color: Colors.white), // Set the text color to white
            ),
            Text(
              '1 min',
              style: TextStyle(color: Colors.white, fontSize: 12), // Set subheading style
            ),
          ],
        ),
        trailing: InkWell(
          onTap: () {
            // Add functionality for the clickable arrow button
            print('Arrow clicked for $title');
          },
          child: Icon(Icons.arrow_forward, color: Colors.white), // Set the arrow color to white
        ),
      ),
    );
  }
}



