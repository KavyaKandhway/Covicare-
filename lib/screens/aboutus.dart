import 'dart:ui';
import 'package:covicare/screens/drawer.dart';
import 'package:covicare/main.dart';
import 'package:flutter/material.dart';

class AboutUs extends StatefulWidget {
  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: SafeArea(
        child: Scaffold(
        backgroundColor: Colors.deepPurple[100],
        appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => LeftDrawer()),
            );
          },
          child: Icon(
            Icons.arrow_back,
         ),
        ),
        title: Text("About Us"),
        backgroundColor: Colors.deepPurple,
        ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Card(
                clipBehavior: Clip.antiAlias,
                color: Colors.white,
                child: Column(
                  children: [
                    ListTile(
                      title: Center(
                          child: Text(
                            "Team RetroSynth",
                            style: TextStyle(fontSize: 25),
                          )),
                    ),
                    ListTile(
                      title: Text(
                            "Our Inspiration",
                            style: TextStyle(fontSize: 20),
                        textAlign: TextAlign.left,
                          ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                      child: Text(
                        "The inspiration for this project came from the second wave of Covid-19."
                            "Amidst chaos and shortage of resources, There were no one place where people can go to check if oxygen or beds or medicines are available or not."
                            "Patients had to go from one hospital to another and from one oxygen supplier to another and even though didn't get any lead."
                            "Also the people who had oxygen cylinders or other supplies were not able to effectively sell them to the needy ones as they didn't know where to post that they have surplus supplies. As we lack a particular platform people started posting stuffs on different social media such as WhatsApp, Twitter, LinkedIn etc."
                            "So there was a need of an mobile application that could act as a platform for solving this problem, where hospitals can connect directly with patients and inform them about the availability of beds,oxygen suppliers."
                            "One stop solution for the all patients to get all the necessary medicines , oxygen and beds so that they don't go from place to place only to get rejected. Our app is an effort to provide a complete solution for all Covid-19 needs.",
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    ListTile(
                      title: Text(
                            "What the App will do?",
                            style: TextStyle(fontSize: 20),
                        textAlign: TextAlign.left,
                          ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                      child: Column(
                        children: [
                          Text(
                          "The main section of our app has 2 sections Need Supplies and Sell supplies.",
                            style: TextStyle(fontSize: 15),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                          "In the need supplies section the patient can see all the hospitals where beds are available ,also the suppliers who have oxygen available and the people who have medicines like remdevisir available with them. So in from this section people can easily get the neccessary items they want.",
                            style: TextStyle(fontSize: 15),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                          "In the sell section we will have suppliers looking to sell oxygen and medicines. they will update their stock from time to time. the suppliers can fill data in this section and this data will beshown to patients who are in need of these items.",
                            style: TextStyle(fontSize: 15),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                          "Apart from this we have added a local store section where apart from all the urgent supplies such as mask, sanitizers, grocery items etc. So shop owners can post their shop opening times along with the category they sell and making the whole process organized.",
                            style: TextStyle(fontSize: 15),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                          "The last but not the least, we have added a section where people can post their experience precaution one could take. Its a section where qualified doctors can share effective measures. This could help to spread positivity.",
                          style: TextStyle(fontSize: 15),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    ListTile(
                      title: Text(
                        "Team Members",
                        style: TextStyle(fontSize: 20),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                      child: Column(
                        children: [
                          Text(
                            "Kavya Khandway",
                              style: TextStyle(fontSize: 15),
                            ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Ankita Jaiswal",
                            style: TextStyle(fontSize: 15),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Yashi Khandelwal",
                            style: TextStyle(fontSize: 15),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Ishan Kumar",
                            style: TextStyle(fontSize: 15),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                      ]
                    ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ),
      ),
    );
  }
}
