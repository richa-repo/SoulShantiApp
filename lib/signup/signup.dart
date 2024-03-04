
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../login/login.dart';


class MyRegister extends StatefulWidget {
  const MyRegister({Key? key}) : super(key: key);

  @override
  _MyRegisterState createState() => _MyRegisterState();
}

class _MyRegisterState extends State<MyRegister> {

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController cPasswordController = TextEditingController();

  void createAccount() async {
    String name = nameController.text.trim();
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String cPassword = cPasswordController.text.trim();

    if(name == ""|| email == "" || password == "" || cPassword == "") {
      log("Please fill all the details!");
    }
    else if(password != cPassword) {
      log("Passwords do not match!");
    }
    else{
      try {
        UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
        if(userCredential.user != null) {
          Navigator.pop(context);
        }
      } on FirebaseAuthException catch(ex) {
        log(ex.code.toString());
      }
    }

    if (name != "" && email != ""){
      Map<String, dynamic> userData = {
        "name": name,
        "email" : email,
        "password": password
      };
      FirebaseFirestore.instance.collection("users").add(userData);
      log("User Created!");
    }

  }


  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/soul3.png'), fit: BoxFit.cover),
        ),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            body: Stack(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 35, top: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hello There!',
                        style: GoogleFonts.montserrat(color: Colors.white, fontSize: 45, fontWeight: FontWeight.w800),
                      ),
                      SizedBox(height: 30), // Add some space between the main heading and subheading
                      Text(
                        'Create your account',
                        style: GoogleFonts.montserrat(color: Colors.brown[300], fontSize: 20),
                      ),
                    ],
                  ),
                ),

                SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.28),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 35, right: 35),
                          child: Column(
                            children: [
                              TextField(
                                controller: nameController,
                                style: GoogleFonts.montserrat(color: Colors.white),
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.brown[700],
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(color: Colors.black87),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                  hintText: "Name",
                                  hintStyle: GoogleFonts.montserrat(color: Colors.white,fontWeight: FontWeight.bold),
                                  prefixIcon: Icon(Icons.person, color: Colors.white), // Profile icon
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),

                              SizedBox(
                                height: 30,
                              ),
                              TextField(
                                controller: emailController,
                                style: GoogleFonts.montserrat(color: Colors.white),
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.brown[200],
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(color: Colors.black87),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                  hintText: "Email",
                                  hintStyle: GoogleFonts.montserrat(color: Colors.black,fontWeight: FontWeight.bold,),
                                  prefixIcon: Icon(Icons.email, color: Colors.black), // Email icon
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              TextField(
                                controller: passwordController,
                                style: GoogleFonts.montserrat(color: Colors.white),
                                obscureText: true,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.brown[700],
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(color: Colors.black87),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                  hintText: "Password",
                                  hintStyle: GoogleFonts.montserrat(color: Colors.white,fontWeight: FontWeight.bold,),
                                  prefixIcon: Icon(Icons.lock, color: Colors.white), // Lock icon
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              TextField(
                                controller: cPasswordController,
                                style: GoogleFonts.montserrat(color: Colors.white,fontWeight: FontWeight.bold,),
                                obscureText: true,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.brown[200],
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(color: Colors.black87),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(color: Colors.white30),
                                  ),
                                  hintText: "Confirm Password",
                                  hintStyle: GoogleFonts.montserrat(color: Colors.black,fontWeight: FontWeight.bold,),
                                  prefixIcon: Icon(Icons.lock, color: Colors.black), // Lock icon
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              Container(
                                width: 250,
                                child: ElevatedButton(
                                  onPressed: () {
                                    // Add your Sign Up logic here
                                    createAccount();
                                    Get.to(() => const MyLogin());

                                  },
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: Colors.white, backgroundColor: Colors.transparent, // Text color
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30), // Adjust the radius as needed
                                      side: BorderSide(color: Colors.white, width: 1.0), // White border
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        'Sign Up',
                                        style: GoogleFonts.montserrat(fontSize: 25, fontWeight: FontWeight.w700, color: Colors.white), // White text color
                                      ),
                                      SizedBox(width: 10), // Add some space between text and arrow
                                      Icon(Icons.arrow_forward, color: Colors.white),
                                    ],
                                  ),
                                ),
                              ),

                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                alignment: Alignment.center,
                                child: SizedBox(
                                  width: 150, // Adjust the width as needed
                                  child: ElevatedButton(
                                    onPressed: () {
                                      //createAccount();
                                      Get.to(() => const MyLogin());

                                    },
                                    style: ElevatedButton.styleFrom(
                                      foregroundColor: Colors.white, backgroundColor: Colors.transparent, // Text color
                                    ),
                                    child: Text(
                                      'Login',
                                      style: TextStyle(fontSize: 18, decoration: TextDecoration.underline),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            ),
        );
    }
}
