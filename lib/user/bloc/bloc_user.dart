


import 'package:blogonoff/blog/model/comentario.dart';
import 'package:blogonoff/blog/model/post.dart';
import 'package:blogonoff/user/model/user.dart';
import 'package:blogonoff/user/repository/auth_repository.dart';
import 'package:blogonoff/user/repository/cloud_firestore_api.dart';
import 'package:blogonoff/user/repository/cloud_firestore_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';


class UserBloc implements Bloc{

  final _auth_repository = AuthRepository();


  Stream<FirebaseUser> streamFirebase = FirebaseAuth.instance.onAuthStateChanged;
  Stream<FirebaseUser> get authStatus => streamFirebase;

  Future<FirebaseUser> get currentUser => FirebaseAuth.instance.currentUser();

  //casos de la aplicacion
  //singIn con google
  Future<FirebaseUser> signIn(){
    //ingresamos con la clase creada en AuthRepository
    return _auth_repository.signInFirebase();

  }

  //metodo de salida
  logOut(){
    _auth_repository.logOutFirebase();
  }

  //registrar en la base de datos el ususario
  final _cloudFirestoreRepositoryUser = CloudFirestoreRepositoryUser();
  void updateUser(User user)=> _cloudFirestoreRepositoryUser.updateUser(user);
  void updateComentario(Comentario comentario)=>_cloudFirestoreRepositoryUser.updateComentario(comentario);

  Stream<QuerySnapshot> postsListStream =
      Firestore.instance.collection(CloudFirestoreAPIUser().POSTS).snapshots();

  Stream<QuerySnapshot> get postsStream => postsListStream;

  List<Post> buildPost(List<DocumentSnapshot> postListSnapshot)=>
      _cloudFirestoreRepositoryUser.buildPost(postListSnapshot);

  Stream<QuerySnapshot> myComentario(String title)=>
  Firestore.instance.collection(CloudFirestoreAPIUser().COMENTARIOS)
      .where('title', isEqualTo: title).snapshots();

  List<Comentario> buildComentario(List<DocumentSnapshot> comentarioListSnapshot)=>
      _cloudFirestoreRepositoryUser.buildComentario(comentarioListSnapshot);





  @override
  void dispose() {

  }
}