import 'package:flutter/material.dart';

import 'forgotpassword.dart';
import 'homepage.dart';
import 'login as utp.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isLoginSelected = true; // Track which tab is selected

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFC4BAD4), // Background color (light purple)
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              // Back Button
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginSignUpScreen()),
                    );
                    // Handle back button press
                  },
                ),
              ),
              SizedBox(height: 50),
              // Welcome Text
              Text(
                'WELCOME',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),

              // Main card containing the login form
              Expanded(
                child: Center(
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Tabs (Log In and Sign Up)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isLoginSelected = true;
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 25, vertical: 10),
                                decoration: BoxDecoration(
                                  color: isLoginSelected
                                      ? Color(0xFF8C62F4)
                                      : Colors.grey[200],
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  'Log In',
                                  style: TextStyle(
                                    color: isLoginSelected
                                        ? Colors.white
                                        : Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isLoginSelected = false;
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 25, vertical: 10),
                                decoration: BoxDecoration(
                                  color: isLoginSelected
                                      ? Colors.grey[200]
                                      : Color(0xFF8C62F4),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  'Sign Up', // Corrected "Sing Up" to "Sign Up"
                                  style: TextStyle(
                                    color: isLoginSelected
                                        ? Colors.grey
                                        : Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        // Text fields for mobile number and password
                        TextField(
                          decoration: InputDecoration(
                            labelText: 'Enter Mobile no.',
                            border: UnderlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: 20),
                        TextField(
                          decoration: InputDecoration(
                            labelText: 'Password',
                            border: UnderlineInputBorder(),
                          ),
                          obscureText: true,
                        ),
                        SizedBox(height: 10),
                        if (isLoginSelected)
                          Align(
                            alignment: Alignment.centerRight,
                            child: GestureDetector(
                              onTap: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ForgotPasswordScreen()),
                                );
                              },
                              child: Text(
                                'Forget Password?',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                          ),
                        SizedBox(height: 30),
                        // Log In or Sign Up button
                        GestureDetector(
                          onTap: () {
                            if (isLoginSelected) {
                              // Handle Log In action
                              print('Log In button pressed');
                            } else {
                              // Handle Sign Up action
                              print('Sign Up button pressed');
                            }
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => HomePage()),
                            );
                          },
                          child: Container(
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(vertical: 15),
                            decoration: BoxDecoration(
                              color: Color(0xFF8C62F4),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: Text(
                                isLoginSelected ? 'Log In' : 'Sign Up',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}