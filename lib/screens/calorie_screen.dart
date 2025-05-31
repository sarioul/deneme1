import 'package:beslneme_pusulam/providers/theem.dart';
import 'package:beslneme_pusulam/screens/calorie_information.dart';
import 'package:flutter/material.dart';
import 'package:beslneme_pusulam/input.dart';
import 'package:provider/provider.dart';
//import 'package:proje_app/screens/calorie_information.dart';

class CalorieScreen extends StatefulWidget {
  static const String screenRoute = 'CalorieScreen';
  const CalorieScreen({super.key});

  @override
  State<CalorieScreen> createState() => _CalorieScreenState();
}

class _CalorieScreenState extends State<CalorieScreen> {
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
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      imageButton(
                        ImagePath: 'images/calorie_calculater.webp',
                        ScreenPath: InputPage.screenRoute,
                      ),
                      imageButton(
                        ImagePath: 'images/info.webp',
                        ScreenPath: CalorieInformationScreen.screenRoute,
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
                'Calorie',
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

//
class imageButton extends StatelessWidget {
  final String ImagePath;
  final String ScreenPath;

  const imageButton({
    Key? key,
    required this.ImagePath,
    required this.ScreenPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorProvider = Provider.of<ColorProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          gradient: LinearGradient(
            colors: [colorProvider.mainColor, colorProvider.secondaryColor],
          ),
        ),
        child: TextButton(
          onPressed: () {
            Navigator.pushNamed(context, ScreenPath);
          },
          style: TextButton.styleFrom(
            padding: const EdgeInsets.all(30),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)),
            ),
          ),
          child: Image.asset(
            ImagePath,
            width: 100, // حدد عرض الصورة
            height: 100, // وحجمها
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
