
import 'package:blogonoff/blog/model/post.dart';
import 'package:blogonoff/blog/ui/screen/post_screen.dart';
import 'package:blogonoff/user/bloc/bloc_user.dart';
import 'package:blogonoff/user/ui/widget/card_post.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

class ListViewPosts extends StatefulWidget{


  @override
  State<StatefulWidget> createState() {
    return _ListViewPosts();
  }
}

class _ListViewPosts extends State<ListViewPosts> {
  UserBloc userBloc;

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of<UserBloc>(context);

    return StreamBuilder(
        stream: userBloc.postsStream,
        builder: (context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.active:
              return View(
                  userBloc.buildPost(snapshot.data.documents));
            case ConnectionState.done:
              return View(
                  userBloc.buildPost(snapshot.data.documents));
            case ConnectionState.waiting:
              return CircularProgressIndicator();
            case ConnectionState.none:
              return CircularProgressIndicator();
            default:
              return View(
                  userBloc.buildPost(snapshot.data.documents));
          }
        }
    );

  }
  Widget View(List<Post> posts){
    return Column(
      children: posts.map((post){
        return CardPost(
            imagePost: post.image,
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) =>
                  PostScreen(
                    imagePost: post.image,
                    information: post.information,
                    textPost: post.text,
                    titlePost: post.title,
                  )));
            },
            titlePost: post.title,
            textPost: post.information);
      }).toList(),
    );
  }

}