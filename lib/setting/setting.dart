import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Today/today.dart';
import '../login/login.dart';
import '../navigator/navigation.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  void logOut() async{
    await FirebaseAuth.instance.signOut();
    Navigator.popUntil(context, (route) => route.isFirst);
    Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context) => MyLogin()
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[900],
      appBar: AppBar(
        backgroundColor: Colors.brown[900],
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color: Colors.white),
          onPressed: () {
            // Handle back button press
            Get.to(() =>  navigation());          },
        ),
        title: Text(
          'Settings',
          style: GoogleFonts.montserrat(color: Colors.white,fontWeight: FontWeight.bold,fontSize:30),
        ),

      actions: [
        IconButton(
          icon: Icon(Icons.exit_to_app, size: 30.0, color: Colors.white),
          onPressed: () {
            logOut();
            // Add your like functionality here
          },
        ),
      ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 16),
          SettingsItem(
            text: 'Account & Subscription',
            onPressed: () {
              // Handle click
            },
          ),
          Divider(color: Colors.white),
          SettingsItem(
            text: 'Notification',
            onPressed: () {
              // Handle click
            },
          ),
          Divider(color: Colors.white),
          SettingsItem(
            text: 'Language',
            onPressed: () {
              // Handle click
            },
          ),
          Divider(color: Colors.white),
          SettingsItem(
            text: 'Downloads',
            onPressed: () {
              // Handle click
            },
          ),
          Divider(color: Colors.white),
          SettingsItem(
            text: 'Accessibility',
            onPressed: () {
              // Handle click
            },
          ),
          Divider(color: Colors.white),
          SettingsItem(
            text: 'Support',
            onPressed: () {
              // Handle click
            },
          ),
          Divider(color: Colors.white),
          SettingsItem(
            text: 'Terms & Conditions',
            onPressed: () {
              // Handle click
            },
          ),
          Divider(color: Colors.white),
          SettingsItem(
            text: 'Privacy Policy',
            onPressed: () {
              // Handle click
            },
          ),
          Divider(color: Colors.white),
          SizedBox(height: 16),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 125),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Logged in as \n ria@gmail.com',
                  style: GoogleFonts.montserrat(
                    fontSize: 16,
                    color: Colors.white.withOpacity(0.5),
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {
                    // Handle logout
                    Get.to(() => const MyLogin());

                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.brown[300], // Background color
                    minimumSize: Size(double.infinity, 48), // Increase width
                  ),
                  child: Text(
                    'Log Out',
                    style: GoogleFonts.montserrat(
                      fontSize: 20, // Adjust the size as needed
                      color: Colors.white,
                      // You can also use GoogleFonts.montserrat().fontFamily
                    ),
                  ),
                ),


              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SettingsItem extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const SettingsItem({
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        text,
        style: GoogleFonts.montserrat(color: Colors.white,fontWeight: FontWeight.bold,),
      ),
      onTap: onPressed,
    );
  }
}

