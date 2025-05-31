import 'package:beslneme_pusulam/providers/theem.dart';
import 'package:flutter/material.dart';
import 'package:beslneme_pusulam/screens/constant.dart';
import 'package:provider/provider.dart';

class TrainingScreen extends StatefulWidget {
  static const String screenRoute = 'TrainingScreen';
  const TrainingScreen({super.key});

  @override
  State<TrainingScreen> createState() => _TrainingScreenState();
}

class _TrainingScreenState extends State<TrainingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: training_page());
  }
}

class training_page extends StatefulWidget {
  const training_page({super.key});

  @override
  State<training_page> createState() => _training_pageState();
}

class _training_pageState extends State<training_page> {
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
            padding: const EdgeInsets.only(top: 100.0),
            //القسم الأبيض
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: 21),
                    trainingCards(
                      'images/plank.webp',
                      'Plank',
                      'Burns 30-50 calories in 10 minutes',
                      colorProvider.mainColor,
                      colorProvider.secondaryColor,
                    ),
                    trainingCards(
                      'images/tricepsPushdown.webp',
                      'Triceps Pushdown',
                      'Burns 50-80 calories in 10 minutes',
                      colorProvider.mainColor,
                      colorProvider.secondaryColor,
                    ),
                    trainingCards(
                      'images/deadlift.webp',
                      'Deadlift',
                      'Burns 100-150 calories in 10 minutes',
                      colorProvider.mainColor,
                      colorProvider.secondaryColor,
                    ),
                    trainingCards(
                      'images/dumbbellShoulderPress.webp',
                      'Dumbbell Shoulder Press',
                      'Burns 60-90 calories in 10 minutes',
                      colorProvider.mainColor,
                      colorProvider.secondaryColor,
                    ),
                    trainingCards(
                      'images/crunches.webp',
                      'Crunches',
                      'Burns 50-100 calories in 10 minutes',
                      colorProvider.mainColor,
                      colorProvider.secondaryColor,
                    ),
                    trainingCards(
                      'images/dumbbellCurl.webp',
                      'Dumbbell Curl',
                      'Burns 40-60 calories in 10 minutes',
                      colorProvider.mainColor,
                      colorProvider.secondaryColor,
                    ),
                    trainingCards(
                      'images/benchPress.webp',
                      'Bench Press',
                      'Burns 90-140 calories in 10 minutes',
                      colorProvider.mainColor,
                      colorProvider.secondaryColor,
                    ),
                    trainingCards(
                      'images/leg_press.webp',
                      'Leg Press',
                      'Burns 80-120 calories in 10 minutes',
                      colorProvider.mainColor,
                      colorProvider.secondaryColor,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),

        // العنوان
        Container(
          child: Padding(
            padding: const EdgeInsets.only(top: 45.0),
            child: Align(
              alignment: Alignment.topCenter,
              child: Text(
                'Exersize info',
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.white,
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
    );
  }
}
