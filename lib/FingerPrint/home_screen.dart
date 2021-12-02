/*import 'dart:html';*/

import 'package:flutter/material.dart';
import 'package:hrmsapp/FingerPrint/HomeView.dart';
import 'package:hrmsapp/FingerPrint/LocationService.dart';
import 'package:hrmsapp/FingerPrint/user_location.dart';
import 'package:hrmsapp/Index_Page/Index_Main.dart';

import 'package:provider/provider.dart';


import 'package:hrmsapp/FingerPrint/body.dart';

class HomeScreen extends StatelessWidget {
  late BuildContext mcontext;

  goBackToPreviousScreen(BuildContext context) {
    Navigator.pop(context);

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Index_Main()),);
  }

  @override
  Widget build(BuildContext context) {
    mcontext = context;
    debugShowCheckedModeBanner:false;

    return StreamProvider<UserLocation>(
        create: (context) => LocationService().locationStream,
        child: MaterialApp(title: 'Flutter Demo', home: HomeView(),
          debugShowCheckedModeBanner: false,
        ),
    );
  }


}