import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



import 'package:velocity_x/velocity_x.dart';
import 'package:velocity_x/velocity_x.dart';
import 'dart:io';

import '../Today/today.dart';
import '../home/home.dart';
import '../middle/middle.dart';



class navigation extends StatefulWidget {
  const navigation({super.key});

  @override
  State<navigation> createState() => _homeState();
}

class _homeState extends State<navigation> {
  int index=0;
  final screens=[
    TodayPage(),
    LandingPage(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    final items= [
      Icon(Icons.fireplace_rounded, color: Colors.white,size: 45),
      Icon(Icons.home, color: Colors.white,size: 45),
      Icon(Icons.supervised_user_circle_outlined, color: Colors.white,size: 45),
    ];
    return Scaffold(
      backgroundColor: Color(0xFF3E2723),
      body: screens[index],
      bottomNavigationBar: CurvedNavigationBar(
        color: Color(0xFFD88E8F), // Set the color to #d88e8f
        backgroundColor: Color(0xFF3E2723),
        animationDuration: Duration(milliseconds: 400),
        items: items,
        index: index,
        onTap: (index) =>
            setState(() {
              this.index = index;
            }),
      ),
    );



  }
}