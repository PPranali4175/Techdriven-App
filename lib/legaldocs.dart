import 'package:flutter/material.dart';
import 'package:majorproject/sampleletter.dart';

import 'homepage.dart';
import 'instructionmanual.dart';


class ResourceModuleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
            // Add navigation logic here
          },
        ),
        title: Text('Resource Module',style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PDFScreen()),
                );
              },
              child: ListTile(
                leading: Image.asset('assets/Images/image 14.png'),
                title: Text(
                  'Instruction Manual',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SampleLetterPage()),
                );
              },
              child: ListTile(
                leading: Image.asset('assets/Images/2606507_5846 1.png'),
                title: Text('Sample letter',style: TextStyle(fontWeight: FontWeight.bold),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
