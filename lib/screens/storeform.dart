import 'package:covicare/helpers/database.dart';
import 'package:csc_picker/csc_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:covicare/models/store.dart';

import 'successReg.dart';

class StoreForm extends StatefulWidget {
  @override
  _StoreFormState createState() => _StoreFormState();
}

final _auth = FirebaseAuth.instance;
dynamic user;

class _StoreFormState extends State<StoreForm> {
  TextEditingController name = TextEditingController();
  TextEditingController contact = TextEditingController();
  TextEditingController pincode = TextEditingController();
  TextEditingController address1 = TextEditingController();
  TextEditingController address2 = TextEditingController();
  TextEditingController landmark = TextEditingController();
  String countryValue = '', stateValue = '', cityValue = '';
  bool grocery = false,
      medical = false,
      dairy = false,
      bakery = false,
      homekitchen = false,
      personalcare = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Add Local Store"),
          backgroundColor: Colors.cyan[500],
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  child: Text(
                    "Enter name of store",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  width: MediaQuery.of(context).size.width,
                ),
                SizedBox(
                  height: 10.0,
                ),
                TextField(
                  controller: name,
                  maxLength: 40,
                  decoration: InputDecoration(
                    labelText: "name",
                    counterText: "",
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(color: Colors.cyan, width: 3.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(color: Colors.cyan, width: 1.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  child: Text(
                    "Enter contact number",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  width: MediaQuery.of(context).size.width,
                ),
                SizedBox(
                  height: 10.0,
                ),
                TextField(
                  controller: contact,
                  keyboardType: TextInputType.number,
                  maxLength: 10,
                  decoration: InputDecoration(
                    labelText: "contact Number",
                    counterText: "",
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(color: Colors.cyan, width: 3.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(color: Colors.cyan, width: 1.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  child: Text(
                    "Select Location",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  width: MediaQuery.of(context).size.width,
                ),
                SizedBox(
                  height: 10.0,
                ),
                CSCPicker(
                  showStates: true,
                  showCities: true,
                  flagState: CountryFlag.SHOW_IN_DROP_DOWN_ONLY,
                  dropdownDecoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.cyan[50],
                      border: Border.all(color: Colors.cyan, width: 2)),
                  disabledDropdownDecoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.grey.shade300,
                      border: Border.all(color: Colors.grey[300], width: 1)),
                  selectedItemStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                  dropdownHeadingStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                  dropdownItemStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                  dropdownDialogRadius: 10.0,
                  searchBarRadius: 10.0,
                  onCountryChanged: (value) {
                    setState(() {
                      countryValue = 'India';
                    });
                  },
                  onStateChanged: (value) {
                    setState(() {
                      stateValue = value;
                    });
                  },
                  onCityChanged: (value) {
                    setState(() {
                      cityValue = value;
                    });
                  },
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  child: Text(
                    "Enter pincode",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  width: MediaQuery.of(context).size.width,
                ),
                SizedBox(
                  height: 10.0,
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  maxLength: 6,
                  controller: pincode,
                  decoration: InputDecoration(
                    labelText: "Pincode",
                    counterText: "",
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(color: Colors.cyan, width: 3.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(color: Colors.cyan, width: 1.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  child: Text(
                    "Enter Address ",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  width: MediaQuery.of(context).size.width,
                ),
                SizedBox(
                  height: 10.0,
                ),
                TextField(
                  controller: address1,
                  maxLength: 40,
                  decoration: InputDecoration(
                    labelText: "Address Line 1",
                    counterText: "",
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(color: Colors.cyan, width: 3.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(color: Colors.cyan, width: 1.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                TextField(
                  controller: address2,
                  maxLength: 40,
                  decoration: InputDecoration(
                    labelText: "Address Line 2",
                    counterText: "",
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(color: Colors.cyan, width: 3.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(color: Colors.cyan, width: 1.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  child: Text(
                    "Enter Landmark",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  width: MediaQuery.of(context).size.width,
                ),
                SizedBox(
                  height: 10.0,
                ),
                TextField(
                  controller: landmark,
                  maxLength: 40,
                  decoration: InputDecoration(
                    labelText: "Landmark",
                    counterText: "",
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(color: Colors.cyan, width: 3.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(color: Colors.cyan, width: 1.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  child: Text(
                    "Select the category",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  width: MediaQuery.of(context).size.width,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.cyan,
                      width: 2,
                    ),
                  ),
                  child: Column(
                    children: [
                      CheckboxListTile(
                        title: Container(
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text("Grocery"),
                                Expanded(
                                  child: SizedBox(
                                    width: 500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        tristate: true,
                        value: grocery,
                        controlAffinity: ListTileControlAffinity.leading,
                        onChanged: (bool value) {
                          setState(() {
                            grocery = value;
                          });
                        },
                      ),
                      CheckboxListTile(
                        title: Container(
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text("Medical"),
                                Expanded(
                                  child: SizedBox(
                                    width: 500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        tristate: false,
                        value: medical,
                        controlAffinity: ListTileControlAffinity.leading,
                        onChanged: (bool value) {
                          setState(() {
                            medical = value;
                          });
                        },
                      ),
                      CheckboxListTile(
                        title: Container(
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text("Dairy"),
                                Expanded(
                                  child: SizedBox(
                                    width: 500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        tristate: true,
                        value: dairy,
                        controlAffinity: ListTileControlAffinity.leading,
                        onChanged: (bool value) {
                          setState(() {
                            dairy = value;
                          });
                        },
                      ),
                      CheckboxListTile(
                        title: Container(
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text("Bakery"),
                                Expanded(
                                  child: SizedBox(
                                    width: 500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        tristate: true,
                        value: bakery,
                        controlAffinity: ListTileControlAffinity.leading,
                        onChanged: (bool value) {
                          setState(() {
                            bakery = value;
                          });
                        },
                      ),
                      CheckboxListTile(
                        title: Container(
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text("Home/Kitchen"),
                                Expanded(
                                  child: SizedBox(
                                    width: 500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        tristate: true,
                        value: homekitchen,
                        controlAffinity: ListTileControlAffinity.leading,
                        onChanged: (bool value) {
                          setState(() {
                            homekitchen = value;
                          });
                        },
                      ),
                      CheckboxListTile(
                        title: Container(
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text("Personal and Baby Care"),
                                Expanded(
                                  child: SizedBox(
                                    width: 500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        tristate: true,
                        value: personalcare,
                        controlAffinity: ListTileControlAffinity.leading,
                        onChanged: (bool value) {
                          setState(() {
                            personalcare = value;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () async {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => SuccessReg()),
                    );
                    print("Entered");
                    Store store = Store(
                        name: name.text,
                        contact: contact.text,
                        country: countryValue,
                        state: stateValue,
                        city: cityValue,
                        pincode: pincode.text,
                        address1: address1.text,
                        address2: address2.text,
                        landmark: landmark.text,
                        grocery: grocery,
                        medical: medical,
                        dairy: dairy,
                        bakery: bakery,
                        personalcare: personalcare);
                    user = _auth.currentUser;
                    print("database=================");
                    await DatabaseService(uid: user.uid).updateStoreData(store);
                  },
                  child: Container(
                    height: 40,
                    width: MediaQuery.of(context).size.width - 30,
                    decoration: BoxDecoration(
                      color: Colors.cyan[100],
                      border: Border.all(width: 2, color: Colors.black),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(child: Text("Submit")),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
