


import 'package:blogonoff/blog/model/comentario.dart';
import 'package:blogonoff/blog/model/post.dart';
import 'package:blogonoff/user/model/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'cloud_firestore_api.dart';

class CloudFirestoreRepositoryUser{

  final _cloudFirestoreAPI = CloudFirestoreAPIUser();


  void updateUser(User user)=>_cloudFirestoreAPI.updateUser(user);

  void updateComentario(Comentario comentario)=>_cloudFirestoreAPI.updateComentario(comentario);

  List<Post> buildPost(List<DocumentSnapshot> postListSnapshot)=>
      _cloudFirestoreAPI.buildPost(postListSnapshot);

  List<Comentario> buildComentario(List<DocumentSnapshot> comentarioListSnapshot)=>
      _cloudFirestoreAPI.buildComentario(comentarioListSnapshot);

}