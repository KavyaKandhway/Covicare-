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
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.cyan[100],
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
                          Text(
                            "Categories ",
                            style: TextStyle(color: Colors.black),
                          ),
                          Row(
                            children: [
                              document['bakery']
                                  ? Container(
                                      child: Text("Bakery "),
                                      width: 70,
                                      height: 30,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 1,
                                              color: Colors.cyan[500])),
                                    )
                                  : SizedBox(
                                      height: 0,
                                    ),
                              document['dairy']
                                  ? Container(
                                      child: Text("Dairy "),
                                      width: 50,
                                      height: 30,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 1,
                                              color: Colors.cyan[500])),
                                    )
                                  : SizedBox(
                                      height: 0,
                                    ),
                              document['grocery']
                                  ? Container(
                                      child: Text("Grocery "),
                                      width: 90,
                                      height: 30,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 1,
                                              color: Colors.cyan[500])),
                                    )
                                  : SizedBox(
                                      height: 0,
                                    ),
                              document['medical']
                                  ? Container(
                                      child: Text("Medical "),
                                      width: 100,
                                      height: 30,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 1,
                                              color: Colors.cyan[500])),
                                    )
                                  : SizedBox(
                                      height: 0,
                                    ),
                              document['personalbaby']
                                  ? Container(
                                      child: Text("Personal Care "),
                                      width: 100,
                                      height: 30,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 1,
                                              color: Colors.cyan[500])),
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
