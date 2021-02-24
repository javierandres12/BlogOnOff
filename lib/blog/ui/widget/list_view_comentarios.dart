

import 'package:blogonoff/blog/model/comentario.dart';
import 'package:blogonoff/blog/model/post.dart';
import 'package:blogonoff/blog/ui/screen/post_screen.dart';
import 'package:blogonoff/user/bloc/bloc_user.dart';
import 'package:blogonoff/user/ui/widget/card_comentario.dart';
import 'package:blogonoff/user/ui/widget/card_post.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

class ListViewComentarios extends StatefulWidget{
  String title;

  ListViewComentarios({Key key,
  @required this.title
  });


  @override
  State<StatefulWidget> createState() {
    return _ListViewComentarios();
  }
}

class _ListViewComentarios extends State<ListViewComentarios> {
  UserBloc userBloc;

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of<UserBloc>(context);

    return StreamBuilder(
        stream: userBloc.myComentario(widget.title),
        builder: (context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.active:
              return View(
                  userBloc.buildComentario(snapshot.data.documents));
            case ConnectionState.done:
              return View(
                  userBloc.buildComentario(snapshot.data.documents));
            case ConnectionState.waiting:
              return CircularProgressIndicator();
            case ConnectionState.none:
              return CircularProgressIndicator();
            default:
              return View(
                  userBloc.buildComentario(snapshot.data.documents));
          }
        }
    );

  }
  Widget View(List<Comentario> comentarios){
    return Column(
      children: comentarios.map((comentario){
        return CardComentario(
            name: comentario.name,
            time: comentario.time,
            title: comentario.title,
            text: comentario.text);
      }).toList(),
    );
  }

}

/*Container(
                child: Container(
                  margin: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(widget.titlePost,style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),),
                      Padding(padding: EdgeInsets.all(15)),
                      Container(
                        height: screenWidht-100,
                        width: screenWidht-100,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(widget.imagePost),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(10.0)
                        ),
                      ),
                      Padding(padding: EdgeInsets.all(6)),
                      Text(widget.information,style: TextStyle(fontSize: 20,),),
                      Padding(padding: EdgeInsets.all(10)),
                      Text(widget.textPost,style: TextStyle(fontSize: 20,),),
                      Padding(padding: EdgeInsets.all(6)),
                    ],
                  ),
                ),
                width: screenWidht-30,
                decoration: BoxDecoration(
                  //color: Color(0xFFD8D3C6),
                  color: Colors.white12,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                margin: EdgeInsets.all(10),
                //padding: EdgeInsets.only(top: 10),
                alignment: Alignment.center,
              )*/