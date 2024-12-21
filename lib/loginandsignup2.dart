import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'homepage.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isLoginSelected = true; // Track which tab is selected
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Signup Function
  Future<void> signUp(String mobile, String password) async {
    try {
      // Check if the mobile number already exists
      final existingUser = await _firestore
          .collection('users')
          .where('mobile', isEqualTo: mobile)
          .get();

      if (existingUser.docs.isNotEmpty) {
        throw 'Mobile number already exists. Please log in.';
      }

      // Add new user to Firestore
      await _firestore.collection('users').add({
        'mobile': mobile,
        'password': password, // Store plaintext for testing, hash in production
        'createdAt': Timestamp.now(),
      });

      print("User Signed Up Successfully");
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Sign Up Successful")));
      Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
    } catch (e) {
      print("Error during Sign Up: $e");
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Signup Failed: $e")));
    }
  }

  // Login Function
  Future<void> login(String mobile, String password) async {
    try {
      // Query Firestore for a matching user
      final user = await _firestore
          .collection('users')
          .where('mobile', isEqualTo: mobile)
          .where('password', isEqualTo: password)
          .get();

      if (user.docs.isEmpty) {
        throw 'Invalid mobile number or password.';
      }

      print("User Logged In Successfully");
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Login Successful")));
      Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
    } catch (e) {
      print("Error during Login: $e");
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Login Failed: $e")));
    }
  }

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
                    Navigator.pop(context); // Handle back button press
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
                                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
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
                                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                                decoration: BoxDecoration(
                                  color: isLoginSelected
                                      ? Colors.grey[200]
                                      : Color(0xFF8C62F4),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  'Sign Up',
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
                          controller: mobileController,
                          decoration: InputDecoration(
                            labelText: 'Enter Mobile no.',
                            border: UnderlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: 20),
                        TextField(
                          controller: passwordController,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            border: UnderlineInputBorder(),
                          ),
                          obscureText: true,
                        ),
                        SizedBox(height: 30),
                        // Log In or Sign Up button
                        GestureDetector(
                          onTap: () {
                            final mobile = mobileController.text.trim();
                            final password = passwordController.text.trim();

                            if (mobile.isEmpty || password.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text("Please fill all fields")));
                              return;
                            }

                            if (isLoginSelected) {
                              login(mobile, password);
                            } else {
                              signUp(mobile, password);
                            }
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
