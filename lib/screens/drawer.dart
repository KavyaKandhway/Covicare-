import 'package:covicare/helpers/google_auth.dart';
import 'package:covicare/main.dart';
import 'package:covicare/screens/aboutus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:covicare/screens/storeform.dart';
import 'package:covicare/screens/supplyForm.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covicare/helpers/database.dart';

final _auth = FirebaseAuth.instance;
dynamic user;

class LeftDrawer extends StatefulWidget {
  @override
  _LeftDrawerState createState() => _LeftDrawerState();
}

class _LeftDrawerState extends State<LeftDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(12),
            color: Colors.deepPurple,
            child: Center(
              child: Column(
                children: [
                  Container(
                    width: 120,
                    height: 120,
                    margin: EdgeInsets.only(
                      top: 30,
                    ),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage("images/sample.jpg"),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Text(
                    "title",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "user email id",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
              leading: Icon(
                Icons.account_circle_outlined,
                size: 30,
              ),
              title: Text(
                'Profile',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              onTap: () {
                signOutGoogle();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => MyHome()),
                );
              }),
          ListTile(
              leading: Icon(
                Icons.add_chart,
                size: 30,
              ),
              title: Text(
                'Update Supply',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              onTap: () {
                signOutGoogle();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => SupplyForm()),
                );
              }),
          ListTile(
              leading: Icon(
                Icons.add_business,
                size: 30,
              ),
              title: Text(
                'Update Local Store',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              onTap: () {
                signOutGoogle();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => StoreForm()),
                );
              }),
          ListTile(
              leading: Icon(
                Icons.developer_board,
                size: 30,
              ),
              title: Text(
                'About Us',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              onTap: () {
                signOutGoogle();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => AboutUs()),
                );
              }),
          ListTile(
              leading: Icon(
                Icons.developer_board,
                size: 30,
              ),
              title: Text(
                'Delete Supply',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              onTap: () async {
                user = _auth.currentUser;
                await DatabaseService(uid: user.uid).deleteSupply();
              }),
          ListTile(
              leading: Icon(
                Icons.logout,
                size: 30,
              ),
              title: Text(
                'Logout',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              onTap: () {
                signOutGoogle();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => MyHome()),
                );
              }),
        ],
      ),
    );
  }
}
