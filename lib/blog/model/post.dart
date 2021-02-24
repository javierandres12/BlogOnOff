import 'package:flutter/material.dart';

class Post{
  final String title;
  final String text;
  final String image;
  final String information;
  final List busqueda;


  Post({Key key,
    @required this.title,
    @required this.text,
    @required this.image,
    @required this.busqueda,
    @required this.information
  });

}