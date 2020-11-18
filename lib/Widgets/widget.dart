import 'package:flutter/material.dart';

Widget appBar(BuildContext context) {
  return Center(
    child: RichText(
      text: TextSpan(
        style: TextStyle(fontSize: 22),
        children: <TextSpan>[
          TextSpan(
            text: 'IELTS Listening Test',
            style: TextStyle(fontWeight: FontWeight.w700, color: Colors.black))
        ],
      ),
    ),
  );
}

Widget greyButton({BuildContext context, String labelButton, buttonWidth}){
  return Container(
    padding: EdgeInsets.symmetric(vertical: 15),
    decoration: BoxDecoration(
      color: Colors.black26,
      borderRadius: BorderRadius.circular(25),
    ),
    alignment: Alignment.center,
    width: buttonWidth != null  ? buttonWidth : MediaQuery.of(context).size.width,
    child: Text(
      labelButton,
      style: TextStyle(color: Colors.black, fontSize: 20),
    ),
  );
}