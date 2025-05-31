import 'package:flutter/material.dart';
import 'package:beslneme_pusulam/widgets/Colors.dart';

class yemekKarti extends StatelessWidget {
  yemekKarti({
    Key? key,
    required this.calori,
    required this.yemekAdi,
    //required this.yemekResmi,
    required this.gram,
    required this.protein,
    required this.fats,
    required this.carbs,
    required this.imagepath,
  });
  final String yemekAdi;
  final String calori;
  final String protein;
  final String carbs;
  final String fats;
  final String gram;
  final String imagepath;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          colors: [AppColors.redcolor, AppColors.bordcolor],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 15, //حركة التغبيش
            offset: Offset(0, 4), //ظل
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              '$imagepath',
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ), //fit =>لنتحكم بطريقة عرض الصورة
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$yemekAdi',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Calories: $calori kcal\nProtein: $protein g\nCarbs: $carbs g\nFats: $fats g\nGram: $gram g',
                  style: TextStyle(color: Colors.white70, height: 1.5),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
