import 'package:beslneme_pusulam/providers/theem.dart';
import 'package:beslneme_pusulam/screens/training_screen.dart';
import 'package:beslneme_pusulam/sets.dart';
import 'package:flutter/material.dart';
import 'package:beslneme_pusulam/screens/calorie_screen.dart';
import 'package:provider/provider.dart';
//import 'package:proje_app/screens/calorie_information.dart';

class SporScreen extends StatefulWidget {
  static const String screenRoute = 'SporScreen';
  const SporScreen({super.key});

  @override
  State<SporScreen> createState() => _SporScreenState();
}

class _SporScreenState extends State<SporScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: calorie_page(), backgroundColor: Colors.white);
  }
}

class calorie_page extends StatefulWidget {
  const calorie_page({super.key});

  @override
  State<calorie_page> createState() => _calorie_pageState();
}

class _calorie_pageState extends State<calorie_page> {
  @override
  Widget build(BuildContext context) {
    final colorProvider = Provider.of<ColorProvider>(context);
    return Stack(
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
            padding: const EdgeInsets.only(top: 180.0),
            child: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: SingleChildScrollView(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      imageButton(
                        ImagePath: 'images/sets.webp',
                        ScreenPath: BenchPressTracker.screenRoute,
                      ),
                      imageButton(
                        ImagePath: 'images/info.webp',
                        ScreenPath: TrainingScreen.screenRoute,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        // العنوان
        Container(
          child: Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: Align(
              alignment: Alignment.topCenter,
              child: Text(
                'Gym',
                style: TextStyle(
                  fontSize: 50,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),

        /// زر الرجوع
        Positioned(
          top: 40, // المسافة من الأعلى
          left: 16, // المسافة من اليسار
          child: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white, size: 30),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ],
    );
  }
}
