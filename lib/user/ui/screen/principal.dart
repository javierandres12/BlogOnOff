


import 'package:blogonoff/blog/ui/screen/post_screen.dart';
import 'package:blogonoff/blog/ui/widget/list_view_posts.dart';
import 'package:blogonoff/user/bloc/bloc_user.dart';
import 'package:blogonoff/user/ui/screen/register_page.dart';
import 'package:blogonoff/user/ui/widget/card_post.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';


class PrincipalPage extends StatefulWidget{
  String uid;



  @override
  State<StatefulWidget> createState() {
    return _PrincipalPage();
  }
}

class _PrincipalPage extends State<PrincipalPage>{
  UserBloc userBloc;
  String tituloBlog ="";
  int color1 = 0xFF2EBFF7;
  int color2 = 0xFF2EBFF7;


  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of<UserBloc>(context);
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidht = MediaQuery.of(context).size.width;


    return Scaffold(
      appBar:PreferredSize(
          child: AppBar(
            actions: [
              IconButton(
                icon: Icon(Icons.exit_to_app, color: Colors.white,size: 30),
                onPressed: () {
                  userBloc.logOut();
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => RegisterPage() ));
                },
              ),
            ],
            title: Column(
              children: [
                Text('Blog OnOff', style: TextStyle(fontSize: 25,color: Colors.white),),
              ],
            ),
            bottom: PreferredSize(
                child: Container(
                  margin: EdgeInsets.only(left: 10,right: 10,bottom: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
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
                preferredSize:  Size(screenWidht, 10),
            ),
            backgroundColor: Color(color2),
          ),
          preferredSize:  Size(screenWidht, 100)),
      body:  StreamBuilder<QuerySnapshot>(
        stream: (tituloBlog != "" && tituloBlog != null)
            ? Firestore.instance
            .collection('posts')
            .where('busqueda',arrayContains: tituloBlog)
            .snapshots()
            :Firestore.instance.collection('posts').snapshots(),
          builder: (context, snapshot){
          return (snapshot.connectionState == ConnectionState.waiting)
              ?Center(child: CircularProgressIndicator(),)
              :ListView.builder(
              itemCount: snapshot.data.documents.length,
              itemBuilder: (context, index) {
                DocumentSnapshot data = snapshot.data.documents[index];
                return CardPost(
                    imagePost: data['image'],
                    titlePost: data['title'],
                    textPost: data['information'],
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) =>
                          PostScreen(
                            imagePost: data['image'],
                            information: data['information'],
                            textPost: data['text'],
                            titlePost: data['title'],
                          )));
                    });
              }
          );
          }
      )
    );

  }
}


