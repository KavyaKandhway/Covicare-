import 'package:flutter/material.dart';
import 'package:covicare/InsideHome/oralmedicine/Injections.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NeedSupplies extends StatefulWidget {
  @override
  _NeedSuppliesState createState() => _NeedSuppliesState();
}

class _NeedSuppliesState extends State<NeedSupplies> {
  String search = "";

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.deepPurple[100],
        appBar: AppBar(
          title: Text('Supplies'),
          backgroundColor: Colors.deepPurple,
        ),
        body: Column(
          children: [
            TextFormField(
              onChanged: (val) {
                setState(() {
                  search = val;
                });
                print("val=" + search);
              },
            ),
            StreamBuilder(
              stream:
                  FirebaseFirestore.instance.collection('supply').snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

                return Expanded(
                  child: SizedBox(
                    height: 200,
                    child: ListView(
                      children: snapshot.data.docs.map((document) {
                        String oxy = "oxygen",
                            bed = "beds",
                            rem = "remdesivir",
                            fav = "favipiravir";
                        List<String> toSearch = [];

                        String cur = "";
                        for (int i = 0; i < search.length; i++) {
                          if (search[i] != ' ') {
                            cur += search[i];
                          } else {
                            toSearch.add(cur);
                            cur = "";
                          }
                        }
                        if (cur.length > 0) {
                          toSearch.add(cur);
                        }
                        print(toSearch.length);
                        print(toSearch);
                        if (toSearch.length == 1) {
                          if (document['city']
                                  .toLowerCase()
                                  .contains(toSearch[0].toLowerCase()) ||
                              (oxy.contains(toSearch[0].toLowerCase()) &&
                                  document['oxygen']) ||
                              (bed.contains(toSearch[0].toLowerCase()) &&
                                  document['bed']) ||
                              (rem.contains(toSearch[0].toLowerCase()) &&
                                  document['rem']) ||
                              (fav.contains(toSearch[0].toLowerCase()) &&
                                  document['fav']) ||
                              document['state']
                                  .toLowerCase()
                                  .contains(toSearch[0].toLowerCase())) {
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
                                          child: Text(
                                              "Phone no. " + document['phone']),
                                          alignment: Alignment.topLeft,
                                        ),
                                        Text(document['city']),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
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
                                                          textAlign:
                                                              TextAlign.left,
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
                                                        child:
                                                            Text("Remdesivir "),
                                                        width: 100,
                                                        height: 30,
                                                      )
                                                    : SizedBox(
                                                        height: 0,
                                                      ),
                                                document['fav']
                                                    ? Container(
                                                        child: Text(
                                                            "Favipiravir "),
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
                                                            document['oxyamt']
                                                                .toString() +
                                                            "/unit"))
                                                    : SizedBox(
                                                        height: 0,
                                                      ),
                                                document['bed']
                                                    ? Container(
                                                        width: 100,
                                                        height: 30,
                                                        child: Text("Rs." +
                                                            document['bedamt']
                                                                .toString() +
                                                            "/unit"))
                                                    : SizedBox(
                                                        height: 0,
                                                      ),
                                                document['rem']
                                                    ? Container(
                                                        width: 100,
                                                        height: 30,
                                                        child: Text("Rs." +
                                                            document['remamt']
                                                                .toString() +
                                                            "/unit"))
                                                    : SizedBox(
                                                        height: 0,
                                                      ),
                                                document['fav']
                                                    ? Container(
                                                        width: 100,
                                                        height: 30,
                                                        child: Text("Rs." +
                                                            document['favamt']
                                                                .toString() +
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
                          } else
                            return Container(
                              height: 10.0,
                              child: Text(''),
                            );
                        } else if (toSearch.length == 2) {
                          print("size2");
                          if (document['city']
                                  .toLowerCase()
                                  .contains(toSearch[0].toLowerCase()) &&
                              ((oxy.contains(toSearch[1].toLowerCase()) &&
                                      document['oxygen']) ||
                                  (bed.contains(toSearch[1].toLowerCase()) &&
                                      document['bed']) ||
                                  (rem.contains(toSearch[1].toLowerCase()) &&
                                      document['rem']) ||
                                  (fav.contains(toSearch[1].toLowerCase()) &&
                                      document['fav']))) {
                            print("here1");
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
                                        Text(document['city']),
                                        Container(
                                          child: Text(
                                              "Phone no. " + document['phone']),
                                          alignment: Alignment.topLeft,
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
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
                                                          textAlign:
                                                              TextAlign.left,
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
                                                        child:
                                                            Text("Remdesivir "),
                                                        width: 100,
                                                        height: 30,
                                                      )
                                                    : SizedBox(
                                                        height: 0,
                                                      ),
                                                document['fav']
                                                    ? Container(
                                                        child: Text(
                                                            "Favipiravir "),
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
                                                            document['oxyamt']
                                                                .toString() +
                                                            "/unit"))
                                                    : SizedBox(
                                                        height: 0,
                                                      ),
                                                document['bed']
                                                    ? Container(
                                                        width: 100,
                                                        height: 30,
                                                        child: Text("Rs." +
                                                            document['bedamt']
                                                                .toString() +
                                                            "/unit"))
                                                    : SizedBox(
                                                        height: 0,
                                                      ),
                                                document['rem']
                                                    ? Container(
                                                        width: 100,
                                                        height: 30,
                                                        child: Text("Rs." +
                                                            document['remamt']
                                                                .toString() +
                                                            "/unit"))
                                                    : SizedBox(
                                                        height: 0,
                                                      ),
                                                document['fav']
                                                    ? Container(
                                                        width: 100,
                                                        height: 30,
                                                        child: Text("Rs." +
                                                            document['favamt']
                                                                .toString() +
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
                          } else if (document['city']
                                  .toLowerCase()
                                  .contains(toSearch[1].toLowerCase()) &&
                              ((oxy.contains(toSearch[0].toLowerCase()) &&
                                      document['oxygen']) ||
                                  (bed.contains(toSearch[0].toLowerCase()) &&
                                      document['bed']) ||
                                  (rem.contains(toSearch[0].toLowerCase()) &&
                                      document['rem']) ||
                                  (fav.contains(toSearch[0].toLowerCase()) &&
                                      document['fav']))) {
                            print("here2");
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
                                          child: Text(
                                              "Phone no. " + document['phone']),
                                          alignment: Alignment.topLeft,
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Text(document['city']),
                                        Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
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
                                                          textAlign:
                                                              TextAlign.left,
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
                                                        child:
                                                            Text("Remdesivir "),
                                                        width: 100,
                                                        height: 30,
                                                      )
                                                    : SizedBox(
                                                        height: 0,
                                                      ),
                                                document['fav']
                                                    ? Container(
                                                        child: Text(
                                                            "Favipiravir "),
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
                                                            document['oxyamt']
                                                                .toString() +
                                                            "/unit"))
                                                    : SizedBox(
                                                        height: 0,
                                                      ),
                                                document['bed']
                                                    ? Container(
                                                        width: 100,
                                                        height: 30,
                                                        child: Text("Rs." +
                                                            document['bedamt']
                                                                .toString() +
                                                            "/unit"))
                                                    : SizedBox(
                                                        height: 0,
                                                      ),
                                                document['rem']
                                                    ? Container(
                                                        width: 100,
                                                        height: 30,
                                                        child: Text("Rs." +
                                                            document['remamt']
                                                                .toString() +
                                                            "/unit"))
                                                    : SizedBox(
                                                        height: 0,
                                                      ),
                                                document['fav']
                                                    ? Container(
                                                        width: 100,
                                                        height: 30,
                                                        child: Text("Rs." +
                                                            document['favamt']
                                                                .toString() +
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
                          } else if (document['state']
                                  .toLowerCase()
                                  .contains(toSearch[1].toLowerCase()) &&
                              ((oxy.contains(toSearch[0].toLowerCase()) &&
                                      document['oxygen']) ||
                                  (bed.contains(toSearch[0].toLowerCase()) &&
                                      document['bed']) ||
                                  (rem.contains(toSearch[0].toLowerCase()) &&
                                      document['rem']) ||
                                  (fav.contains(toSearch[0].toLowerCase()) &&
                                      document['fav']))) {
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
                                          child: Text(
                                              "Phone no. " + document['phone']),
                                          alignment: Alignment.topLeft,
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Text(document['city']),
                                        Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
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
                                                          textAlign:
                                                              TextAlign.left,
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
                                                        child:
                                                            Text("Remdesivir "),
                                                        width: 100,
                                                        height: 30,
                                                      )
                                                    : SizedBox(
                                                        height: 0,
                                                      ),
                                                document['fav']
                                                    ? Container(
                                                        child: Text(
                                                            "Favipiravir "),
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
                                                            document['oxyamt']
                                                                .toString() +
                                                            "/unit"))
                                                    : SizedBox(
                                                        height: 0,
                                                      ),
                                                document['bed']
                                                    ? Container(
                                                        width: 100,
                                                        height: 30,
                                                        child: Text("Rs." +
                                                            document['bedamt']
                                                                .toString() +
                                                            "/unit"))
                                                    : SizedBox(
                                                        height: 0,
                                                      ),
                                                document['rem']
                                                    ? Container(
                                                        width: 100,
                                                        height: 30,
                                                        child: Text("Rs." +
                                                            document['remamt']
                                                                .toString() +
                                                            "/unit"))
                                                    : SizedBox(
                                                        height: 0,
                                                      ),
                                                document['fav']
                                                    ? Container(
                                                        width: 100,
                                                        height: 30,
                                                        child: Text("Rs." +
                                                            document['favamt']
                                                                .toString() +
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
                          } else if (document['state']
                                  .toLowerCase()
                                  .contains(toSearch[0].toLowerCase()) &&
                              ((oxy.contains(toSearch[1].toLowerCase()) &&
                                      document['oxygen']) ||
                                  (bed.contains(toSearch[1].toLowerCase()) &&
                                      document['bed']) ||
                                  (rem.contains(toSearch[1].toLowerCase()) &&
                                      document['rem']) ||
                                  (fav.contains(toSearch[1].toLowerCase()) &&
                                      document['fav']))) {
                          } else {
                            print("here4");
                            return Container(
                              height: 10.0,
                              child: Text(''),
                            );
                          }
                        } else {
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
                                        child: Text(
                                            "Phone no. " + document['phone']),
                                        alignment: Alignment.topLeft,
                                      ),
                                      Text(document['city']),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Container(
                                          width:
                                              MediaQuery.of(context).size.width,
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
                                                        textAlign:
                                                            TextAlign.left,
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
                                                      child:
                                                          Text("Remdesivir "),
                                                      width: 100,
                                                      height: 30,
                                                    )
                                                  : SizedBox(
                                                      height: 0,
                                                    ),
                                              document['fav']
                                                  ? Container(
                                                      child:
                                                          Text("Favipiravir "),
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
                                                          document['oxyamt']
                                                              .toString() +
                                                          "/unit"))
                                                  : SizedBox(
                                                      height: 0,
                                                    ),
                                              document['bed']
                                                  ? Container(
                                                      width: 100,
                                                      height: 30,
                                                      child: Text("Rs." +
                                                          document['bedamt']
                                                              .toString() +
                                                          "/unit"))
                                                  : SizedBox(
                                                      height: 0,
                                                    ),
                                              document['rem']
                                                  ? Container(
                                                      width: 100,
                                                      height: 30,
                                                      child: Text("Rs." +
                                                          document['remamt']
                                                              .toString() +
                                                          "/unit"))
                                                  : SizedBox(
                                                      height: 0,
                                                    ),
                                              document['fav']
                                                  ? Container(
                                                      width: 100,
                                                      height: 30,
                                                      child: Text("Rs." +
                                                          document['favamt']
                                                              .toString() +
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
                        }
                      }).toList(),
                    ),
                  ),
                );
              },
            ),
          ],
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
