
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardComentario extends StatelessWidget{


  String name;
  String time;
  String title;
  String text;


  CardComentario({Key key,
    @ required this.name,
    @ required this.title,
    @ required this.time,
    @ required this.text,
  });

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidht = MediaQuery.of(context).size.width;
    // TODO: implement build

    return InkWell(
      child: Container(
        child: Container(
          margin: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(time.toString(),style: TextStyle(fontSize: 15,),),
              Padding(padding: EdgeInsets.all(3)),
              Text(name,style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),),
              Padding(padding: EdgeInsets.all(3)),
              Text(text,style: TextStyle(fontSize: 15,),),
              Padding(padding: EdgeInsets.all(6)),
            ],
          ),
        ),
        width: screenWidht-30,
        decoration: BoxDecoration(
          //color: Color(0xFFD8D3C6),
          color: Colors.black26,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        margin: EdgeInsets.all(10),
        //padding: EdgeInsets.only(top: 10),
        alignment: Alignment.center,
      ),
    );

  }
}