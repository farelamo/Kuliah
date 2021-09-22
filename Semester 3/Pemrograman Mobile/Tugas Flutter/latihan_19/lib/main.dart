import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:async';

void main() {
  runApp(MyApp());
}

//void main() => runApp(MyApp());
class MyApp extends StatefulWidget {
  @override
  _MyState createState() {
    return _MyState();
  }
}

class _MyState extends State<MyApp> {
  bool _value = false;
  double val = 1;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.green,
              title: Text("Flutter Slider"),
            ),
            body: Container(
                height: 100,
                child: Slider(
                  value: val,
                  onChanged: (value) {
                    setState(() {
                      val = value;
                    });
                  },
                ))));
  }
}
