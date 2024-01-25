import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mcy_define_view/other_ink_well_btn_page.dart';
import 'package:mcy_define_view/picture_ink_well_page.dart';
import 'package:mcy_define_view/ripple/card_view_page.dart';
import 'package:mcy_define_view/ripple/data_table_page.dart';
import 'package:mcy_define_view/slide_transition_page.dart';
import 'package:mcy_define_view/tab_bar_page.dart';
import 'mf_navigator_bar.dart';

void main() {
  runApp(const MyApp());
}

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();
final List<int> sortList = <int>[];

class MyApp extends StatelessWidget {
  // 用于路由返回监听
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      navigatorObservers: [routeObserver],
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
          alignment: Alignment.topCenter,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return const DataTablePage();
                    }));
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: 200,
                    height: 100,
                    child: const Text('DataTablePage'),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return const CardViewPage();
                    }));
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: 200,
                    height: 100,
                    child: const Text('CardViewPage'),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Ink(
                  color: Colors.orange,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return const TabBarPage();
                      }));
                    },
                    splashColor: Colors.blueAccent,
                    child: Container(
                      alignment: Alignment.center,
                      width: 200,
                      height: 100,
                      child: const Text(
                        'TabBarPage',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                  child: Material(
                    child: Ink(
                      color: Colors.orange,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return const SlideTransitionPage();
                          }));
                        },
                        // ignore: sort_child_properties_last
                        child: Container(
                          alignment: Alignment.center,
                          width: 200,
                          height: 100,
                          child: const Text(
                            'SlideTransitionPage',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                        splashColor: Colors.blueAccent,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ClipOval(
                  child: Material(
                    child: Ink(
                      color: Colors.orange,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return const PictureInkWellPage();
                          }));
                        },
                        splashColor: Colors.blueAccent,
                        child: Container(
                          alignment: Alignment.center,
                          width: 200,
                          height: 100,
                          child: const Text(
                            'PictureInkWellPage',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              heroTag: 'BezierCurve',
              key: const Key('BezierCurve'),
              onPressed: _openBezierCurve,
              tooltip: 'BezierCurve',
              child: const Icon(Icons.navigation),
            ),
            const SizedBox(
              width: 10,
            ),
            FloatingActionButton(
              heroTag: 'Increment',
              key: const Key('Increment'),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const OtherInkWellBtnPage();
                }));
              },
              tooltip: 'Increment',
              child: const Icon(Icons.abc),
            ),
          ],
        ) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }

  void _openBezierCurve() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return MFNavigatorBar(
        onTap: (int value) {
          Fluttertoast.showToast(
              msg: "This is Center Short Toast $value",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
        },
      );
    }));
  }
}
