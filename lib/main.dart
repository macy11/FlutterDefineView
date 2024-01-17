import 'package:flutter/material.dart';
import 'package:mcy_define_view/ripple/dataTable_page.dart';
import 'package:mcy_define_view/ripple/navigator_rail_page.dart';
import 'package:mcy_define_view/tab_bar_page.dart';
import 'mf_navigator_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  // 用于路由返回监听
  static final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();
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
  void _openBezierCurve() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const MFNavigatorBar()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
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
                    return const NavigatorRailPage();
                  }));
                },
                child: Container(
                  alignment: Alignment.center,
                  width: 200,
                  height: 100,
                  child: const Text('NavigatorRailPage'),
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
                  child: Container(
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
                  splashColor: Colors.blueAccent,
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
                      onTap: () {},
                      child: Container(
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
                      onTap: () {},
                      child: Container(
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
                      onTap: () {},
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
                      splashColor: Colors.blueAccent,
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
                    child: Container(
                      alignment: Alignment.center,
                      width: 200,
                      height: 100.0,
                      child: const Text("Material\nInk\nInkWell"),
                    ),
                    splashColor: Colors.red,
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
                  child: Container(
                    alignment: Alignment.center,
                    width: 200,
                    height: 100.0,
                    child: const Text("Material\nInk\nInkWell"),
                  ),
                  splashColor: Colors.black45,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  alignment: Alignment.center,
                  child: Ink.image(
                    width: 343,
                    height: 175,
                    image: AssetImage("assets/images/bg_card_tt.png"),
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
                  image: AssetImage("assets/images/bg_card_tt.png"),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Material(
                clipBehavior: Clip.hardEdge,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                  side: BorderSide(
                    color: Colors.red,
                    width: 3,
                  ),
                ),
                child: InkWell(
                  splashColor: Colors.red,
                  onTap: () {},
                  child: Ink(
                    decoration: BoxDecoration(
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
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _openBezierCurve,
        tooltip: 'Increment',
        child: const Icon(Icons.abc_sharp),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
