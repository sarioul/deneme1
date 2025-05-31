import 'package:beslneme_pusulam/fastfood.dart';
import 'package:beslneme_pusulam/food.dart';
import 'package:beslneme_pusulam/new.dart';
import 'package:beslneme_pusulam/providers/theem.dart';
import 'package:beslneme_pusulam/screens/calorie_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import 'package:proje_app/screens/food_information.dart';

class FoodScreen extends StatefulWidget {
  static const String screenRoute = 'foodscreen';

  const FoodScreen({super.key});

  @override
  State<FoodScreen> createState() => _FoodScreenState();
}

class _FoodScreenState extends State<FoodScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Food_page());
  }
}

class Food_page extends StatefulWidget {
  const Food_page({super.key});

  @override
  State<Food_page> createState() => _Food_pageState();
}

class _Food_pageState extends State<Food_page> {
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
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      imageButton(
                        ImagePath: 'images/healthyfood.webp',
                        ScreenPath: FoodInfoPage.screenRoute,
                      ),
                      imageButton(
                        ImagePath: 'images/fastfood.webp',
                        ScreenPath: FastfoodScreen.screenRoute,
                      ),
                      imageButton(
                        ImagePath: 'images/fastfood.webp',
                        ScreenPath: YemekKarsilastirmaSayfasi.screenRoute,
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
                'Food',
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
