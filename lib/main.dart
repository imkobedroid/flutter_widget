//GlobalKey的使用

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(key: key, title: 'Flutter Demo Home Page'),
    );
  }
}

class SwitcherWidget extends StatefulWidget {
  SwitcherWidget({Key key, this.title}) : super(key: key);
  final String title;

  @override
  SwitcherWidgetState createState() => SwitcherWidgetState();
}

class SwitcherWidgetState extends State<SwitcherWidget> {
  bool isActive = false;

  changeState() {
    isActive = !isActive;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Switch.adaptive(
          value: isActive,
          onChanged: (isChange) {
            isActive = isChange;
            setState(() {});
          },
          activeColor: Colors.blue,
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class MyHomePage extends StatefulWidget {
  String title;

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  _SwitcherWidgetState createState() => _SwitcherWidgetState();
}

class _SwitcherWidgetState extends State<MyHomePage> {
  final GlobalKey<SwitcherWidgetState> key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SwitcherWidget(
        key: key,
        title: "这是一个选择器",
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          key.currentState.changeState();
        },
        child: Text(
          '切换',
          style: TextStyle(color: Colors.red),
        ),
      ),
    );
  }
}
