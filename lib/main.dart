
import 'package:blogonoff/user/bloc/bloc_user.dart';
import 'package:blogonoff/user/ui/screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

void main() {
  runApp(BlogApp());
}

class BlogApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return BlocProvider(
        child: MaterialApp(
          title: 'BlogApp',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            primaryColor: Color(0xFF2EBFF7),
            accentColor: Colors.blueAccent,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: SplashScreen()
        ),
        bloc: UserBloc()
    );
  }
}
