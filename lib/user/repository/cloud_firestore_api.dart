

import 'package:blogonoff/blog/model/comentario.dart';
import 'package:blogonoff/blog/model/post.dart';
import 'package:blogonoff/user/model/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CloudFirestoreAPIUser{

  //creamos el nombre de las collections de la base de datos
  final String USERS = "users";
  final String POSTS = "posts";
  final String COMENTARIOS = "comentarios";


  //creamos el tipo de firestore llamado _db y luego instanciamos

  final Firestore _db = Firestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;


  void updateUser(User user) async{
    DocumentReference reference = _db.collection(USERS).document(user.uid);
    return await reference.setData({
      'uid': user.uid,
      'name': user.name,
      'email':user.email,
      'lastSignIn':DateTime.now()
    },merge: true);
  }

  void updateComentario(Comentario comentario) async{
    DocumentReference reference = _db.collection(COMENTARIOS).document(comentario.time);
    return await reference.setData({
      'name': comentario.name,
      'text': comentario.text,
      'time': comentario.time,
      'title': comentario.title
    });
  }


  List<Post> buildPost(List<DocumentSnapshot> postListSnapshot){
    List<Post> posts = List<Post>();
    postListSnapshot.forEach((p) {
      Post post = Post(
          title: p.data['title'],
          text: p.data['text'],
          busqueda: p.data['busqueda'],
          information: p.data['information'],
          image: p.data['image']);
      posts.add(post);
    });
    return posts;
  }

  List<Comentario> buildComentario(List<DocumentSnapshot> comentarioListSnapshot){
    List<Comentario> comentarios = List<Comentario>();
    comentarioListSnapshot.forEach((p) {
      Comentario comentario = Comentario(
          title: p.data['title'],
          text: p.data['text'],
          time: p.data['time'],
          name: p.data['name']);
      comentarios.add(comentario);
    });
    return comentarios;
  }


}