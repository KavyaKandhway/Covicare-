import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BlogExtend extends StatefulWidget {
  @override
  _BlogExtendState createState() => _BlogExtendState();
}

class _BlogExtendState extends State<BlogExtend> {
  int index;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.deepPurple[100],
          appBar: AppBar(
            leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back,
              ),
            ),
            title: Text("Blog"),
            backgroundColor: Colors.deepPurple,
          ),
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
                    return Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Card(
                        clipBehavior: Clip.antiAlias,
                        color: Colors.white,
                        child: Column(
                          children: [
                            ListTile(
                              title: Center(
                                  child: Text(
                                document['title'],
                                style: TextStyle(fontSize: 25),
                              )),
                            ),
                            Center(
                              child: Image(
                                image: AssetImage('images/sample.jpg'),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                              child: Text(
                                document['content'],
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: 300,
                                child: Text(
                                  "-" + document['name'],
                                  textAlign: TextAlign.right,
                                  style: TextStyle(fontSize: 18),
                                ),
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
                    );
                  }).toList(),
                );
              }),
        ),
      ),
    );
  }
}
