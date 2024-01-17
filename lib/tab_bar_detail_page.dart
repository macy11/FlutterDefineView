import 'dart:io';

import 'package:flutter/material.dart';

import 'utils/screen_utils.dart';

class TabBarDetailPage extends StatefulWidget {
  final String index;

  const TabBarDetailPage({
    super.key,
    required this.index,
  });

  @override
  State<TabBarDetailPage> createState() => TabBarDetailPageState();
}

class TabBarDetailPageState extends State<TabBarDetailPage> {
  @override
  void initState() {
    if (Platform.isIOS) {
      OrientationHelper.forceOrientation(DeviceOrientation.landscapeRight);
    } else if (Platform.isAndroid) {
      OrientationHelper.forceOrientation(DeviceOrientation.landscapeLeft);
      // 强制横屏
      // SystemChrome.setPreferredOrientations(
      //     [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Text('Detail: ${widget.index}'),
        ),
      ),
      onWillPop: () async {
        OrientationHelper.forceOrientation(DeviceOrientation.portraitUp);
        // SystemChrome.setPreferredOrientations(
        //     [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
        return true;
      },
    );
  }

  @override
  void dispose() {
    OrientationHelper.forceOrientation(DeviceOrientation.portraitUp);
    // SystemChrome.setPreferredOrientations(
    //     [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    super.dispose();
  }
}
