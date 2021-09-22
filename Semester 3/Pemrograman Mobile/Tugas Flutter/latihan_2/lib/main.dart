import 'package:flutter/material.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ini Aplikasi',
      theme: ThemeData(
        primaryColor: Colors.green
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Aplikasi Gojek'),
        ),
        body: Center(
          child: Container(
            child: Text('Flutter Kedua Ku'),
          ),
        ),
      ),
    );
  }
}