import 'package:flutter/material.dart';
import 'package:majorproject/trackcasestatus.dart';

import 'homepage.dart';

class CaseStatusScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Case Status', style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TrackCaseStatusScreen()),
            );
          },
        ),
        actions: [
          IconButton(icon: Icon(Icons.print, color: Colors.black), onPressed: () {}),
          IconButton(icon: Icon(Icons.filter_alt, color: Colors.black), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTimelineStep("Legal Aid Applied", "15:30 September 23, 2023", true),
            _buildTimelineStep("Legal Aid Form Submitted", "15:30 September 23, 2023", true),
            _buildTimelineStep("Lawyer Allocated", "", false),
            SizedBox(height: 16),
            _buildSection("Case Details", [
              _buildRow("Case Details", "Other Suit"),
              _buildRow("Filing No.", "40/2023"),
              _buildRow("Filing Date", "12-04-23"),
              _buildRow("Registration No.", "17/2023"),
              _buildRow("Registration Date", "12-4-2023"),
            ]),
            SizedBox(height: 16),
            _buildSection("Case Status", [
              _buildRow("First Hearing Date", "12th April 2023"),
              _buildRow("Next Hearing Date", "09 November 2023"),
              _buildRow("Stage of Case", "Steps"),
              _buildRow("Court No. & Judge", "6 - Civil Judge Jr Div 1"),
            ]),
            SizedBox(height: 16),
            _buildSection("Petitioner and Advocate", [
              _buildRow("Petitioner", "Dhinendra Nath Rana"),
              _buildRow("Advocate", "Adv. P.K. Bala"),
            ]),
            SizedBox(height: 16),
            _buildSection("Respondent and Advocate", [
              _buildBulletRow("1. The Registrar"),
              _buildBulletRow("2. The Sub Registrar"),
              _buildBulletRow("3. Shefali Baroi"),
            ]),
            SizedBox(height: 16),
            _buildSection("Acts", [
              _buildRow("Under Act(s)", "Code of Civil Procedure"),
              _buildRow("Under Section", "NIL"),
            ]),
          ],
        ),
      ),
    );
  }

  Widget _buildTimelineStep(String title, String subtitle, bool completed) {
    return Row(
      children: [
        Column(
          children: [
            Icon(
              completed ? Icons.check_circle : Icons.radio_button_unchecked,
              color: completed ? Colors.green : Colors.grey,
            ),
            Container(
              width: 2,
              height: 30,
              color: Colors.grey,
            ),
          ],
        ),
        SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green)),
            if (subtitle.isNotEmpty)
              Text(subtitle, style: TextStyle(color: Colors.grey)),
          ],
        ),
      ],
    );
  }

  Widget _buildSection(String title, List<Widget> children) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.green),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green)),
          SizedBox(height: 8),
          ...children,
        ],
      ),
    );
  }

  Widget _buildRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(fontWeight: FontWeight.w500)),
          Text(value, style: TextStyle(color: Colors.black54)),
        ],
      ),
    );
  }

  Widget _buildBulletRow(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('•', style: TextStyle(color: Colors.black54)),
          SizedBox(width: 4),
          Expanded(child: Text(text, style: TextStyle(color: Colors.black54))),
        ],
      ),
    );
  }
}
