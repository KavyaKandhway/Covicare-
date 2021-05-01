import 'package:flutter/material.dart';
import 'package:covicare/InsideHome/oralmedicine/Injections.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NeedSupplies extends StatefulWidget {
  @override
  _NeedSuppliesState createState() => _NeedSuppliesState();
}

class _NeedSuppliesState extends State<NeedSupplies> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Supplies'),
        backgroundColor: Colors.cyan[500],
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('supply').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView(
            children: snapshot.data.documents.map((document) {
              return Center(
                child: Container(
                  child: Text("phone " + document['phone']),
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}

class Supplies extends StatelessWidget {
  String SupplyData;
  Supplies({this.SupplyData});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.cyan[200],
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Center(
          child: Text(
            SupplyData,
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
        ),
      ),
    );
  }
}
