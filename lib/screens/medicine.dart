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
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  style: TextStyle(height: 1.0),
                  decoration: InputDecoration(
                    counterText: "",
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.zero,
                      borderSide: BorderSide(color: Colors.grey, width: 1.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.zero,
                      borderSide: BorderSide(color: Colors.grey, width: 2.0),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.zero,
                      borderSide: BorderSide(color: Colors.grey, width: 1.0),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.zero,
                      borderSide: BorderSide(color: Colors.grey, width: 1.0),
                    ),
                    labelText: 'Search',
                  ),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    LocalInfoCard(
                      name: 'ABC Shop',
                      itemsAvl: 'Soap, Sanitizer',
                      open: '9 am to 2 pm',
                    ),
                    LocalInfoCard(
                      name: 'ABC Shop',
                      itemsAvl: 'Soap, Sanitizer',
                      open: '9 am to 2 pm',
                    ),
                    LocalInfoCard(
                      name: 'ABC Shop',
                      itemsAvl: 'Soap, Sanitizer',
                      open: '9 am to 2 pm',
                    ),
                    LocalInfoCard(
                      name: 'ABC Shop',
                      itemsAvl: 'Soap, Sanitizer',
                      open: '9 am to 2 pm',
                    ),
                    LocalInfoCard(
                      name: 'ABC Shop',
                      itemsAvl: 'Soap, Sanitizer',
                      open: '9 am to 2 pm',
                    ),
                    LocalInfoCard(
                      name: 'ABC Shop',
                      itemsAvl: 'Soap, Sanitizer',
                      open: '9 am to 2 pm',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LocalInfoCard extends StatelessWidget {
  LocalInfoCard({
    this.name,
    this.itemsAvl,
    this.open,
  });
  final String name, itemsAvl, open;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.cyan[50],
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
                    name,
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
                "Items Available",
                style: TextStyle(color: Colors.black),
              ),
              Text(
                itemsAvl,
                style: TextStyle(color: Colors.black),
              ),
              Text(
                "Opened: " + open,
                style: TextStyle(color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
