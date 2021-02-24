
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardPost extends StatelessWidget{


  String imagePost;
  String titlePost;
  String textPost;
  final VoidCallback onPressed;


  CardPost({Key key,
    @ required this.imagePost,
    @ required this.titlePost,
    @ required this.textPost,
    @ required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidht = MediaQuery.of(context).size.width;
    // TODO: implement build

    return InkWell(
      onTap: onPressed,
      child: Container(
        child: Container(
          margin: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(titlePost,style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),),
              Padding(padding: EdgeInsets.all(15)),
              Container(
                height: screenWidht-100,
                width: screenWidht-100,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(imagePost),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(10.0)
                ),
              ),
              Padding(padding: EdgeInsets.all(6)),
              Text(textPost,style: TextStyle(fontSize: 20,),),
              Padding(padding: EdgeInsets.all(6)),
              Text('Presiona para leer más o comentar...',style: TextStyle(fontSize: 13,),),
              Padding(padding: EdgeInsets.all(6)),
            ],
          ),
        ),
        width: screenWidht-30,
        decoration: BoxDecoration(
          //color: Color(0xFFD8D3C6),
          color: Color(0xFFE8E3D8),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        margin: EdgeInsets.all(10),
        //padding: EdgeInsets.only(top: 10),
        alignment: Alignment.center,
      ),
    );

  }
}