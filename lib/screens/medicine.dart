import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Medicine extends StatefulWidget {
  @override
  _MedicineState createState() => _MedicineState();
}

class _MedicineState extends State<Medicine> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('store').snapshots(),
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
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      // border: Border.all(
                      //   color: Colors.black,
                      //   width: 1.2,
                      // ),
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                document['name'],
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18.0,
                                    color: Colors.black),
                              ),
                              Expanded(
                                child: SizedBox(
                                  width: 1000,
                                ),
                              ),
                              Icon(
                                Icons.phone,
                                color: Colors.black,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              document['bakery']
                                  ? Container(
                                      child: Text("Bakery   "),
                                    )
                                  : SizedBox(
                                      height: 0,
                                    ),
                              document['dairy']
                                  ? Container(
                                      child: Text("Dairy   "),
                                    )
                                  : SizedBox(
                                      height: 0,
                                    ),
                              document['grocery']
                                  ? Container(
                                      child: Text("Grocery   "),
                                    )
                                  : SizedBox(
                                      height: 0,
                                    ),
                              document['medical']
                                  ? Container(
                                      child: Text("Medical   "),
                                    )
                                  : SizedBox(
                                      height: 0,
                                    ),
                              document['personalbaby']
                                  ? Container(
                                      child: Text("Personal Care   "),
                                    )
                                  : SizedBox(
                                      height: 0,
                                    ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }).toList(),
            );
          }),
    );
  }
}
