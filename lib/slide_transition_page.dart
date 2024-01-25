import 'package:flutter/material.dart';
import 'package:mcy_define_view/utils/screen_utils.dart';

class SlideTransitionPage extends StatefulWidget {
  const SlideTransitionPage({super.key});

  @override
  State<SlideTransitionPage> createState() => _SlideTransitionPageState();
}

class _SlideTransitionPageState extends State<SlideTransitionPage> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    var screenW = ScreenUtils.shared().screenWidth;
    var screenH = ScreenUtils.shared().screenHeight;
    var appBarHeight = ScreenUtils.shared().appBarHeight;
    var dx = (screenW - 150) / 150;
    var dy = (screenH - appBarHeight - 150) / 150;

    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat(reverse: true);

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0.0, 0.0),
      end: Offset(dx, dy),
    ).animate(_controller);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SafeArea(
          child: Stack(
            children: [
              SlideTransition(
                position: _offsetAnimation,
                child: Container(
                  color: Colors.lightGreenAccent,
                  width: 150,
                  height: 150,
                  child: const SizedBox(),
                ),
              ),
            ],
          ),
        ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
