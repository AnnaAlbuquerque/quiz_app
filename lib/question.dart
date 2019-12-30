import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String questionText;

  //Constructor -> it'll receive a String and place it in the app
  Question({this.questionText});

  @override
  Widget build(BuildContext context) {
    return Container(
        //The width will be equal to the width of the device
        width: double.infinity,
        margin: EdgeInsets.all(10),
        child: Text(
        questionText,
        style: TextStyle(fontSize: 28),
        textAlign: TextAlign.center,
      )
    );
  }
}
