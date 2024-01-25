import 'package:flutter/material.dart';

class PictureInkWellPage extends StatefulWidget {
  const PictureInkWellPage({super.key});

  @override
  State<StatefulWidget> createState() => _PictureInkWellPageState();
}

class _PictureInkWellPageState extends State<PictureInkWellPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          InkWell(
            onTap: () {},
            child: Container(
              alignment: Alignment.center,
              child: Ink.image(
                width: 343,
                height: 175,
                image: const AssetImage("assets/images/bg_card_tt.png"),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {},
            child: Ink.image(
              width: 343,
              height: 175,
              image: const AssetImage("assets/images/bg_card_tt.png"),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Material(
            clipBehavior: Clip.hardEdge,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
              side: const BorderSide(
                color: Colors.red,
                width: 3,
              ),
            ),
            child: InkWell(
              splashColor: Colors.red,
              onTap: () {},
              child: Ink(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/bg_card_tt.png"),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Container(
                  width: 100,
                  height: 100,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
