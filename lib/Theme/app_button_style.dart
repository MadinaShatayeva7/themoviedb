import 'package:flutter/material.dart';

abstract class AppButtonStyle {
  static ButtonStyle linkButton = ButtonStyle(
    textStyle:  MaterialStateProperty.all(const TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
    foregroundColor: MaterialStateProperty.all(const Color.fromRGBO(1, 180, 228, 1),    
    ));
}
