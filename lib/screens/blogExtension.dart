import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
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
      home: Scaffold(
        appBar: AppBar(
          title: Text("Blog"),
          backgroundColor: Colors.cyan[500],
        ),
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
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            document['title'],
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
                            document['content'],
                            style: TextStyle(fontSize: 20.0),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: Text(
                              document['name'],
                              textAlign: TextAlign.right,
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }).toList(),
              );
            }),
      ),
    );
  }
}
