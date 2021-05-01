import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SuccessReg extends StatefulWidget {
  @override
  _SuccessRegState createState() => _SuccessRegState();
}

class _SuccessRegState extends State<SuccessReg> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Successful"),
          backgroundColor: Colors.deepPurple,
        ),
        body: Center(
          child: Container(
            child: Center(
              child: Text(
                "You have successfully added!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            width: MediaQuery.of(context).size.width,
          ),
        ),
      ),
    );
  }
}
