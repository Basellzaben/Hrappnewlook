
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hrmsapp/ElseRequests/MainElseRequest.dart';
import 'package:hrmsapp/FingerPrint/fingerprintPage.dart';
import 'package:hrmsapp/GlobalVar/Globalvireables.dart';
import 'package:hrmsapp/Requestcertificate/MainCertificationRequest.dart';
import 'package:hrmsapp/leave_request/mainLeaveScreen.dart';
import 'package:hrmsapp/models/Personalinfo.dart';
import 'package:hrmsapp/vacation_request/mainVacationScreen.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../LanguageProvider.dart';
import '../LanguageProvider.dart';
import '../LanguageProvider.dart';
import '../ProfilePage.dart';
import '../WorkStatePage.dart';
import '../homePage.dart';
import '../main.dart';

class Index_Body extends StatefulWidget {
/*  goBackToPreviousScreen(BuildContext context){
    // Navigator.pop(context);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => homePage()),);
  }*/
  @override
  _Index_Body createState() => _Index_Body();
}
var username;

goBackToPreviousScreen(BuildContext context) {
  Navigator.pop(context);
}
getuserdata()async{
  SharedPreferences prefer;

  prefer = await SharedPreferences.getInstance();

  var userid = prefer.getString('usenameinfo');

  return userid;
}

Future<Personalinfo> getUser() async {
  Uri apiUrl = Uri.parse(Globalvireable.personalinfoapi+Globalvireable.id);


  http.Response response = await http.get(apiUrl);

  var jsonResponse = jsonDecode(response.body);

  // var parsedJson = json.decode(jsonResponse);
  username = Personalinfo.fromJson(jsonResponse);
  return username;


}
class _Index_Body extends State<Index_Body> {

  @override
  Widget build(BuildContext context) {
    goBackToPreviousScreen(BuildContext context) {
      Navigator.pop(context);
    }void logddout() async{
      SharedPreferences  prefer = await SharedPreferences.getInstance() ;
      prefer.setString('LOGIN',"0");
    }
    Future<bool> _onWillPop() async {

      // This dialog will exit your app on saying yes
      return (await showDialog(
        context: context,
        builder: (context) => new AlertDialog(
          title: new Text(LanguageProvider.getTexts('leave').toString()),
          content: new Text(LanguageProvider.getTexts('leaveconfirm').toString()),
          actions: <Widget>[
            new FlatButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: new Text(LanguageProvider.getTexts('cancel').toString()),
            ),
            new FlatButton(
             // onPressed: () =>Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage(title: '', ))),
              onPressed: (){/*Navigator.of(context).pop(true);

              Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage(title: '', )))
              */

                Navigator.pop(context);
                Navigator.pop(context);

              },
              child: new Text(LanguageProvider.getTexts('Yes').toString()),

            ),
          ],
        ),
      )) ??
          false;
    }
    Future<bool> _onWillPopLogout() async {

      // This dialog will exit your app on saying yes
      return (await showDialog(
        context: context,
        builder: (context) => new AlertDialog(
          title: new Text(LanguageProvider.getTexts('leave').toString()),
          content: new Text(LanguageProvider.getTexts('leaveconfirm').toString()),
          actions: <Widget>[

            new TextButton(
              onPressed: () {Navigator.of(context).pop(false);},
              style: TextButton.styleFrom(
                primary: Colors.white10,
              ),
              child: Text(LanguageProvider.getTexts('cancel').toString()),
            ),
            /*new FlatButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: new Text(LanguageProvider.getTexts('cancel').toString()),
            ),*/
            new TextButton(
              onPressed: () {Navigator.of(context).pop(true);},
              style: TextButton.styleFrom(
                primary: Colors.white10,
              ),
              child: Text(LanguageProvider.getTexts('Yes').toString()),
            ),
            /*new FlatButton(
              // onPressed: () =>Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage(title: '', ))),

              onPressed: () =>  Navigator.of(context).pop(true),
              child: new Text(LanguageProvider.getTexts('Yes').toString()),

            ),*/
          ],
        ),
      )) ??
          false;
    }
    getlanstring();
    return WillPopScope(
        onWillPop: _onWillPop,

      child: Scaffold(

        appBar: AppBar(
          title: Center(child: new Text(LanguageProvider.getTexts('HOME',).toString(), textDirection: LanguageProvider.getDirection(),)),
          actions: [


          ],
        ),
        body:Directionality(
        textDirection: LanguageProvider.getDirection(),
    child: SingleChildScrollView(

    //   padding: EdgeInsets.all(30.0),
      child: FutureBuilder<Personalinfo>(
        future: getUser(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var data = snapshot.data;
                Globalvireable.name=data!.EmployeeDisplayName;
                Globalvireable.email=data.Email;
      return Container(

        child: Column(
        //crossAxisAlignment: CrossAxisAlignment.baseline,
        children: <Widget>[
        new GestureDetector(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ProfilePage()));

            },child: Container(
          margin: EdgeInsets.only(top: 10),
              child: Card(
        shape: RoundedRectangleBorder(

              borderRadius: BorderRadius.circular(15)),
                child: Container(
                alignment: Alignment.topRight,
                padding: EdgeInsets.only(top: 0,bottom: 20),
                margin: EdgeInsets.only(top: 10,right: 8,left: 8),
                child: Row(
         children: <Widget>[

                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Image.asset(
                    'assest/profile.png',
                      height: 30,
                     width: 30,
                  ),


                ),
           Container(
                 margin: EdgeInsets.only(right: 5,left: 5,top: 15),
                 child: Text(data.EmployeeDisplayName,style: TextStyle(color: Colors.black,fontSize: 15),),
                        )


         ]),
          ),
              ),
            )),



      horzintalScrolView(context),

          GridViewView(context),
         /* Container(
            alignment: LanguageProvider.Align(),

            margin: EdgeInsets.only(right: 5,left: 5),
            child: Text(LanguageProvider.getTexts('notifications').toString(), textDirection: LanguageProvider.getDirection(),style: TextStyle( color: Colors.black,fontWeight: FontWeight.bold,fontSize: 22,),),

          )*/

         verticallistviewView(context),



          Center(
            child: ListTile(
              leading: Icon(Icons.language,
                  textDirection: LanguageProvider.getDirection()),
              title: Text(Globalvireable.languageName
                  , textDirection: LanguageProvider.getDirection()),

              onTap: () {

                if(Globalvireable.languageCode=="en")
                  Globalvireable.languageCode="ar";
                else
                  Globalvireable.languageCode="en";

                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MyHomePage(title: '',)));


              },
            ),

          ),

          Center(
            child: ListTile(
              leading: Icon(Icons.logout,
                  textDirection: LanguageProvider.getDirection()),
              title: Text(LanguageProvider.getTexts('Logout').toString()
                  , textDirection: LanguageProvider.getDirection()),

              onTap: () {

              /*  SharedPreferences  prefer = await SharedPreferences.getInstance() ;
                prefer.setString('LOGIN',"0");*/
                logddout();
              //  Navigator.pop(context);
            //   _onWillPop();
               // Navigator.pop(context);
               // Navigator.pop(context);
               // Navigator.pop(context);
            //  Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SplashScreenPage()));

              },
            ),

          ),



        ]),
      );
  } else {
  return Center(child: CircularProgressIndicator());
  }
})))));



  }


  Widget verticallistviewView(BuildContext context){
    return Container(
        margin: EdgeInsets.only(top: 1),
    child: SizedBox(
    width: 400,
    child: ListView(
    scrollDirection: Axis.vertical,
        shrinkWrap: true,
    children: <Widget>[


      Container(
        margin: EdgeInsets.all( 5),
        width: 300,
        height: 70,

        child: Card(

          child: Container(

            width: 160.0,
            child: Row(

                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //crossAxisAlignment: CrossAxisAlignment.baseline,
                children: <Widget>[


                  Container(
                    // margin: const EdgeInsets.only(top: 40.0),
                    alignment: Alignment.topRight,

                    //   height: 50,
                    child: Container(margin:EdgeInsets.only(left: 10,right: 10),alignment:Alignment.center,child: Text(LanguageProvider.getTexts('Messages').toString(),style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),))
                    ,
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    margin: const EdgeInsets.only(right: 10.0,left: 10),

                    height: 30,
                    width: 30,
                    child: Image.asset(
                      'assest/message.png',
                      //  height: 200,
                      // width: 200,
                    ),
                  ),


                ]),
/*
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.baseline,
                children: <Widget>[

                  *//* Center(
                    child: Container(

                      margin: EdgeInsets.only(top: 25),

                      child: Image.asset(
                        'assest/profile.png',
                        height: 50,
                        width: 50,
                      ),
                    ),
                  ),*//*

                  Center(child: Container(margin:EdgeInsets.only(top: 15),alignment:Alignment.bottomCenter,child: Text("التنبيهات",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),)))

                ]),*/

          ),
        ),
      ),




      Container(
        margin: EdgeInsets.all( 5),

        width: double.infinity,
        height: 70,

        child: Card(

          child: Container(

            width: 160.0,
            child: Row(

                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //crossAxisAlignment: CrossAxisAlignment.baseline,
                children: <Widget>[


                 Container(
                   // margin: const EdgeInsets.only(top: 40.0),
                    alignment: Alignment.topRight,

                 //   height: 50,
                      child: Container(margin:EdgeInsets.only(left: 10,right: 10),alignment:Alignment.center,child: Text(LanguageProvider.getTexts('notifications').toString(),style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),))
,
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    margin: const EdgeInsets.only(right: 10.0,left: 10),



                    height: 30,
                    width: 30,
                    child: Image.asset(
                      'assest/nnotification.png',
                      //  height: 200,
                      // width: 200,
                    ),
                  ),


                ]),
/*
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.baseline,
                children: <Widget>[

                  *//* Center(
                    child: Container(

                      margin: EdgeInsets.only(top: 25),

                      child: Image.asset(
                        'assest/profile.png',
                        height: 50,
                        width: 50,
                      ),
                    ),
                  ),*//*

                  Center(child: Container(margin:EdgeInsets.only(top: 15),alignment:Alignment.bottomCenter,child: Text("التنبيهات",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),)))

                ]),*/

          ),
        ),
      ),




    ])));}


Widget horzintalScrolView(BuildContext context){
  return Container(
    margin: EdgeInsets.only(top: 20),
    child: SizedBox(
      height: 160.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[

          new GestureDetector(
              onTap: (){

            //    Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => mainLeaveScreen()),
                );
              },

          child: Card(
            color: hexToColor("#00796b"),//Colors.red,
            margin: EdgeInsets.all( 5),
            child: Container(

              height: 300,
              width: 150,
              child: Card(
             //   color: Colors.green,
                child: Container(
                  width: 160.0,
                    color: hexToColor("#00796b"),//Colors.red,

                  child: Column(
                    //crossAxisAlignment: CrossAxisAlignment.baseline,
                      children: <Widget>[

                        Center(
                          child: Container(

                            margin: EdgeInsets.only(top: 25),

                            child: Image.asset(
                              'assest/leaveicon.png',
                              height: 50,
                              width: 50,
                            ),
                          ),
                        ),

                        Container(margin:EdgeInsets.only(top: 30),alignment:Alignment.bottomCenter,child: Text(LanguageProvider.getTexts('leaverequest').toString(),style: TextStyle(color: Colors.white)))

                      ]),

                ),
              ),
            ),
          )),

          new GestureDetector(
              onTap: (){

             //   Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => mainVacationScreen()),
                );
              },
              child: Card(
                color: hexToColor("#0277bd"),//Colors.red,

                margin: EdgeInsets.all( 5),
                child: Container(


            height: 300,
            width: 150,

            child: Card(


                child: Container(

                  width: 160.0,
                  color: hexToColor("#0277bd"),//Colors.red,


                  child: Column(
                    //crossAxisAlignment: CrossAxisAlignment.baseline,
                      children: <Widget>[

                        Center(
                          child: Container(

                            margin: EdgeInsets.only(top: 25),

                            child: Image.asset(
                              'assest/vactionicon.png',
                              height: 50,
                              width: 50,
                            ),
                          ),
                        ),

                        Container(margin:EdgeInsets.only(top: 30),alignment:Alignment.bottomCenter,child: Text(LanguageProvider.getTexts('vacationrequest').toString(),style: TextStyle(color: Colors.white)))

                      ]),

                ),
            ),
          ),
              )),

          new GestureDetector(
              onTap: (){

               // Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MainCertificationRequest()),
                );
              },
          child: Card(
            margin: EdgeInsets.all( 5),
            color: hexToColor("#f57c00"),//Colors.red,

            child: Container(


              height: 300,
              width: 150,

              child: Card(


                child: Container(

                  width: 160.0,
                  color: hexToColor("#f57c00"),//Colors.red,


                  child: Column(
                    //crossAxisAlignment: CrossAxisAlignment.baseline,
                      children: <Widget>[

                        Center(
                          child: Container(

                            margin: EdgeInsets.only(top: 25),

                            child: Image.asset(
                              'assest/certificate.png',
                              height: 50,
                              width: 50,
                            ),
                          ),
                        ),

                        Container(margin:EdgeInsets.only(top: 30),alignment:Alignment.bottomCenter,child: Text(LanguageProvider.getTexts('Requestcertificate').toString(),style: TextStyle(color: Colors.white)))

                      ]),

                ),
              ),
            ),
          )),


          new GestureDetector(
              onTap: (){

                // Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
          builder: (context) => MainElseRequest()),
                );
              },
          child: Card(
            margin: EdgeInsets.all( 5),
            color: hexToColor("#039be5"),//Colors.red,
            child: Container(

              height: 300,
              width: 150,

              child: Card(


                child: Container(

                  width: 160.0,
                  color: hexToColor("#039be5"),//Colors.red,


                  child: Column(
                    //crossAxisAlignment: CrossAxisAlignment.baseline,
                      children: <Widget>[

                        Center(
                          child: Container(

                            margin: EdgeInsets.only(top: 25),

                            child: Image.asset(
                              'assest/othericon.png',
                              height: 50,
                              width: 50,
                            ),
                          ),
                        ),

                        Container(margin:EdgeInsets.only(top: 30),alignment:Alignment.bottomCenter,child: Text(LanguageProvider.getTexts('otherrequests').toString(),style: TextStyle(color: Colors.white)))

                      ]),

                ),
              ),
                ),
          )),
   /*       Container(
            margin: EdgeInsets.all( 5),

            height: 300,
            width: 150,

            child: Card(


              child: Container(

                width: 160.0,
                color: hexToColor("#ef5350"),//Colors.red,


                child: Column(
                  //crossAxisAlignment: CrossAxisAlignment.baseline,
                    children: <Widget>[

                      Center(
                        child: Container(

                          margin: EdgeInsets.only(top: 25),

                          child: Image.asset(
                            'assest/fingerprinticon.png',
                            height: 60,
                            width: 60,
                          ),
                        ),
                      ),

                      Container(margin:EdgeInsets.only(top: 30),alignment:Alignment.bottomCenter,child: Text("البصمة",style: TextStyle(color: Colors.white),))

                    ]),

              ),
            ),
          ),
*/

        ],
      ),
    ),
  );
}

  Widget GridViewView(BuildContext context){

 return Center(
   child: Container(
     margin: EdgeInsets.all(5),

     child: Center(
       child: Column(
         //crossAxisAlignment: CrossAxisAlignment.baseline,
         children: <Widget>[
           Container(
             margin: EdgeInsets.all(10),
             child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,

                 children: <Widget>[
             new GestureDetector(
             onTap: (){

      Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ProfilePage()));

     },   child: Card(
                     child: Container(
                       height: 80,
                       width: 100,

                       child: Column(
                         //crossAxisAlignment: CrossAxisAlignment.baseline,
                           children: <Widget>[

                             //  Container(margin:EdgeInsets.only(top: 20),alignment:Alignment.bottomCenter,child: Text("التاخير الصباحي"))
                             Center(
                               child: Container(

                                 margin: EdgeInsets.only(top: 10),

                                 child: Image.asset(
                                   'assest/profile.png',
                                   height: 30,
                                   width: 30,
                                 ),
                               ),
                             ),

                             Container(margin:EdgeInsets.only(top: 2),alignment:Alignment.bottomCenter,child: Text(LanguageProvider.getTexts('profile').toString(),style: TextStyle(fontSize: 15),))

                           ]),

                     ),
                   )),
       new GestureDetector(
       onTap: (){

             Navigator.push(
             context,
             MaterialPageRoute(
             builder: (context) => fingerprintPage())
             );

                  }, child: Card(
                     child: Container(
                       height: 80,
                       width: 100,

                       child: Column(
                         //crossAxisAlignment: CrossAxisAlignment.baseline,
                           children: <Widget>[

                             //  Container(margin:EdgeInsets.only(top: 20),alignment:Alignment.bottomCenter,child: Text("التاخير الصباحي"))
                             Center(
                               child: Container(

                                 margin: EdgeInsets.only(top: 10),

                                 child: Image.asset(
                                   'assest/fingerprinticon.png',
                                   height: 30,
                                   width: 30,
                                 ),
                               ),
                             ),

                             Container(margin:EdgeInsets.only(top: 2),alignment:Alignment.bottomCenter,child: Text(LanguageProvider.getTexts('timeimprint').toString(),style: TextStyle(fontSize: 15),))

                           ]),

                     ),
                   )),
     new GestureDetector(
                   onTap: () {
                     Navigator.push(
                       context,
                       MaterialPageRoute(builder: (context) => WorkStatePage()),
                     );
                   },
                     child: Card(
                       child: Container(
                         height: 80,
                         width: 100,

                         child: Column(
                           //crossAxisAlignment: CrossAxisAlignment.baseline,
                             children: <Widget>[

                               //  Container(margin:EdgeInsets.only(top: 20),alignment:Alignment.bottomCenter,child: Text("التاخير الصباحي"))
                               Center(
                                 child: Container(

                                   margin: EdgeInsets.only(top: 10),

                                   child: Image.asset(
                                     'assest/hat.png',
                                     height: 30,
                                     width: 30,
                                   ),
                                 ),
                               ),

                               Container(margin:EdgeInsets.only(top: 2),alignment:Alignment.bottomCenter,child: Text(LanguageProvider.getTexts('workingstate').toString(),style: TextStyle(fontSize: 15),))

                             ]),

                       ),
                     ),
                   ),
                 ]),


           ),
           Container(
             margin: EdgeInsets.all(10),
             child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,

                 children: <Widget>[
                   Card(
                     child: Container(
                       height: 80,
                       width: 100,

                       child: Column(
                         //crossAxisAlignment: CrossAxisAlignment.baseline,
                           children: <Widget>[

                             //  Container(margin:EdgeInsets.only(top: 20),alignment:Alignment.bottomCenter,child: Text("التاخير الصباحي"))
                             Center(
                               child: Container(

                                 margin: EdgeInsets.only(top: 10),

                                 child: Image.asset(
                                   'assest/hat.png',
                                   height: 30,
                                   width: 30,
                                 ),
                               ),
                             ),

                             Container(margin:EdgeInsets.only(top: 2),alignment:Alignment.bottomCenter,child: Text(LanguageProvider.getTexts('Task').toString(),style: TextStyle(fontSize: 15),))

                           ]),

                     ),
                   ),

                    Card(
                      child: Container(
                       height: 80,
                       width: 100,

                       child: Column(
                         //crossAxisAlignment: CrossAxisAlignment.baseline,
                           children: <Widget>[

                             //  Container(margin:EdgeInsets.only(top: 20),alignment:Alignment.bottomCenter,child: Text("التاخير الصباحي"))
                             Center(
                               child: Container(

                                 margin: EdgeInsets.only(top: 10),

                                 child: Image.asset(
                                   'assest/gidlogo.png',
                                   height: 30,
                                   width: 30,
                                 ),
                               ),
                             ),

                             Container(margin:EdgeInsets.only(top: 2),alignment:Alignment.bottomCenter,child: Text(LanguageProvider.getTexts('Myrequests').toString(),style: TextStyle(fontSize: 15),))

                           ]),

                   ),
                    ),


                   Card(
                     child: Container(
                       height: 80,
                       width: 100,

                       child: Column(
                         //crossAxisAlignment: CrossAxisAlignment.baseline,
                           children: <Widget>[

                             //  Container(margin:EdgeInsets.only(top: 20),alignment:Alignment.bottomCenter,child: Text("التاخير الصباحي"))
                             Center(
                               child: Container(

                                 margin: EdgeInsets.only(top: 10),

                                 child: Image.asset(
                                   'assest/datesech.png',
                                   height: 30,
                                   width: 30,
                                 ),
                               ),
                             ),

                             Container(margin:EdgeInsets.only(top: 2),alignment:Alignment.bottomCenter,child: Text(LanguageProvider.getTexts('timetable').toString(),style: TextStyle(fontSize: 15),))

                           ]),

                     ),
                   ),

                 ]),


           ),



          /* Container(
             margin: EdgeInsets.all(10),
             child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,

                 children: <Widget>[
                   Card(

                   ),

                 ]),


           ),*/

           ]),
     ),



   ),
 );}
  void showAlert(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: Text("hi"),
        ));
  }


  Color hexToColor(String code) {
    return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }

  void getlanstring(){
    if(Globalvireable.languageCode=="ar"){
      Globalvireable.languageName="English";
    }else
      {
        Globalvireable.languageName="اللغة العربية";

      }
  }

}