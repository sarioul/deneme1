import 'package:flutter/material.dart';
import 'package:beslneme_pusulam/widgets/Colors.dart';
import 'package:numberpicker/numberpicker.dart';

class Hesaplama extends StatefulWidget {
  static const String screenRoute = 'hesaplama';
  const Hesaplama({super.key});

  @override
  State<Hesaplama> createState() => _HesaplamaState();
}

class _HesaplamaState extends State<Hesaplama> {
  TextEditingController ageController = TextEditingController();
  int age = 0;
  int height = 50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backColor,
      appBar: AppBar(
        title: Text('hesaplamalar sayfası '),
        backgroundColor: AppColors.appColor,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              controller: ageController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: 'enter ur age',
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: AppColors.textColor, width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: AppColors.textColor, width: 2),
                  )),
            ),
          ),
          Slider(
              thumbColor: AppColors.textbackColor,
              activeColor: AppColors.textbackColor,
              inactiveColor: AppColors.textColor,
              value: age.toDouble(),
              min: 0,
              max: 100,
              label: '$age',
              divisions: 100, //عدد الخانات مع اظهار العدد
              onChanged: (value) {
                setState(() {
                  age = value.toInt();
                });
              }),
          NumberPicker(
            textStyle: TextStyle(
              color: AppColors.textColor1,
            ),
            selectedTextStyle:
                TextStyle(color: AppColors.textColor, fontSize: 20),
            value: height,
            minValue: 50,
            maxValue: 250,
            onChanged: (newValue) {
              setState(() {
                height = newValue;
              });
            },
          ),
        ],
      ),
    );
  }
}
