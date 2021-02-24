
import 'package:blogonoff/blog/model/comentario.dart';
import 'package:blogonoff/blog/ui/widget/list_view_comentarios.dart';
import 'package:blogonoff/user/bloc/bloc_user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';


class PostScreen extends StatefulWidget{

  String imagePost;
  String titlePost;
  String textPost;
  String information;

  PostScreen({Key key,
    @required this.information,
    @required this.textPost,
    @required this.imagePost,
    @required this.titlePost
   });

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _PostScreen();
  }
}

class _PostScreen extends State<PostScreen>{

  UserBloc userBloc;
  final _scaffoldkey = GlobalKey<ScaffoldState>();
  // variable para el key que permite acceder al formulario actual del codigo
  final _formkey =  GlobalKey<FormState>();
  String _mensaje;
  bool _isSend = false;

  Future _enviar() async{

    if(_isSend)return;
    setState(() {
      _isSend = true;
    });

    final form = _formkey.currentState;

    if(!form.validate()){
      _scaffoldkey.currentState.hideCurrentSnackBar();
      setState(() {
        _isSend= false;
      });
      return;
    }
    form.save();
    userBloc.currentUser.then((FirebaseUser user){
      if(_mensaje!=null){
        print(_mensaje);
        userBloc.currentUser.then((FirebaseUser user){
          userBloc.updateComentario(
              Comentario(
                  title: widget.titlePost,
                  text: _mensaje,
                  time: DateTime.now().toString(),
                  name: user.displayName));
        });
        _scaffoldkey.currentState.showSnackBar(SnackBar(content: Text('Enviando mensaje'),duration: Duration(milliseconds: 3),));
        _formkey.currentState.reset();
        _isSend= false;
      }else{
        _scaffoldkey.currentState.showSnackBar(SnackBar(content: Text('No se envio tu mensaje')));
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidht = MediaQuery.of(context).size.width;
    userBloc = BlocProvider.of<UserBloc>(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back,color: Colors.white,size: 25,), onPressed: (){Navigator.pop(context);}),
        title: Text('Lectura',style: TextStyle(color: Colors.white,fontSize: 25),),
      ),
      key: _scaffoldkey,
      body: Form(
        key: _formkey,
          child: ListView(
            children: [
              Container(
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
              ),
              Container(
                child: Container(
                  margin: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('Comentarios',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w900), ),
                      Padding(padding: EdgeInsets.all(15)),
                      Column(
                        children: [
                          ListViewComentarios(title: widget.titlePost)
                        ],
                      ),
                      Padding(padding: EdgeInsets.all(15)),
                      Container(
                        child: TextFormField(

                          decoration: InputDecoration(
                            hintText: 'Comenta este post...',
                            suffixIcon: IconButton(icon: Icon(Icons.send), onPressed: (){
                              _enviar();
                              print('enviar');
                            }),
                          ),
                          validator: (val){
                            if(val.isEmpty){
                              return 'Por favor ingrese un mensaje';
                            }else{
                              return null;
                            }
                          },
                          onSaved: (val){
                            setState(() {
                              _mensaje=val;
                            });
                          },
                        ),
                        width: screenWidht-30,
                      ),
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
            ],
          )
      )
    );
  }
}