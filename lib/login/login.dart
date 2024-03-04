import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:navigation/navigator/navigation.dart';

import '../Today/today.dart';
import '../home/home.dart';
import '../signup/signup.dart';


class MyLogin extends StatefulWidget {
  const MyLogin({Key? key}) : super(key: key);

  @override
  _MyLoginState createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void login() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if(email == "" || password == "") {
      log("Please fill all the fields!");
    }
    else {

      try {
        UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
        if(userCredential.user != null) {

          Navigator.popUntil(context, (route) => route.isFirst);
          Navigator.pushReplacement(context, CupertinoPageRoute(
              builder: (context) => navigation()
          ));

        }
      } on FirebaseAuthException catch(ex) {
        log(ex.code.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/soul3.png'), // Use 'soul.jpg' as the background image
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(),
            Container(
              padding: EdgeInsets.only(left: 15, top: 130),
              alignment: Alignment.center, // Center align the text
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Welcome Back!',
                    style: GoogleFonts.montserrat(color: Colors.white, fontSize: 45, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 30), // Add some space between the main heading and subheading
                  Text(
                    'Enter your username & password here',
                    style: GoogleFonts.montserrat(color: Colors.brown[300], fontSize: 18),
                  ),
                ],
              ),
            ),

            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.5,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(

                      margin: EdgeInsets.only(left: 35, right: 35),
                      child: Column(
                        children: [
                          TextField(
                            controller: emailController,
                            style: GoogleFonts.montserrat(color: Colors.black, fontWeight: FontWeight.bold),
                            decoration: InputDecoration(
                              fillColor: Colors.brown[500], // Change background color to brown 300
                              filled: true,
                              hintText: "Email",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              prefixIcon: Padding(
                                padding: const EdgeInsets.only(left: 10), // Add margin to the left of the icon
                                child: Icon(Icons.email, color: Colors.black), // Email icon
                              ),

                            ),

                          ),

                          SizedBox(
                            height: 30,
                          ),
                          TextField(
                            controller: passwordController,
                            style: GoogleFonts.montserrat(color: Colors.black, fontWeight: FontWeight.bold),                            obscureText: true,
                            decoration: InputDecoration(
                              fillColor: Colors.brown[500],                              filled: true,
                              hintText: "Password",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              prefixIcon: Padding(
                                padding: const EdgeInsets.only(left: 10), // Add margin to the left of the icon
                                child: Icon(Icons.password, color: Colors.black), // Email icon
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end, // Align to the right side of the screen
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  // Add your login logic here
                                  login();
                                  //Get.to(() => const navigation());
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.brown[100], // Button color
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10), // Adjust the radius as needed
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      'Login',
                                      style: GoogleFonts.montserrat(fontSize: 18, color: Colors.black87, fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(width: 10), // Add some space between text and arrow
                                    Icon(Icons.arrow_forward, color: Colors.black87),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 8,
                          ),
                              Divider(
                                color: Colors.white,
                                thickness: 1,
                                height: 20, // Adjust the height of the divider as needed
                              ),
                          ElevatedButton.icon(
                            onPressed: () {
                              // Handle sign-in using Google
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.brown[900], // Button color
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10), // Adjust the radius as needed
                              ),
                            ),
                            icon: Image.asset('assets/images/google.png', height: 24), // Add Google logo
                            label: Text(
                              'Sign in with Google',
                              style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, 'register');
                                },
                                child: GestureDetector(
                                  onTap: () {
                                    Get.to(() => MyRegister());
                                  },
                                  child: Text(
                                    'Sign Up',
                                    textAlign: TextAlign.left,
                                    style: GoogleFonts.montserrat(
                                      decoration: TextDecoration.underline,
                                      color: Colors.brown[300],
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                style: ButtonStyle(),
                              ),
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  'Forgot Password',
                                  style: GoogleFonts.montserrat(
                                    decoration: TextDecoration.underline,
                                    color: Colors.brown[300],
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
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
