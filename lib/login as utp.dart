import 'package:flutter/material.dart';

import 'loginandsignup2.dart';



class LoginSignUpScreen extends StatefulWidget {
  @override
  _LoginSignUpScreenState createState() => _LoginSignUpScreenState();
}

class _LoginSignUpScreenState extends State<LoginSignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFC4BAD4), // Light purple background
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'LOG IN/ SIGN UP AS',
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 40), // Add some spacing
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Lawyer button

                // Space between buttons
                // UTP button
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        // Action for the UTP button
                        print("UTP button tapped");
                        // You can add navigation or other logic here
                      },
                      child: CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.white,
                        child: ClipOval(
                          child: Image.asset(
                            'assets/Images/Prisoner icon.png', // Your UTP image path
                            fit: BoxFit.cover,
                            width: 100,
                            height: 100,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginScreen()),
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                        decoration: BoxDecoration(
                          color: Color(0xFF8C62F4), // Button color (purple)
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          'UTP',
                          style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
