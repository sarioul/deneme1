import 'package:beslneme_pusulam/widgets/Colors.dart';
import 'package:flutter/material.dart';

class resultBox extends StatelessWidget {
  resultBox({
    super.key,
    required this.title,
    required this.resultText,
    required this.firstColor,
    required this.secondColor,
    required this.thirdColor,
    required this.icon,
  });

  final String title;
  final String resultText;
  final Color firstColor;
  final Color secondColor;
  final Color thirdColor;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border(
              right: BorderSide(
            color: AppColors.textbackColor,
            width: 5,
          )),
          gradient: LinearGradient(
            ///
            colors: [
              firstColor,
              secondColor,
              thirdColor,
            ],
            stops: [0.0, 0.7, 0.95],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            transform: GradientRotation(BorderSide.strokeAlignCenter),
          ),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: AppColors.textbackColor,
              blurRadius: 10,
              offset: Offset(2, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.white, size: 30),
            SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: TextStyle(
                        color: AppColors.textColor,
                        fontSize: 22,
                        fontWeight: FontWeight.w500)),
                SizedBox(height: 4),
                Text(resultText,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
