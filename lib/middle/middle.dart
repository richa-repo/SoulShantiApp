import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../video_player.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            margin: EdgeInsets.only(top: 16.0), // Set top margin
            child: SearchBar(),
          ),
          SizedBox(height: 16.0),
          ExerciseButtons(),
          SizedBox(height: 16.0),
          MeditationButtons(),
          SizedBox(height: 16.0),
          GuidedProgram(),
          SizedBox(height: 16.0),
          AdditionalButtons(),
        ],
      ),
    );
  }
}
class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      color: Colors.brown[900], // Set the background color to brown 900
      child: Material(
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(8.0),
              height:50,
              decoration: BoxDecoration(
                color: Colors.brown[900], // Set the background color of the icon to brown 900
                borderRadius: BorderRadius.circular(0.0),
              ),
              child: Icon(
                Icons.search,
                color: Colors.brown[300], // Set the icon color to brown 300
              ),
            ),
            Expanded(
              child: TextField(
                style: TextStyle(color: Colors.brown[300]), // Set the text color to brown 300
                decoration: InputDecoration(
                  hintText: 'Search Exercise',
                  hintStyle: TextStyle(color: Colors.brown[300]), // Set the hint text color to brown 300
                  filled: true,
                  fillColor: Colors.brown[900], // Set the background color of the input area to brown 900
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}




class ExerciseButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.brown[900],
      padding: EdgeInsets.only(left: 16,top: 10,right: 0.0,bottom: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          RoundedTextBox('Yoga'),
          RoundedTextBox('Yoga'),
          RoundedTextBox('Yoga'),
          RoundedTextBox('Yoga'),
        ],
      ),
    );
  }
}


class MeditationButtons extends StatefulWidget {
  @override
  _MeditationButtonsState createState() => _MeditationButtonsState();
}

class _MeditationButtonsState extends State<MeditationButtons> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10.0, top: 0, right: 10, bottom: 0),
      color: Colors.brown[900], // Set the background color to brown 900
      child: Column(
        children: [
          SizedBox(
            height: 60.0, // Increase the height of each button container
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // Add functionality for 'Meditate' button
                      Get.to(() => VideoPlayer(videoURL:"https://www.youtube.com/watch?v=inpok4MKVLM&ab_channel=Goodful"));
                      print('Meditate button clicked');
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size.fromHeight(60),
                      backgroundColor: Colors.brown[200], // Button color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0), // Reduce rounded corners
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0), // Add vertical padding
                      child: Text(
                        'Meditate',
                        style: TextStyle(color: Colors.white, fontSize: 16.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8.0),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // Add functionality for 'Sleep' button
                      Get.to(() => VideoPlayer(videoURL:"https://www.youtube.com/watch?v=inpok4MKVLM&ab_channel=Goodful"));
                      print('Sleep button clicked');
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size.fromHeight(60),
                      backgroundColor: Colors.brown[300], // Button color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0), // Reduce rounded corners
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0), // Add vertical padding
                      child: Text(
                        'Sleep',
                        style: TextStyle(color: Colors.white, fontSize: 16.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 2.0), // Set the height of the SizedBox to 2.0
          SizedBox(
            height: 100.0, // Increase the height of each button container
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // Add functionality for 'Move' button
                      Get.to(() => VideoPlayer(videoURL:"https://www.youtube.com/watch?v=inpok4MKVLM&ab_channel=Goodful"));
                      print('Move button clicked');
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size.fromHeight(60),
                      backgroundColor: Colors.brown[300], // Button color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0), // Reduce rounded corners
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0), // Add vertical padding
                      child: Text(
                        'Move',
                        style: TextStyle(color: Colors.white, fontSize: 16.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8.0),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // Add functionality for 'Music' button
                      Get.to(() => VideoPlayer(videoURL:"https://www.youtube.com/watch?v=inpok4MKVLM&ab_channel=Goodful"));
                      print('Music button clicked');
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size.fromHeight(60),
                      backgroundColor: Colors.brown[200], // Button color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0), // Reduce rounded corners
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0), // Add vertical padding
                      child: Text(
                        'Music',
                        style: TextStyle(color: Colors.white, fontSize: 16.0),
                      ),
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



class GuidedProgram extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, top: 0.0, right: 10.0, bottom: 0.0), // Adding margin in all directions
      padding: EdgeInsets.only(left: 0.0, top: 20.0, right: 0.0, bottom: 20.0),
      decoration: BoxDecoration(
        color: Colors.brown[500],
        border: Border.all(),
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(10.0),
                      margin: EdgeInsets.only(left: 10.0, bottom: 0.0),                        decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(50.0),

                    ),
                      child: Text('Guided Program', style: TextStyle(fontSize: 16, color: Colors.white)),
                    ),
                    SizedBox(height: 2.0),
                    Container(
                      margin: EdgeInsets.only(left: 25.0), // Adding left margin
                      child: Text(
                        'Managing Stress',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: 15.0),
                    Container(
                      margin: EdgeInsets.only(left: 18.0), // Adding left margin
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.signal_cellular_alt, color: Colors.white), // Cell tower network icon
                              SizedBox(width: 8.0),
                              Text('Beginner Level', style: TextStyle(fontSize: 14, color: Colors.white)),
                            ],
                          ),
                          SizedBox(height: 4.0),
                          Row(
                            children: [
                              Icon(Icons.calendar_today, color: Colors.white), // Calendar icon
                              SizedBox(width: 8.0),
                              Text('4 Week', style: TextStyle(fontSize: 14, color: Colors.white)),
                            ],
                          ),
                          SizedBox(height: 4.0),
                          Row(
                            children: [
                              Icon(Icons.shopping_bag, color: Colors.white), // Bag icon
                              SizedBox(width: 8.0),
                              Text('Lec By Richa', style: TextStyle(fontSize: 14, color: Colors.white)),
                            ],
                          ),

                        ],
                      ),
                    ),

                  ],
                ),
              ),
              SizedBox(width: 16.0),
              Expanded(
                child: Container(
                  child: ClipRRect(
                    child: Image.asset(
                      'assets/images/rubber.png', // Replace 'your-image.jpg' with your asset image
                      fit: BoxFit.cover, // Adjust the fit as needed
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}



class AdditionalButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double buttonWidth = 350.0; // Adjust the width as needed
    double h = 50;

    return Column(
      children: [
        Container(
          height: h,
          width: buttonWidth,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Text('PODCAST', style: TextStyle(fontSize: 14, color: Colors.white)),
                ),
              ),
              Image.asset('assets/images/rubber.png'), // Replace with your podcast image asset
            ],
          ),
          decoration: BoxDecoration(
            color: Colors.brown[300],
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        SizedBox(height: 15.0),
        Container(
          height: h,
          width: buttonWidth,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Text('NATIONAL PARK COLLECTION', style: TextStyle(fontSize: 14, color: Colors.black)),
                ),
              ),
              Image.asset('assets/images/rubber.png'), // Replace with your national park image asset
            ],
          ),
          decoration: BoxDecoration(
            color: Colors.pink[200],
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        SizedBox(height: 15.0),
        Container(
          height: h,
          width: buttonWidth,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Text('How to do More of What Matters to You', style: TextStyle(fontSize: 14, color: Colors.black)),
                ),
              ),
              Image.asset('assets/images/rubber.png'), // Replace with your how-to image asset
            ],
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ],
    );
  }
}


class RoundedTextBox extends StatefulWidget {
  final String text;

  RoundedTextBox(this.text);

  @override
  _RoundedTextBoxState createState() => _RoundedTextBoxState();
}

class _RoundedTextBoxState extends State<RoundedTextBox> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
          // Delay the color change to original after 300 milliseconds
          Future.delayed(Duration(milliseconds: 300), () {
            setState(() {
              isSelected = false;
            });
          });
        });
      },
      child: Container(
        padding: EdgeInsets.all(12.0),
        width: 90.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: isSelected ? Colors.white : Colors.brown[500], // Toggle background color
        ),
        child: Center(
          child: Text(
            widget.text,
            style: TextStyle(
              fontSize: 14,
              color: isSelected ? Colors.brown[900] : Colors.white, // Toggle text color
            ),
          ),
        ),
      ),
    );
  }
}
