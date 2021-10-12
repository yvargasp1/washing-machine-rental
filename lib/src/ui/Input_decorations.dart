import 'package:flutter/material.dart';

class InputDecorations{

  static InputDecoration authInputDecoration({
    required String labelText,
    required String hintText,
    IconData? prefix
  }){return InputDecoration(
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: Colors.black,
      ),
       
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: Colors.black,
        width: 2
      ),
    ),
    hintText: hintText,
    labelText: labelText,
    labelStyle: TextStyle(color: Colors.grey),
    prefixIcon: prefix != null ? Icon(prefix, color:Colors.black,):null,
  );

  } 


}