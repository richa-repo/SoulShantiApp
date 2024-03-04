import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../login/login.dart';
import '../setting/setting.dart';
import '../video_player.dart';

class TodayPage extends StatefulWidget {
  @override
  _TodayPageState createState() => _TodayPageState();
}

class _TodayPageState extends State<TodayPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  String _userName = '';



  @override
  void initState() {
    super.initState();
    _loadUserName();
  }

  Future<void> _loadUserName() async {
    User? user = _auth.currentUser;

    if (user != null) {
      DocumentSnapshot userDoc =
      await _firestore.collection('users').doc(user.uid).get();

      if (userDoc.exists) {
        setState(() {
          _userName = userDoc['name'];
        });
      }
    }
  }


  void addCollection() async{

    Map<String, dynamic> newUserData = {
      "name": "Sally",
      "email": "sally@ok.com",
      "password": "sally123"
    };

    await _firestore.collection("users").doc("3h7OxoMJNJkc3ZOjew2c ").update({
      "last watched": "yoga video"
    });

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.brown[500],
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            // Handle back button press
            Get.to(() => MyLogin());
          },
        ),
        title: Text(
          'Today',
          style: GoogleFonts.montserrat(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite, size: 30.0, color: Colors.white),
            onPressed: () {
              // Add your like functionality here

            },
          ),
          IconButton(
            icon: Icon(Icons.exit_to_app, size: 30.0, color: Colors.white),
            onPressed: () {
              // Add your reset functionality here
            },
          ),
          IconButton(
            icon: Icon(Icons.settings, size: 40.0, color: Colors.white),
            onPressed: () {
              // Add functionality for the settings button
              Get.to(() => SettingsPage());
            },
          ),
        ],
        elevation: 5,
      ),
      body: Container(
        color: Colors.brown[900], // Set the background color for the body
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Good Evening, $_userName',
              style: GoogleFonts.montserrat(
                color: Colors.white, // Set text color to white
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Start your day',
              style: GoogleFonts.montserrat(
                fontSize: 16.0,
                color: Colors.white, // Set text color to white
              ),
            ),
            SizedBox(height: 16.0),
            GestureDetector(
              onTap: () {
                // Navigate to the video page
                Get.to(() => VideoPlayer(videoURL:"https://www.youtube.com/watch?v=inpok4MKVLM&ab_channel=Goodful"));
              },
              child: CardWidget(
                title: 'Meditate for 5 Minutes',
                subTitle: '1 min',
                assetImagePath: 'assets/images/rubber.png',
              ),
            ),
            SizedBox(height: 16.0),
            GestureDetector(
              onTap: () {
                // Navigate to the video page
                addCollection();
                Get.to(() => VideoPlayer(videoURL:"https://www.youtube.com/watch?v=149Iac5fmoE&ab_channel=SCImplify"));
              },
              child: CardWidget(
                title: 'Do Simple Yoga Asanas',
                subTitle: '10 mins',
                assetImagePath: 'assets/images/rubber.png',
              ),
            ),
            SizedBox(height: 16.0),
            GestureDetector(
              onTap: () {
                // Navigate to the video page
                Get.to(() => VideoPlayer(videoURL:"https://www.youtube.com/watch?v=zCaq6hbDlQw&ab_channel=TheYogaInstitute"));
              },
              child: CardWidget(
                title: 'Take 5 Cleansing Breaths',
                subTitle: '3 mins',
                assetImagePath: 'assets/images/rubber.png',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CardWidget extends StatelessWidget {
  final String title;
  final String subTitle;
  final String assetImagePath;

  CardWidget(
      {required this.title, required this.subTitle, required this.assetImagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160.0, // Adjust the height as needed
      child: Card(
        elevation: 3.0,
        color: Colors.brown[200], // Set the background color of the card
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
          side: BorderSide(color: Colors.white, width: 1.0), // White border
        ),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.montserrat(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white, // Set text color to white
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      subTitle,
                      style: GoogleFonts.montserrat(
                        fontSize: 16.0,
                        color: Colors.white, // Set text color to white
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 16.0),
              Expanded(
                flex: 1,
                child: Image.asset(
                  assetImagePath,
                  height: 80.0,
                  width: 80.0,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class VideoPage extends StatelessWidget {
  final String videoUrl;

  VideoPage({required this.videoUrl});

  @override
  Widget build(BuildContext context) {
    // Implement your video playback logic here using the provided videoUrl
    // You can use video player packages like chewie, video_player, etc.
    return Scaffold(
      appBar: AppBar(
        title: Text('Video Page'),
      ),
      body: Center(
        child: Text('Video will be played here\nURL: $videoUrl'),
      ),
    );
  }
}
