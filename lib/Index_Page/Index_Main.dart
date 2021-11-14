import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../homePage.dart';
import 'Index_Body.dart';

void main() {
  runApp(Index_Main());
}
class Index_Main extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}
goBackToPreviousScreen(BuildContext context) {
  Navigator.pop(context);
}

class _MyAppState extends State<Index_Main> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Index_Body(),
      debugShowCheckedModeBanner: false,
      title: 'title.en',
      theme: ThemeData(

        primarySwatch: Colors.deepPurple,
      ),

      //home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}