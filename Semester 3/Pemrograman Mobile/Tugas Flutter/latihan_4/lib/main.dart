import 'package:flutter/material.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Aplikasi Gojek'),
          backgroundColor: Colors.green,
        ),
        body: Center(
          child: Container(
            color: Colors.green,
            width: 100,
            height: 100,
            child: Text(
              'Latihan Flutter Text Widget',
              style: TextStyle(
                color: Colors.lightGreenAccent,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w700,
                fontSize: 20,
                )
            ),
          ),
        ),
      ),
    );
  }
}