import 'package:flutter/material.dart';

String appName = "Chat App";

String themeName = "light";//"dark"

MaterialColor accentColor = Colors.deepPurple;

MaterialAccentColor userMsgBg = Colors.deepPurpleAccent;
Color otherMsgBg = Color.fromRGBO(220, 214, 255, 0.51);


Color bg(){
  return themeName=="light"?Colors.white:Color.fromRGBO(20, 20, 20, 1);
}

Color fg(){
  return themeName=="light"?Colors.black:Colors.white;
}
