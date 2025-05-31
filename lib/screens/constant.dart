import 'package:flutter/material.dart';

//training
Widget trainingCards(
  String imgpathm,
  String title,
  String subTitle,
  Color color1,
  Color color2,
) {
  return Padding(
    padding: const EdgeInsets.only(top: 8.0, bottom: 8, right: 8, left: 8),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(30)),
        gradient: LinearGradient(colors: [color1, color2]),
        boxShadow: [BoxShadow(color: Colors.black, blurRadius: 5)],
      ),
      height: 100,
      width: 90,
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Image.asset(
              imgpathm,
              width: 70,
              height: 100,
              fit: BoxFit.contain,
            ),
          ),
        ),
        title: Text(title, style: TextStyle(fontSize: 20, color: Colors.white)),
        subtitle: Text(
          subTitle,
          style: TextStyle(fontSize: 15, color: Colors.white),
        ),
        onTap: () {},
      ),
    ),
  );
}
