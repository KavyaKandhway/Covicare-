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
          title: Text("Successful Registration"),
          backgroundColor: Colors.cyan[500],
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  child: Text(
                    "You have successfully registered!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  width: MediaQuery.of(context).size.width,
                ), 
              ],
            ),
          ),
        ),
      ),
    );
  }
}