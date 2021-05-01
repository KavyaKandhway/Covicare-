import 'package:covicare/screens/blogForm.dart';
import 'package:covicare/screens/storeform.dart';
import 'package:covicare/screens/supplyForm.dart';
import 'package:flutter/material.dart';
import 'package:covicare/InsideHome/needsupplies.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.deepPurple[100],
        drawer: Drawer(
          child:Text("nmdvfdfmsdbfmsbfbsmfbsmdf"),

        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Center(
                    child: Text(
                      'How Can we help you?',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      child: HomeCard(
                        data: 'Need Supplies',
                        logo: 'images/needsupply.png',
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NeedSupplies()),
                        );
                      },
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SupplyForm()),
                          );
                        },
                        child: Center(
                            child: HomeCard(
                          data: 'Sell Supplies',
                          logo: 'images/sellsupply.jfif',
                        ))),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 5,
              child: Row(
                children: [
                  Expanded(
                      child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => StoreForm()),
                            );
                          },
                          child: HomeCard(
                            data: 'Add Local Store',
                            logo: 'images/localstore.png',
                          ))),
                  Expanded(
                    child: InkWell(
                      child: HomeCard(
                        data: 'Add Blog',
                        logo: 'images/addblog.jfif',
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => BlogForm()),
                        );
                      },
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class HomeCard extends StatelessWidget {
  String data;
  String logo;
  HomeCard({this.data, this.logo});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(40)),
          ),
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(logo),
              Center(
                child: Text(
                  data,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
