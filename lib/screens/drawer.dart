import 'package:covicare/helpers/google_auth.dart';
import 'package:covicare/main.dart';
import 'package:flutter/material.dart';

class LeftDrawer extends StatefulWidget {
  @override
  _LeftDrawerState createState() => _LeftDrawerState();
}

class _LeftDrawerState extends State<LeftDrawer> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.deepPurple[100],
        appBar: AppBar(
          title: Text("Information"),
          backgroundColor: Colors.deepPurple,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
        ),
        body: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                  color: Colors.black,
                ),
              ),
              height: 50,
              child: Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.account_circle_outlined,
                    size: 30,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Personal Information",
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
            Container(
              height: 50,
              child: Center(
                child: Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.add_chart,
                      size: 30,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Update Sypply",
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                  color: Colors.black,
                ),
              ),
            ),
            Container(
              height: 50,
              child: Center(
                child: Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.logout,
                      size: 30,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        signOutGoogle();
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => MyHome()),
                        );
                      },
                      child: Text(
                        "Logout ",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(
              height: 100,
            ),
            Container(
              child: Column(
                children: [
                  Text(
                    "Team RetroSynth",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "Kavya Kandhway",
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    "Ankita Jaiswal",
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    "Yashi Khandelwal",
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    "Ishan Kumar",
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
