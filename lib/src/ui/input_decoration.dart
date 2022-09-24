import 'package:flutter/material.dart';


class InputDecorations {

  static InputDecoration authInputDecoration({
    required String hintText,
    required String labelText,
  }) {
    return InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black45,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.green,
            width: 2
          )
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.black38
        ),
        labelText: labelText,
        labelStyle: TextStyle(
          color: Colors.black54
        ),
        
      );
  }  

}