import 'package:flutter/material.dart';

class CardViewPage extends StatefulWidget {
  const CardViewPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _CardViewPageState();
  }
}

class _CardViewPageState extends State {
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
            side: const BorderSide(
              color: Colors.yellow,
              width: 3,
            ),
          ),
          child: Ink(
            child: InkWell(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 50),
                child: const Text('Card'),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
