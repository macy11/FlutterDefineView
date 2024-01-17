import 'package:flutter/material.dart';

class NavigatorRailPage extends StatefulWidget {
  const NavigatorRailPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _NavigatorRailPageState();
  }
}

class _NavigatorRailPageState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child:  Card(
          clipBehavior: Clip.hardEdge,
          color: Colors.blueAccent,
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
            side: BorderSide(
              color: Colors.yellow,
              width: 3,
            ),
          ),
          child: Ink(
            child: InkWell(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 100, vertical: 50),
                child: Text('Card'),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
