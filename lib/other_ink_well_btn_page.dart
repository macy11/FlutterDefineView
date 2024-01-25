import 'package:flutter/material.dart';

class OtherInkWellBtnPage extends StatefulWidget {
  const OtherInkWellBtnPage({super.key});

  @override
  State<OtherInkWellBtnPage> createState() => _OtherInkWellBtnPageState();
}

class _OtherInkWellBtnPageState extends State<OtherInkWellBtnPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          ClipOval(
            child: Material(
              child: Ink(
                color: Colors.orange,
                child: InkWell(
                  onTap: () {},
                  splashColor: Colors.blueAccent,
                  child: Container(
                    alignment: Alignment.center,
                    width: 100,
                    height: 100,
                    child: const Text(
                      'InkWell',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {},
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            child: Container(
              // color: Colors.white,
              alignment: Alignment.center,
              width: 200,
              height: 100,
              child: const Text(
                'InkWell',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            // splashColor: Colors.green,
          ),
          const SizedBox(
            height: 10,
          ),
          Material(
            color: Colors.green,
            child: Ink(
              child: InkWell(
                onTap: () {},
                splashColor: Colors.red,
                child: Container(
                  alignment: Alignment.center,
                  width: 200,
                  height: 100.0,
                  child: const Text("Material\nInk\nInkWell"),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Material(
            color: Colors.purple,
            child: InkResponse(
              onTap: () {},
              splashColor: Colors.black45,
              child: Container(
                alignment: Alignment.center,
                width: 200,
                height: 100.0,
                child: const Text("Material\nInk\nInkWell"),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: List<Widget>.generate(3, (index) => Text('$index')),
          ),
          for (int i = 0; i < 2; i++) ...[Text("${i * i}")]
        ],
      ),
    );
  }
}
