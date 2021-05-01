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
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.deepPurple[100],
          body: StreamBuilder(
              stream: FirebaseFirestore.instance.collection('blog').snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
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
                            padding: const EdgeInsets.all(10.0),
                            child: Card(
                              clipBehavior: Clip.antiAlias,
                              color: Colors.white,
                              child: Column(
                                children: [
                                  ListTile(
                                    leading: Icon(Icons.arrow_drop_down_circle),
                                    title: Text(document['title']),
                                    subtitle: Text(
                                      "-" + document['name'],
                                      style: TextStyle(
                                          color: Colors.black.withOpacity(0.6)),
                                    ),
                                  ),
                                  Center(
                                    child: Image(
                                      image: AssetImage(
                                          'images/' + document['imagelink']),
                                    ),
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Icon(
                                            Icons.favorite,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Icon(
                                            Icons.share,
                                          ),
                                        ],
                                      )),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                );
              })),
    );
  }
}
