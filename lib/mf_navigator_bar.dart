import 'package:flutter/material.dart';
import 'cliper/tabbar_cliper.dart';
import 'painter/clip_shadow_painter.dart';

class MFNavigatorBar extends StatefulWidget {
  const MFNavigatorBar({super.key});

  @override
  State<MFNavigatorBar> createState() => _MFNavigatorBarState();
}

class _MFNavigatorBarState extends State<MFNavigatorBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(),
      body: Column(
        children: [
          const Expanded(child: SizedBox()),
          customView(),
        ],
      ),
    );
  }

  Widget customView() {
    return CustomPaint(
      painter: ClipShadowPainter(
        shadow: Shadow(
          color: Colors.black.withOpacity(0.1),
          offset: const Offset(0, -10),
          blurRadius: 20,
        ),
        clipper: TabBarClipper(),
      ),
      child: ClipPath(
        clipper: TabBarClipper(),
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          height: 74,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _normalTab('Tab1'),
              _normalTab('Tab2'),
              _centerTab(),
              _normalTab('Tab3'),
              _normalTab('Tab4'),
            ],
          ),
        ),
      ),
    );
  }

  /// 正常tab
  Widget _normalTab(String tabName) {
    return Padding(
      padding: const EdgeInsets.only(top: 14),
      child: Container(
        height: 60,
        color: Colors.white,
        alignment: Alignment.center,
        child: Text(
          tabName,
          style: const TextStyle(fontSize: 16, color: Colors.blue),
        ),
      ),
    );
  }

  /// 中间圆形tab
  Widget _centerTab() {
    return GestureDetector(
      child: Container(
        margin: const EdgeInsets.only(top: 1),
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF005CBF),
              Color(0xFF004EA1),
            ],
          ),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.3), offset: const Offset(0, 4), blurRadius: 8, spreadRadius: 1.0),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.add,
              color: Colors.white,
            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              child: const Text(
                '1111',
                maxLines: 1,
                style: TextStyle(
                  fontSize: 9.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
      onTap: () {},
    );
  }
}
