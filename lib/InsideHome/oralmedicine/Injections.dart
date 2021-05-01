import 'package:flutter/material.dart';

class Injections extends StatefulWidget {
  @override
  _InjectionsState createState() => _InjectionsState();
}

class _InjectionsState extends State<Injections> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Injections'),
        backgroundColor: Colors.cyan[500],
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: InjectionWidget(
                InjectionData: 'Remdesivir',
              ),
            ),
            Expanded(
              child: InkWell(
                child: InjectionWidget(
                  InjectionData: 'Favipiravir',
                ),
                onTap: () {},
              ),
            ),
            Expanded(
              child: InjectionWidget(
                InjectionData: 'Dexamethasone',
              ),
            ),
            Expanded(
              child: InjectionWidget(
                InjectionData: 'Hydrooxychloroquine',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InjectionWidget extends StatelessWidget {
  String InjectionData;
  InjectionWidget({this.InjectionData});
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
            InjectionData,
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
        ),
      ),
    );
  }
}
