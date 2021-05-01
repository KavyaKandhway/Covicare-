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
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.deepPurple[100],
        appBar: AppBar(
          title: Text('Supplies'),
          backgroundColor: Colors.deepPurple,
        ),
        body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('supply').snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView(
              children: snapshot.data.docs.map((document) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width - 30,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Container(
                              child: Text(
                                document['supplyname'],
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              alignment: Alignment.topLeft,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              child: Text("Phone no. " + document['phone']),
                              alignment: Alignment.topLeft,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                                width: MediaQuery.of(context).size.width,
                                child: Text(
                                  "Items Available ",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                  ),
                                  textAlign: TextAlign.left,
                                )),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Column(
                                  children: [
                                    document['oxygen']
                                        ? Container(
                                            child: Text(
                                              "Oxygen ",
                                              textAlign: TextAlign.left,
                                            ),
                                            width: 100,
                                            height: 30,
                                          )
                                        : SizedBox(
                                            height: 0,
                                          ),
                                    document['bed']
                                        ? Container(
                                            child: Text("Bed "),
                                            width: 100,
                                            height: 30,
                                          )
                                        : SizedBox(
                                            height: 0,
                                          ),
                                    document['rem']
                                        ? Container(
                                            child: Text("Remdesivir "),
                                            width: 100,
                                            height: 30,
                                          )
                                        : SizedBox(
                                            height: 0,
                                          ),
                                    document['fav']
                                        ? Container(
                                            child: Text("Favipiravir "),
                                            width: 100,
                                            height: 30,
                                          )
                                        : SizedBox(
                                            height: 0,
                                          ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    document['oxygen']
                                        ? Container(
                                            width: 100,
                                            height: 30,
                                            child: Text("Rs." +
                                                document['oxyamt'].toString() +
                                                "/unit"))
                                        : SizedBox(
                                            height: 0,
                                          ),
                                    document['bed']
                                        ? Container(
                                            width: 100,
                                            height: 30,
                                            child: Text("Rs." +
                                                document['bedamt'].toString() +
                                                "/unit"))
                                        : SizedBox(
                                            height: 0,
                                          ),
                                    document['rem']
                                        ? Container(
                                            width: 100,
                                            height: 30,
                                            child: Text("Rs." +
                                                document['remamt'].toString() +
                                                "/unit"))
                                        : SizedBox(
                                            height: 0,
                                          ),
                                    document['fav']
                                        ? Container(
                                            width: 100,
                                            height: 30,
                                            child: Text("Rs." +
                                                document['favamt'].toString() +
                                                "/unit"))
                                        : SizedBox(
                                            height: 0,
                                          ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            );
          },
        ),
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
