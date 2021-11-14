import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'LanguageProvider.dart';
import 'models/HttpService.dart';
import 'models/Post.dart';

class WorkStatePage extends StatelessWidget {

  final HttpService httpService = HttpService();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text( LanguageProvider.getTexts('workingstate').toString()),
      ),
      body: FutureBuilder(
        future: httpService.getPosts(),
        builder: (BuildContext context, AsyncSnapshot<List<Post>> snapshot) {
          if (snapshot.hasData) {
            List<Post>? posts = snapshot.data;
            return ListView(
              children: posts!
                  .map(
                    (Post post) => ListTile(

                        leading : Container(
                        color: getColor(post.id),
    margin: const EdgeInsets.only(left:5.0,right:5.0,top: 20.0,bottom: 0.0),
                  width: 300,
                  height: 35,
                  child: Row(
                    children: <Widget>[
                      Container(
                        width:50,
                        height: 50,
                        /*color: Colors.green,*/
                        child: Center(
                          child: Text(
                            post.count.toString(),
                            textAlign: TextAlign.right,
                            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black,fontSize: 17),
                          ),),),
                      Expanded(
                        child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              post.description,
                              textDirection: TextDirection.ltr,
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,),
                            )),)
                    ],
                  )
              ),


                ),
              )
                  .toList(),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }


  Color getColor(int selector) {
    if (selector % 2 == 0) {
      return Colors.black12;
    } else {
      return Colors.white24;
    }
  }
}

