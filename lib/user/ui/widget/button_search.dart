import 'package:flutter/material.dart';


class ButtonSearch extends StatelessWidget {

  String buttonText ;
  final VoidCallback onPressed;
  int textcolor;
  IconData iconData;

  ButtonSearch({Key key,
    @required this.buttonText,
    @required this.onPressed,
    @required this.iconData,
    @required this.textcolor
  });


  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidht = MediaQuery.of(context).size.width;
    // TODO: implement build
    return InkWell(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.only(
          top: screenWidht/40,
          left: screenWidht/200,
          right: screenWidht/200,
        ),
        height: screenWidht/10,
        width: screenWidht-20,//400
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.white,




        ),

        child: Center(
          child: Row(
            children: [
              Padding(padding: EdgeInsets.only(right: 10)),
              Icon(iconData,
                color: Color(textcolor),
                size: 25,
              ),
              Padding(padding: EdgeInsets.only(left: 10)),
              Text(
                buttonText,
                style: TextStyle(
                    fontSize: 16.0,
                    color: Color(textcolor)
                ),

              ),
            ],

          ),
        ),

      ),
    );
  }

}