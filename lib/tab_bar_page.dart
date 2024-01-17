import 'package:flutter/material.dart';
import 'package:mcy_define_view/tab_bar_detail_page.dart';

import 'main.dart';

class TabBarPage extends StatefulWidget {
  const TabBarPage({super.key});

  @override
  State<TabBarPage> createState() => TabBarPageState();
}

class TabBarPageState extends State<TabBarPage> with TickerProviderStateMixin, WidgetsBindingObserver, RouteAware {
  var tabs = <int>[];
  late TabController tabController;
  var tabWidgets = <Widget>[];
  var tabBarViewWidgets = <Widget>[];
  var currentIndex = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    for (int i = 0; i < 14; i++) {
      tabs.add(i);
    }
    tabWidgets.add(_getOtherWidget());
    var list = tabs.map((e) {
      return Container(
        color: Colors.lightGreenAccent,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Text(
          '$e',
          style: const TextStyle(fontSize: 14, color: Colors.black),
        ),
      );
    }).toList();
    tabWidgets.addAll(list);
    tabBarViewWidgets.add(Container(
        alignment: Alignment.center,
        color: Colors.greenAccent,
        child: GestureDetector(
          child: Container(
            padding: const EdgeInsets.all(36),
            color: Colors.lightBlue,
            child: const Text(
              '年月指定',
              style: TextStyle(fontSize: 22),
            ),
          ),
          onTap: () {
            Future.delayed(const Duration(milliseconds: 50), () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const TabBarDetailPage(index: '年月指定');
              })).then((value) {
                print('macy777 ');
              });
            });
          },
        )));
    var list2 = tabs.map((e) {
      return Container(
          alignment: Alignment.center,
          color: Colors.greenAccent,
          child: GestureDetector(
            child: Container(
              padding: const EdgeInsets.all(36),
              color: Colors.lightBlue,
              child: Text(
                'TAB: $e',
                style: const TextStyle(fontSize: 22),
              ),
            ),
            onTap: () {
              Future.delayed(const Duration(milliseconds: 100), () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return TabBarDetailPage(index: '$e');
                }));
              });
            },
          ));
    }).toList();
    tabBarViewWidgets.addAll(list2);
    currentIndex = tabWidgets.length - 1;
    tabController = TabController(length: tabWidgets.length, vsync: this, initialIndex: currentIndex)
      ..addListener(() {
        var value = tabController.animation?.value;
        if (tabController.index.toDouble() == value) {
          currentIndex == value;
          print('macy777 ----->value:【$value】curTabIndex:【${tabController.index}】');
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: (BuildContext context, Orientation orientation) {
      print('macy777 orientation---$orientation');
      return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            MediaQuery(
                data: const MediaQueryData(),
                child: TabBar(
                  tabs: tabWidgets,
                  controller: tabController,
                  isScrollable: true,
                  physics: const BouncingScrollPhysics(),
                  indicatorWeight: 5.0,
                  onTap: (index) {
                    currentIndex = index;
                    print('macy777 ---onTap---$currentIndex');
                  },
                )),
            Expanded(
              child: TabBarView(
                controller: tabController,
                children: tabBarViewWidgets,
              ),
            )
          ],
        ),
      );
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    switch (state) {
      case AppLifecycleState.resumed:
        // 应用程序进入前台，页面显示
        print('macy777 Page Resumed - Visible');
        break;
      case AppLifecycleState.inactive:
        // 应用程序进入非活动状态
        print('macy777 Page Inactive - Not Visible');
        break;
      case AppLifecycleState.paused:
        // 应用程序进入后台，页面不可见
        print('macy777 Page Paused - Not Visible');
        break;
      case AppLifecycleState.detached:
        // 应用程序终止
        print('macy777 Page Detached');
        break;
    }
  }

  Widget _getOtherWidget() {
    return Container(
      width: 106,
      alignment: Alignment.center,
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            '年月指定',
            style: TextStyle(fontSize: 13, color: Colors.black),
          ),
        ],
      ),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // 添加监听订阅
    MyApp.routeObserver.subscribe(this, ModalRoute.of(context) as PageRoute<dynamic>);
  }

  @override
  void didPush() {
    super.didPush();
    // push进入当前页面时走这里
    print('macy777 生命周期监听 didPush');
  }

  @override
  void didPushNext() {
    super.didPushNext();
    // 当前页面push到其他页面走这里
    print('macy777 生命周期监听 didPushNext');
  }

  @override
  void didPop() {
    super.didPop();
    // pop出当前页面时走这里
    print('macy777 生命周期监听 didPop');
  }

  @override
  void didPopNext() {
    super.didPopNext();
    // 从其他页面pop回当前页面走这里
    print('macy777 生命周期监听 didPopNext');
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
    // 移除监听订阅
    MyApp.routeObserver.unsubscribe(this);
  }
}
