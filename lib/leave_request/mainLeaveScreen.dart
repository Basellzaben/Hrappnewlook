import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hrmsapp/Index_Page/Index_Main.dart';

import '../homePage.dart';
import 'body_Leave_Screen.dart';

void main() {
  runApp(mainLeaveScreen());
}
class mainLeaveScreen extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}
goBackToPreviousScreen(BuildContext context) {
//  Navigator.pop(context);


  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Index_Main()),);
}

class _MyAppState extends State<mainLeaveScreen> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: body_LeaveScreen(),
      debugShowCheckedModeBanner: false,
      title: 'title.en',
      theme: ThemeData(

        primarySwatch: Colors.deepPurple,
      ),




      //home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
