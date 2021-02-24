import 'package:flutter/material.dart';

class Comentario{

  final String title;
  final String text;
  final String name;
  final String time;


  Comentario({Key key,
    @required this.title,
    @required this.text,
    @required this.name,
    @required this.time
  });

}