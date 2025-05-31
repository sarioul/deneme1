import 'package:beslneme_pusulam/providers/theem.dart';
import 'package:beslneme_pusulam/widgets/mybutton.dart';
import 'package:flutter/material.dart';
import 'package:beslneme_pusulam/widgets/Colors.dart';
import 'package:beslneme_pusulam/widgets/MyTextFeild.dart';
import 'package:beslneme_pusulam/widgets/resultbox.dart';
import 'package:provider/provider.dart';

class InputPage extends StatefulWidget {
  static const String screenRoute = 'inputScreen';
  const InputPage({super.key});

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  // منشان التحكم بحقول المدخلات
  final TextEditingController ageController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController heightController = TextEditingController();

  String? selectedGender;
  String? selectedActivityLevel;

  double? bmrResult;
  double? bmiResult;
  double? idealWeightResult;
  double? caloriesResult;

  final List<String> genders = ['Male', 'Female'];
  final List<String> activityLevels = [
    'Sedentary (little to no exercise)',
    'Lightly active (light exercise)',
    'Moderately active (moderate exercise)',
    'Very active (hard exercise)',
    'Extra active (very intense exercise)',
  ];

  void bmrCalc() {
    final int age = int.tryParse(ageController.text) ?? 0;
    final double weight = double.tryParse(weightController.text) ?? 0;
    final double height = double.tryParse(heightController.text) ?? 0;

    if (age > 0 &&
        weight > 0 &&
        height > 0 &&
        selectedGender != null &&
        selectedActivityLevel != null) {
      // حساب السعرات الحرارية (بسيط فقط كمثال)
      double bmr;
      if (selectedGender == 'Male') {
        bmr = 10 * weight + 6.25 * height - 5 * age + 5;
      } else {
        bmr = 10 * weight + 6.25 * height - 5 * age - 161;
      }

      //ideal Weight
      double idealWeight = 0;
      double heightInhces = height / 2.54;
      if (selectedGender == 'Male') {
        idealWeight = 50 + 2.3 * (heightInhces - 60);
      } else if (selectedGender == 'Female') {
        idealWeight = 45.5 + 2.3 * (heightInhces - 60);
      } else {
        throw ArgumentError('Invalid gender');
      }

      //bmi calc
      double bmi;
      bmi = weight / ((height / 100) * (height / 100));

      // تعديل السعرات بناءً على مستوى النشاط
      double activityMultiplier;
      switch (selectedActivityLevel) {
        case 'Sedentary (little to no exercise)':
          activityMultiplier = 1.2;
          break;
        case 'Lightly active (light exercise)':
          activityMultiplier = 1.375;
          break;
        case 'Moderately active (moderate exercise)':
          activityMultiplier = 1.55;
          break;
        case 'Very active (hard exercise)':
          activityMultiplier = 1.725;
          break;
        case 'Extra active (very intense exercise)':
          activityMultiplier = 1.9;
          break;
        default:
          activityMultiplier = 1.0;
      }

      final double dailyCalories = bmr * activityMultiplier;
      // عرض النتيجة
      setState(() {
        bmrResult = bmr;
        bmiResult = bmi;
        idealWeightResult = idealWeight;
        caloriesResult = dailyCalories;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorProvider = Provider.of<ColorProvider>(context);
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [colorProvider.mainColor, colorProvider.secondaryColor],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 100.0),
              child: Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.textColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        MyTextFeild(
                          WhatController: ageController,
                          hintText: 'Age',
                          labelText: 'Age',
                          labelColor: AppColors.textbackColor,
                          borderColor: AppColors.textbackColor,
                          textInputType: TextInputType.number,
                          textColor: AppColors.textbackColor,
                        ),
                        SizedBox(height: 10),
                        MyTextFeild(
                          WhatController: weightController,
                          hintText: 'Weight',
                          labelText: 'weight',
                          labelColor: AppColors.textbackColor,
                          borderColor: AppColors.textbackColor,
                          textInputType: TextInputType.number,
                          textColor: AppColors.textbackColor,
                        ),
                        SizedBox(height: 10),
                        MyTextFeild(
                          WhatController: heightController,
                          hintText: 'height',
                          labelText: 'height',
                          labelColor: AppColors.textbackColor,
                          borderColor: AppColors.textbackColor,
                          textInputType: TextInputType.number,
                          textColor: AppColors.textbackColor,
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                              labelText: 'Gender',
                              labelStyle: TextStyle(
                                color: colorProvider.mainColor,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: colorProvider.mainColor,
                                  width: 1,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: colorProvider.mainColor,
                                  width: 2,
                                ),
                              ),
                            ),
                            //borderRadius: BorderRadius.circular(10),
                            value: selectedGender,
                            hint: Text('Select Gender'),
                            onChanged: (value) {
                              setState(() {
                                selectedGender = value;
                              });
                            },
                            items:
                                genders.map((gender) {
                                  return DropdownMenuItem(
                                    value: gender,
                                    child: Text(gender),
                                  );
                                }).toList(),
                          ),
                        ),
                        SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                              labelText: 'Activity Level',
                              labelStyle: TextStyle(
                                color: colorProvider.mainColor,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: colorProvider.mainColor,
                                  width: 1,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: colorProvider.mainColor,
                                  width: 2,
                                ),
                              ),
                            ),
                            value: selectedActivityLevel,
                            hint: Text('Select Activity Level'),
                            onChanged: (value) {
                              setState(() {
                                selectedActivityLevel = value;
                              });
                            },
                            items:
                                activityLevels.map((level) {
                                  return DropdownMenuItem(
                                    value: level,
                                    child: Text(level),
                                  );
                                }).toList(),
                          ),
                        ),
                        SizedBox(height: 20),
                        MyButton(
                          TextColor: AppColors.textColor,
                          ButtonColor: colorProvider.mainColor,
                          ButtonColor1: colorProvider.secondaryColor,
                          title: 'Calculate',
                          onPressed: bmrCalc,
                        ),

                        SizedBox(height: 10),
                        resultBox(
                          title: 'BMI',
                          resultText: '${bmiResult?.toStringAsFixed(2)}',
                          firstColor: const Color.fromARGB(255, 255, 78, 24),
                          secondColor: Colors.amber,
                          thirdColor: Colors.white,
                          icon: Icons.heart_broken,
                        ),
                        resultBox(
                          title: 'Calurei',
                          resultText: '${caloriesResult?.toStringAsFixed(2)}',
                          firstColor: Color.fromARGB(255, 133, 181, 0),
                          secondColor: Color.fromARGB(255, 239, 230, 47),
                          thirdColor: Colors.white,
                          icon: Icons.sports,
                        ),
                        resultBox(
                          title: 'BMR',
                          resultText: '${bmrResult?.toStringAsFixed(2)}',
                          firstColor: Colors.teal,
                          secondColor: Colors.tealAccent,
                          thirdColor: Colors.white,
                          icon: Icons.health_and_safety,
                        ),
                        resultBox(
                          title: 'Ideal Ağırlık',
                          resultText:
                              '${idealWeightResult?.toStringAsFixed(2)}',
                          firstColor: const Color.fromARGB(255, 0, 162, 183),
                          secondColor: Colors.cyanAccent,
                          thirdColor: Colors.white,
                          icon: Icons.fitness_center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.only(top: 45.0),
              child: Align(
                alignment: Alignment.topCenter,
                child: Text(
                  'Calculate',
                  style: TextStyle(
                    fontSize: 40,
                    color: AppColors.textColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),

          /// زر الرجوع
          Positioned(
            top: 45, // المسافة من الأعلى
            left: 16, // المسافة من اليسار
            child: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white, size: 30),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
