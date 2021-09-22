import 'package:flutter/material.dart';
void main() => runApp(MyApp());
class MyApp extends StatefulWidget {
 MyApp({Key? key}) : super(key: key);
 @override
 _MyAppState createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
 List<Widget> widgets = []; //buat variabel array
 int counter = 1; //inisiasi variabel counter dengan nilai 1
 @override
 Widget build(BuildContext context) {
 return MaterialApp(
 home: Scaffold(
 appBar: AppBar(
 title: Text("Latihan Listview"),
 ),
 body: ListView(
 children: <Widget>[
 Row(
 mainAxisAlignment: MainAxisAlignment.spaceAround, //rata tengah
 children: <Widget>[
 RaisedButton(
 child: Text("Tambah Data"),
 onPressed: () {
 setState(() {
 //tambah data array
 widgets.add(Text(
 "Data ke-" + counter.toString(),
 style: TextStyle(fontSize: 35),
 ));
counter++;
 });
 }),
 RaisedButton(
 child: Text("Hapus Data"),
 onPressed: () {
 setState(() {
 widgets.removeLast(); //hapus data array
 });
 }),
 ],
 ),
 Column(
 crossAxisAlignment: CrossAxisAlignment.start,
 children: widgets,
 )
 ],
 ),
 ),
 );
 }
}
