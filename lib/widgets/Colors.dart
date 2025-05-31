import 'package:flutter/material.dart';

class AppColors {
  static const Color backColor = Colors.teal;
  static const Color appColor = Colors.tealAccent;
  static const Color textColor = Colors.white;
  static const Color textColor1 = Colors.white70;
  //static const Color redcolor = Color.fromARGB(255, 0, 58, 117);
  static const Color redcolor = Color(0xffB81736);
  //static const Color bordcolor = Color.fromARGB(255, 0, 148, 148);
  static const Color bordcolor = Color.fromRGBO(40, 21, 55, 1);

  static const Color textbackColor = Color.fromARGB(221, 0, 13, 47);
  static const LinearGradient gradient = LinearGradient(
    colors: [Color(0xFF008080), Color(0xFF00C8C8)], // 🎨 تدرج من Teal إلى Cyan
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
