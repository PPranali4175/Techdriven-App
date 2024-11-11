import 'package:flutter/material.dart';

import 'casetimeline.dart';
import 'homepage.dart';


class TrackCaseStatusScreen extends StatefulWidget {
  @override
  _TrackCaseStatusScreenState createState() => _TrackCaseStatusScreenState();
}

class _TrackCaseStatusScreenState extends State<TrackCaseStatusScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController caseNumberController = TextEditingController();
  final TextEditingController yearController = TextEditingController();
  final TextEditingController captchaController = TextEditingController();

  String captchaText = "AB123"; // Placeholder captcha text

  // Function to generate or reload a new captcha (placeholder function)
  void _reloadCaptcha() {
    setState(() {
      captchaText = "ZX456"; // Generate a new captcha
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEDEAF1),
      appBar: AppBar(
        backgroundColor: Color(0xFF5EC675),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          },
        ),
        title: Text('Track Case Status'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 10),
                Center(
                  child: Text(
                    'Check Your Case Status',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF5EC675),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                // Select State Dropdown
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: 'Select State',
                    border: OutlineInputBorder(),
                  ),
                  items: <String>['State 1', 'State 2', 'State 3']
                      .map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {},
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select your state';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 15),

                // Select District Dropdown
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: 'Select District',
                    border: OutlineInputBorder(),
                  ),
                  items: <String>['District 1', 'District 2', 'District 3']
                      .map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {},
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select your district';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 15),

                // Select Court Complex Dropdown
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: 'Select Court Complex',
                    border: OutlineInputBorder(),
                  ),
                  items: <String>['Complex 1', 'Complex 2', 'Complex 3']
                      .map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {},
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select your court complex';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 15),

                // Case Number
                TextFormField(
                  controller: caseNumberController,
                  decoration: InputDecoration(
                    labelText: 'Case Number',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the case number';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 15),

                // Year
                TextFormField(
                  controller: yearController,
                  decoration: InputDecoration(
                    labelText: 'Year',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the year';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 15),

                // Captcha Display and Reload Button
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        captchaText,
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.refresh, color: Color(0xFF7E5DA9)),
                      onPressed: _reloadCaptcha,
                      tooltip: 'Reload Captcha',
                    ),
                  ],
                ),
                SizedBox(height: 15),

                // Enter Captcha Field
                TextFormField(
                  controller: captchaController,
                  decoration: InputDecoration(
                    labelText: 'Enter Captcha',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the captcha';
                    }
                    if (value != captchaText) {
                      return 'Captcha does not match';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),

                // Reset and Submit Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Clear form fields
                        caseNumberController.clear();
                        yearController.clear();
                        captchaController.clear();
                        setState(() {
                          _formKey.currentState?.reset();
                          captchaText = "AB123"; // Reset captcha to initial state
                        });
                      },
                      child: Text('Reset',style: TextStyle(color: Colors.white)),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.grey,
                        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // Handle form submission
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => CaseStatusScreen()),
                          );
                        }
                      },
                      child: Text('Submit',style: TextStyle(color: Colors.white)),
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFF5EC675),
                        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
