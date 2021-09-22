import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material Chips',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: ChipsDemo(),
      // MyHomePage(title: 'Flutter Api Call'),
    );
  }
}

class ChipsDemo extends StatefulWidget {
  const ChipsDemo({Key? key}) : super(key: key);
  @override
  _ChipsDemoState createState() => _ChipsDemoState();
}

class _ChipsDemoState extends State<ChipsDemo> {
  var thumbType = ["A", "B", "ENGLISH", "C", "D ", "F ", "G ", "H ", "I"];
  List<bool> selectedList = [];
  List<String> selectedLanguage = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        title: Text("Material Chips"),
      ),
      body: Wrap(
        children: [for (int i = 0; i < thumbType.length; i++) _listItem(i)],
      ),
    );
  }

  Widget _listItem(int i) {
    selectedList.add(false);
    return Container(
      margin: EdgeInsets.only(left: 6, right: 6, top: 3, bottom: 3),
      child: FilterChip(
        label: Text(thumbType[i]),
        selected: selectedList[i],
        onSelected: (bool value) {
          setState(() {
            if (value) {
              selectedLanguage.add(thumbType[i]);
            } else {
              selectedLanguage.remove(thumbType[i]);
            }
            selectedList[i] = value;
            //get selected language
            debugPrint("selected Language : $selectedLanguage");
          });
        },
      ),
    );
  }
}
