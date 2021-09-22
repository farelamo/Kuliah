import 'package:flutter/material.dart';
void main() => runApp(MyApp());
class MyApp extends StatefulWidget {
 MyApp({Key? key}) : super(key: key);
 @override
 _MyAppState createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
 final _formkey = GlobalKey<FormState>();
 TextEditingController _controller = TextEditingController();
 @override
 Widget build(BuildContext context) {
 return MaterialApp(
 home: Scaffold(
 appBar: AppBar(
 title: Text("Latihan Input Data"),
 ),
 body: Center(
 child: Column(
 children: <Widget>[
 Padding(padding: EdgeInsets.only(top: 200)),
 TextFormField(
 controller: _controller,
 autovalidateMode: AutovalidateMode.onUserInteraction,
 validator: (value) {
 if (value!.isEmpty) {
 return 'Tolong Isi!';
 }
 return null;
 },
 ),
 RaisedButton(
 child: Text('Submit'),
 onPressed: () {
 if (_formkey.currentState!.validate()) {
 print('berhasil');
 } else {
 print('Gagal');
 }
 },
 ),
 ],
 )),
 ),
 );
 }
}
