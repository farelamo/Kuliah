import 'package:flutter/material.dart';
void main() => runApp(MyApp());
class MyApp extends StatefulWidget {
 MyApp({Key? key}) : super(key: key);
 @override
 _MyAppState createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
 @override
 Widget build(BuildContext context) {
 return MaterialApp(
 home: Scaffold(
 appBar: AppBar(
 title: Text("Latihan Wrap"),
 ),
 body: Container(
 child: Wrap(
 spacing: 10,
 runSpacing: 5,
 crossAxisAlignment: WrapCrossAlignment.start,
 alignment: WrapAlignment.end,
 direction: Axis.horizontal,
 children: [
 Container(
 width: 100,
 height: 100,
 color: Colors.red,
 ),
 Container(
 width: 100,
 height: 100,
 color: Colors.red,
 ),
 Container(
 width: 100,
 height: 100,
 color: Colors.red,
 ),
 Container(
 width: 100,
 height: 100,
 color: Colors.red,
 ),
 Container(
 width: 100,
 height: 100,
 color: Colors.red,
 ),
 Container(
 width: 100,
 height: 100,
 color: Colors.red,
 ),
 Container(
 width: 100,
 height: 100,
 color: Colors.red,
 ),
 Container(
 width: 100,
 height: 100,
 color: Colors.red,
 ),
 Container(
 width: 100,
 height: 100,
 color: Colors.red,
 ),
 Container(
 width: 100,
 height: 100,
 color: Colors.red,
 ),
 Container(
 width: 100,
 height: 100,
 color: Colors.red,
 ),
 Container(
 width: 100,
 height: 100,
 color: Colors.red,
 ),
 Container(
 width: 100,
 height: 100,
 color: Colors.red,
 ),
 Container(
 width: 100,
 height: 100,
 color: Colors.red,
 ),
 ],
 ),
 ),
 ),
 );
 }
}