import 'package:covicare/screens/blogs.dart';
import 'package:covicare/screens/drawer.dart';
import 'package:covicare/screens/home.dart';
import 'package:covicare/screens/medicine.dart';
import 'package:flutter/material.dart';
import 'package:covicare/main.dart';
import '../helpers/google_auth.dart';

class Section extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SectionPage(title: 'CoviCare Home Page'),
    );
  }
}

class SectionPage extends StatefulWidget {
  SectionPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SectionPageState createState() => _SectionPageState();
}

class _SectionPageState extends State<SectionPage> {
  int _currentIndex = 0;

  final appheading = [
    'Home',
    'Blogs',
    'Local Store',
  ];

  final tabs = [
    Home(),
    Blog(),
    Medicine(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.deepPurple[100],
          appBar: AppBar(
            backgroundColor: Colors.deepPurple,
            leading: IconButton(
              icon: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LeftDrawer()),
                  );
                },
                child: Icon(
                  Icons.menu,
                  color: Colors.white,
                ),
              ),
            ),
            title: Text(
              appheading[_currentIndex],
              style: TextStyle(color: Colors.black),
            ),
            actions: [
              IconButton(
                icon: GestureDetector(
                  onTap: () {
                    signOutGoogle();
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => MyHome()),
                    );
                  },
                  child: Icon(
                    Icons.exit_to_app,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          body: tabs[_currentIndex],
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
                // sets the background color of the `BottomNavigationBar`
                canvasColor: Colors.green,
                // sets the active color of the `BottomNavigationBar` if `Brightness` is light
                primaryColor: Colors.black,
                textTheme: Theme.of(context)
                    .textTheme
                    .copyWith(caption: new TextStyle(color: Colors.yellow))),
            child: BottomNavigationBar(
              backgroundColor: Colors.deepPurple,
              currentIndex: _currentIndex,
              items: [
                BottomNavigationBarItem(
                    label: 'Home',
                    icon: Icon(
                      Icons.home,
                      color: _currentIndex == 0 ? Colors.white : Colors.black,
                    )),
                BottomNavigationBarItem(
                    label: 'Blog',
                    backgroundColor: Colors.black,
                    icon: Icon(
                      Icons.add_comment,
                      color: _currentIndex == 1 ? Colors.white : Colors.black,
                    )),
                BottomNavigationBarItem(
                    label: 'Local Store',
                    icon: Icon(
                      Icons.local_grocery_store,
                      color: _currentIndex == 2 ? Colors.white : Colors.black,
                    ))
              ],
              onTap: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
