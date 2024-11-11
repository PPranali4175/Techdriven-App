import 'package:flutter/material.dart';
import 'package:majorproject/rehabilitationform.dart';
import 'package:majorproject/trackcasestatus.dart';

import 'casetimeline.dart';
import 'chart.dart';
import 'legalaidform.dart';
import 'legaldocs.dart';
import 'notification.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu, color: Colors.black),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        title: Row(
          children: [
            Text(
              "Legit ",
              style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold),
            ),
            Text(
              "Law ",
              style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
            ),
            Text(
              "Service",
              style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_none, color: Colors.black),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotificationPage()),
              );
            },
          ),
          CircleAvatar(
            backgroundColor: Colors.yellow,
            child: Text("R"),
          ),
          SizedBox(width: 10),
        ],
      ),
      drawer: _buildDrawer(context), // Added navigation drawer
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          // Top Section - Get Legal Info and Chat Bot
          GestureDetector(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ResourceModuleScreen()),
              );
            },
            child: Card(
              elevation: 3,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              child: ListTile(
                leading: Image.asset(
                  'assets/Images/Pro bono.png', // Your custom icon path
                  height: 50, // Adjust the size of the icon
                  width: 50,
                ),
                title: Text("Get Legal Info and Docs"),
                subtitle: Text("All legal documents here"),

              ),
            ),
          ),
          Card(
            elevation: 3,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: ListTile(
              leading: Image.asset(
                'assets/Images/ai.png', // Your custom icon path
                height: 70, // Adjust the size of the icon
                width: 70,
              ),
              title: Text("Chat bot"),
              subtitle: Text("AI bot Legal Assistance that can assist you"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LegalAidForm()),
                      );
                    },
                      child: Image.asset('assets/Images/Card.png')),
                  SizedBox(width: 5,),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => DashboardScreen()),
                      );
                    },
                      child: Image.asset('assets/Images/Card2.png')),
                  SizedBox(width: 5,),
                  Image.asset('assets/Images/rights.png'),
                ],
              ),
            ),
          ),
          // Get Rehabilitation Service
          Card(
            elevation: 3,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Column(
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RehabilitationForm()),
                    );
                  },
                  child: Stack(
                    children:[ Image.asset(
                      'assets/Images/Rehab Widget.png', // Use an appropriate image
                      fit: BoxFit.cover,
                    ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          // Get Legal Help, Track Your Case
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/Images/Probono widget.png'),
              SizedBox(width: 5,),
              GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TrackCaseStatusScreen()),
                  );
                },
                  child: Image.asset('assets/Images/Track Case widget.png')),
            ],
          ),
        ],
      ),
    );
  }

  // Drawer Widget
  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text("Profile Name"),
            accountEmail: Text("xyz@gmail.com"),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Color(0xFF551AD3),
              child: Text(
                "R",
                style: TextStyle(fontSize: 40.0, color: Colors.white),
              ),
            ),
            decoration: BoxDecoration(
              color: Color(0xFFC4BAD4),
            ),
          ),
          _buildDrawerItem(Icons.home, 'Home'),
          _buildDrawerItem(Icons.book, 'Resources'),
          _buildDrawerItem(Icons.track_changes, 'Track Case'),
          _buildDrawerItem(Icons.gavel, 'Legal Assistance'),
          _buildDrawerItem(Icons.local_hospital, 'Rehabilitation'),
          _buildDrawerItem(Icons.video_call, 'Video Conferencing'),
          _buildDrawerItem(Icons.help_outline, 'FAQs'),
          _buildDrawerItem(Icons.info, 'About Us'),
          _buildDrawerItem(Icons.settings, 'Settings'),
        ],
      ),
    );
  }

  // Drawer Item Helper
  Widget _buildDrawerItem(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: Colors.black),
      title: Text(title),
      onTap: () {
        // Handle navigation on tap
        // Add your navigation logic here, like pushing to new pages
      },
    );
  }
}
