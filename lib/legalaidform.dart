import 'package:flutter/material.dart';

import 'homepage.dart';
import 'package:image_picker/image_picker.dart';

class LegalAidForm extends StatefulWidget {
  @override
  _LegalAidFormState createState() => _LegalAidFormState();
}

class _LegalAidFormState extends State<LegalAidForm> {
  final _formKey = GlobalKey<FormState>();
  bool acceptTerms1 = false; // For the first checkbox
  bool acceptTerms2 = false;

  // Boolean to track visibility of the Personal Details subform
  bool _isPersonalDetailsVisible = false;

  // Boolean to track visibility of the Legal Aid / Grievance Details subform
  bool _isGrievanceDetailsVisible = false;

  // Boolean to track visibility of the Case Details subform
  bool _isCaseDetailsVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEDEAF1),
      appBar: AppBar(
        backgroundColor: Color(0xFF7E5DA9),
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
        title: Text('Apply For Legal Aid'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Rounded Top Container
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  SizedBox(height: 10),
                  Center(
                    child: Text(
                      'New Application',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF7E5DA9),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),

                  // Application For
                  _buildDropdownField('Nature of legal Aid'),
                  SizedBox(height: 15),

                  // Received Through
                  _buildDropdownField('Received Through'),
                  SizedBox(height: 15),

                  // State
                  _buildDropdownField('State'),
                  SizedBox(height: 15),

                  // District
                  _buildDropdownField('District'),
                  SizedBox(height: 15),

                  // Taluka
                  _buildDropdownField('Taluka'),
                  SizedBox(height: 15),

                  // Nature of Legal Aid / Grievance
                  _buildDropdownField('Nature of Legal Aid / Grievance'),
                  SizedBox(height: 15),

                  // Summary Text Field
                  TextFormField(
                    maxLines: 4,
                    decoration: InputDecoration(
                      labelText: 'Summary of problem for which legal aid is sought',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 15),
                ],
              ),
            ),

            SizedBox(height: 15),

            // Personal Details with + Icon or - Icon
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Personal Details',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    icon: Icon(_isPersonalDetailsVisible ? Icons.remove : Icons.add),
                    onPressed: () {
                      setState(() {
                        // Toggle visibility of the subform and change the icon
                        _isPersonalDetailsVisible = !_isPersonalDetailsVisible;
                      });
                    },
                  ),
                ],
              ),
            ),

            // Show Personal Detail Subform if visible
            if (_isPersonalDetailsVisible) _buildPersonalDetailForm(),

            SizedBox(height: 15),

            // Legal Aid / Grievance Details with + Icon or - Icon
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Legal Aid / Grievance Details',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    icon: Icon(_isGrievanceDetailsVisible ? Icons.remove : Icons.add),
                    onPressed: () {
                      setState(() {
                        // Toggle visibility of the subform and change the icon
                        _isGrievanceDetailsVisible = !_isGrievanceDetailsVisible;
                      });
                    },
                  ),
                ],
              ),
            ),

            // Show Legal Aid / Grievance Detail Subform if visible
            if (_isGrievanceDetailsVisible) _buildGrievanceDetailForm(),

            SizedBox(height: 15),

            // Case Details with + Icon or - Icon
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Case Details',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    icon: Icon(_isCaseDetailsVisible ? Icons.remove : Icons.add),
                    onPressed: () {
                      setState(() {
                        // Toggle visibility of the subform and change the icon
                        _isCaseDetailsVisible = !_isCaseDetailsVisible;
                      });
                    },
                  ),
                ],
              ),
            ),

            // Show Case Detail Subform if visible
            if (_isCaseDetailsVisible) _buildCaseDetailForm(),

            // Upload Certificate Button
            ElevatedButton.icon(
              onPressed: () async {
                final picker = ImagePicker();
                final pickedFile = await picker.pickImage(source: ImageSource.gallery);

                if (pickedFile != null) {
                  // Handle the picked file here (e.g., display the image, save the path, etc.)
                  print("Picked file path: ${pickedFile.path}");
                } else {
                  print("No file selected");
                }
              },
              icon: Icon(Icons.upload_file, color: Colors.white),
              label: Text(
                'Upload Certificate',
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF7E5DA9),
                padding: EdgeInsets.symmetric(vertical: 15),
              ),
            ),

            SizedBox(height: 15),

            // Terms and Conditions Checkboxes
            Row(
              children: [
                Checkbox(
                  value: acceptTerms1, // Use the first checkbox variable
                  onChanged: (bool? value) {
                    setState(() {
                      acceptTerms1 = value ?? false;
                    });
                  },
                ),
                Expanded(
                  child: Text(
                    'I hereby declare that the information provided by me is true and correct to the best of my knowledge.',
                  ),
                ),
              ],
            ),

            Row(
              children: [
                Checkbox(
                  value: acceptTerms2, // Use the second checkbox variable
                  onChanged: (bool? value) {
                    setState(() {
                      acceptTerms2 = value ?? false;
                    });
                  },
                ),
                Expanded(
                  child: Text(
                    'I hereby accept the terms and conditions applicable to the Legal Aid process.',
                  ),
                ),
              ],
            ),

            // Submit Button
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Handle form submission
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  }
                },
                child: Text('Submit',style: TextStyle(color: Colors.white),),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF7E5DA9),
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDropdownField(String label) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
      ),
      items: <String>['Option 1', 'Option 2', 'Option 3']
          .map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (String? newValue) {},
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please select an option';
        }
        return null;
      },
    );
  }


  Widget _buildPersonalDetailForm() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Applicant Name',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 15),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Father\'s/Husband\'s Name',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 15),
          // Gender Dropdown
          DropdownButtonFormField<String>(
            decoration: InputDecoration(
              labelText: 'Gender',
              border: OutlineInputBorder(),
            ),
            items: <String>['Male', 'Female', 'Other']
                .map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? newValue) {},
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please select your gender';
              }
              return null;
            },
          ),
          SizedBox(height: 15),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Mobile Number',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.phone,
          ),
          SizedBox(height: 15),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Email ID',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.emailAddress,
          ),
          SizedBox(height: 15),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Religion',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 15),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Caste',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 15),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Caste Certificate No.',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 15),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Occupation',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 15),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Employment Details',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 15),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Annual Income',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
          ),
          SizedBox(height: 15),
          // Eligibility Dropdown
          _buildDropdownField('Eligibility'),
          SizedBox(height: 15),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Current Address',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 15),
          // State Dropdown
          _buildDropdownField('State'),
          SizedBox(height: 15),
          // District Dropdown
          _buildDropdownField('District'),
          SizedBox(height: 15),
          // Taluka Dropdown
          _buildDropdownField('Taluka'),
        ],
      ),
    );
  }

  Widget _buildGrievanceDetailForm() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Whether any application has been filled previously
          DropdownButtonFormField<String>(
            decoration: InputDecoration(
              labelText: 'Has any application been filled previously?',
              border: OutlineInputBorder(),
            ),
            items: <String>['Yes', 'No']
                .map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? newValue) {},
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please select an option';
              }
              return null;
            },
          ),
          SizedBox(height: 15),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Application No.',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 15),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Action Taken',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 15),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Name of Opposite Party',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 15),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Mobile Number',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.phone,
          ),
          SizedBox(height: 15),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Email ID',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.emailAddress,
          ),
          SizedBox(height: 15),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Current Address',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 15),
          // State Dropdown
          _buildDropdownField('State'),
          SizedBox(height: 15),
          // District Dropdown
          _buildDropdownField('District'),
          SizedBox(height: 15),
          // Taluka Dropdown
          _buildDropdownField('Taluka'),
        ],
      ),
    );
  }

  Widget _buildCaseDetailForm() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Whether any case has been filled previously
          DropdownButtonFormField<String>(
            decoration: InputDecoration(
              labelText: 'Has any case been filled previously?',
              border: OutlineInputBorder(),
            ),
            items: <String>['Yes', 'No']
                .map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? newValue) {},
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please select an option';
              }
              return null;
            },
          ),
          SizedBox(height: 15),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Case Type',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 15),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Case No.',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 15),
          // Court Type Dropdown
          _buildDropdownField('Court Type'),
          SizedBox(height: 15),
          // State Dropdown
          _buildDropdownField('State'),
          SizedBox(height: 15),
          // District Dropdown
          _buildDropdownField('District'),
          SizedBox(height: 15),
          // Taluka Dropdown
          _buildDropdownField('Taluka'),
        ],
      ),
    );
  }
}
