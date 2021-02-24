

import 'package:blogonoff/user/bloc/bloc_user.dart';
import 'package:blogonoff/user/ui/widget/button_search.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

class SearchBlog extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SearchBlog();
  }
}


class _SearchBlog extends State<SearchBlog> {
  UserBloc userBloc;
  String tituloBlog ="";
  int color1 = 0xFF2EBFF7;
  int color2 = 0xFF2EBFF7;


  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of<UserBloc>(context);
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidht = MediaQuery.of(context).size.width;

    // TODO: implement build

    return Scaffold(
      appBar:PreferredSize(
          child: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white,size: 30),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            actions: [
            ],
            title: Card(
              child: TextField(
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search), hintText: 'Buscar post...'),
                onChanged: (val) {
                  setState(() {
                    tituloBlog = val;
                  });
                },
              ),
            ),
            backgroundColor: Color(color2),
          ),
          preferredSize:  Size(screenWidht, 60)),
      body: Container(
        child: Text('hola'),
      ),
      );

  }
}



