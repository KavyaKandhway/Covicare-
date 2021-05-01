import 'dart:ui';
import 'package:covicare/screens/blogExtension.dart';
import 'package:covicare/screens/blogForm.dart';
import 'package:flutter/material.dart';

class Blog extends StatefulWidget {
  @override
  _BlogState createState() => _BlogState();
}

class _BlogState extends State<Blog> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    style: TextStyle(height: 1.0),
                    decoration: InputDecoration(
                      counterText: "",
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.zero,
                        borderSide: BorderSide(color: Colors.grey, width: 1.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.zero,
                        borderSide: BorderSide(color: Colors.grey, width: 2.0),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.zero,
                        borderSide: BorderSide(color: Colors.grey, width: 1.0),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.zero,
                        borderSide: BorderSide(color: Colors.grey, width: 1.0),
                      ),
                      labelText: 'Search',
                    ),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      BlogCard(
                        title: "XYZ XYZ YXZ",
                        author: "XYZ",
                      ),
                      BlogCard(
                        title: "XYZ XYZ YXZ",
                        author: "XYZ",
                      ),
                      BlogCard(
                        title: "XYZ XYZ YXZ",
                        author: "XYZ",
                      )
                    ],
                  ),
                )
              ],
            )));
  }
}

class BlogCard extends StatelessWidget {
  BlogCard({
    this.img,
    this.title,
    this.author,
  });
  final String img, title, author;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => BlogExtend()),
        );
      },
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.purple[400],
                width: 1.5,
              ),
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: 5,
                    ),
                    Center(
                      child: Image(
                        image: AssetImage('images/sample.jpg'),
                      ),
                    ),
                    Container(
                      height: 45,
                      child: Row(
                        children: [
                          Text(
                            "Past Experience",
                            style: TextStyle(color: Colors.black, fontSize: 20),
                            textAlign: TextAlign.left,
                          ),
                          Text(
                            "-XYZ",
                            style:
                                TextStyle(color: Colors.black54, fontSize: 10),
                            textAlign: TextAlign.end,
                          )
                        ],
                      ),
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
