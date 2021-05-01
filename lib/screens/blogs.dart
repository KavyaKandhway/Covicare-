import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
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
    return Scaffold(
        body: StreamBuilder(
            stream: FirebaseFirestore.instance.collection('blog').snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return ListView(
                children: snapshot.data.docs.map((document) {
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
                                          document['title'],
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 20),
                                          textAlign: TextAlign.left,
                                        ),
                                        Text(
                                          "-" + document['name'],
                                          style: TextStyle(
                                              color: Colors.black54,
                                              fontSize: 10),
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
                }).toList(),
              );
            }));
  }
}
