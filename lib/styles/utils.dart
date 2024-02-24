import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle textStyle(double size,[Color? color , FontWeight? fw])
{
  return GoogleFonts.montserrat(
    fontSize: size,
    color: color,
    fontWeight: fw
  );
}

Color renderScreenColor(String currentState){
  if(currentState == "FOCUS"){
    return Colors.redAccent;
  }
  else if(currentState == "BREAK"){
    return Colors.lightBlueAccent;
  }
  else {
    return Colors.green;
  }
}

Color renderTextColor(String currentState){
  if(currentState == "FOCUS"){
    return Colors.redAccent;
  }
  else if(currentState == "BREAK"){
    return Colors.lightBlueAccent;
  }
  else {
    return Colors.green;
  }
}