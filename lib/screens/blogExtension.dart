import 'dart:ui';

import 'package:flutter/material.dart';

class BlogExtend extends StatefulWidget {
  @override
  _BlogExtendState createState() => _BlogExtendState();
}

class _BlogExtendState extends State<BlogExtend> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    "Past Experience",
                    style: TextStyle(
                      fontSize: 30.0,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Image(
                    image: AssetImage('images/sample.jpg'),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    "There is nothing to worry much about it. All you need to do is to take necessary precautuons for yourself and for your family and carefully follow the prescribe routine as suggested by certified medical practioners. Keeping oneself calm under the situation is important. Ask infected person to wear a mask at home all times while home isolation.There is nothing to worry much about it. All you need to do is to take necessary precautuons for yourself and for your family and carefully follow the prescribe routine as suggested by certified medical practioners. Keeping oneself calm under the situation is important. Ask infected person to wear a mask at home all times while home isolation.",
                    style: TextStyle(fontSize: 20.0),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      "-XYZ",
                      textAlign: TextAlign.right,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
