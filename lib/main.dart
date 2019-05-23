import 'package:flutter/material.dart';
import 'package:flutter_ge/res/color.dart';
import 'package:flutter_ge/res/routes.dart';
import 'package:flutter_ge/widget/home/HomeWidget.dart';
import 'package:flutter_ge/widget/mine/MineWidget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: colors.white_appbar,
      ),
      home: MainPage(title: 'Flutter Demo Home Page'),
      routes: Routes.getRoutes(),
    );
  }
}

class MainPage extends StatefulWidget {
  MainPage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _showWidgetIndex = 0;
  List<Widget> _list;

  void initList() {
    _list = new List();
    _list.add(HomeWidget());
    _list.add(MineWidget());
  }

  Widget _showWidget(int index) {
    setState(() {
      _showWidgetIndex = index;
    });
    return _list[index];
  }

  @override
  Widget build(BuildContext context) {
    initList();
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: _showWidget(_showWidgetIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          new BottomNavigationBarItem(
              icon: Icon(Icons.home), title: new Text("HOME")),
          new BottomNavigationBarItem(
              icon: Icon(Icons.person), title: new Text("CENTER")),
        ],
        currentIndex: _showWidgetIndex,
        fixedColor: Colors.blue,
        onTap: (index) {
          _showWidget(index);
        },
      ),
    );
  }
}
