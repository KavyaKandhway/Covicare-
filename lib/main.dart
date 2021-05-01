import 'package:covicare/screens/sections.dart';
import 'package:flutter/material.dart';

import 'helpers/google_auth.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHome(),
    );
  }
}

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.deepPurple.shade100,
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: Text(
            "CoviCare",
            style: TextStyle(color: Colors.white),
          ),
        ),

        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              height: 30,
            ),
            Center(
              child: Image(
                image: AssetImage('images/logo.png'),
              ),
            ),
            Expanded(
              child: SizedBox(
                height: 30,
              ),
            ),
            TextButton(
              onPressed: () {
                print("Login with email");
              },
              child: Container(
                height: 50.0,
                child: Center(
                  child: Container(
                    child: Text(
                      "Login With Email",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.deepPurple,
                    width: 3.2,
                  ),
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Section()),
                );
              },
              child: Container(
                height: 50.0,
                child: Center(
                  child: Text(
                    "Login With Phone",
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  border: Border.all(
                    color: Colors.deepPurple,
                    width: 3.2,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                signInWithGoogle().then((result) {
                  if (result != null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Section()),
                    );
                  }
                });
              },
              child: Container(
                height: 50.0,
                child: Center(
                  child: Text(
                    "Login With Google",
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  border: Border.all(
                    color: Colors.deepPurple,
                    width: 3.2,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
