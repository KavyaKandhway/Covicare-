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
        appBar: AppBar(
          title: Text("Information"),
          backgroundColor: Colors.cyan[500],
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
              child: Center(child: Text("Personal Information")),
            ),
            Container(
              height: 50,
              child: Center(child: Text("Update Supplies")),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                  color: Colors.black,
                ),
              ),
            ),
            Container(
              height: 50,
              child: Center(child: Text("Add a blog")),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                  color: Colors.black,
                ),
              ),
            ),
            Container(
              height: 50,
              child: Center(child: Text("Add a store")),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                  color: Colors.black,
                ),
              ),
            ),
            Container(
              height: 50,
              child: Center(child: Text("Logout")),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
