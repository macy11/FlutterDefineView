import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mcy_define_view/notification/send_msg_notification.dart';

class NotificationRoute extends StatefulWidget {
  const NotificationRoute({super.key});

  @override
  State<NotificationRoute> createState() {
    return _NotificationRoute();
  }
}

class _NotificationRoute extends State<NotificationRoute> {
  String currentMsg = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: NotificationListener<SendMsgNotification>(
        child: Column(
          children: [
            Builder(builder: (context) {
              return Align(
                child: ElevatedButton(
                  onPressed: () {
                    var nextInt = Random().nextInt(10);
                    SendMsgNotification(msg: "$nextInt").dispatch(context);
                  },
                  child: const Text('Send Notification'),
                ),
              );
            }),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                currentMsg,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  color: Colors.red,
                ),
              ),
            )
          ],
        ),
        onNotification: (notification) {
          setState(() {
            currentMsg += "Msg:${notification.msg}\\*";
          });
          return true;
        },
      ),
    );
  }
}
