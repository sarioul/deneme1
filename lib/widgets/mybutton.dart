import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  MyButton({
    Key? key,
    required this.TextColor,
    required this.ButtonColor,
    required this.ButtonColor1,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  final Color TextColor;
  final Color ButtonColor;
  final Color ButtonColor1;
  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            stops: [0.4, 0.99],
            colors: [ButtonColor, ButtonColor1],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Material(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(10),
          elevation: 10,
          child: MaterialButton(
            minWidth: 200,
            height: 40,
            onPressed: onPressed,
            child: Text(
              title,
              style: TextStyle(color: TextColor, fontSize: 23),
            ),
          ),
        ),
      ),
    );
  }
}
