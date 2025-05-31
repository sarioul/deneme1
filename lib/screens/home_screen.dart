import 'package:beslneme_pusulam/providers/theem.dart';
import 'package:beslneme_pusulam/screens/spor.dart';
import 'package:flutter/material.dart';
import 'package:beslneme_pusulam/screens/calorie_screen.dart';
import 'package:beslneme_pusulam/screens/food_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String screenRoute = 'homePageahmed';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: home_page(),
      //bottomNavigationBar: navv(),
    );
  }
}

class home_page extends StatefulWidget {
  const home_page({super.key});

  @override
  State<home_page> createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          gradient: LinearGradient(
                            colors: [
                              colorProvider.mainColor,
                              colorProvider.secondaryColor,
                            ],
                          ),
                        ),
                        child: TextButton(
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              CalorieScreen.screenRoute,
                            );
                          },
                          child: Image.asset(
                            'images/cal.png',
                            height: 180,
                            width: 180,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          // أو يمكنك استخدام SizedBox
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: imageButton(
                              ImagePath: 'images/foods.png',
                              ScreenPath: FoodScreen.screenRoute,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: imageButton(
                              ImagePath: 'images/gym.png',
                              ScreenPath: SporScreen.screenRoute,
                            ),
                          ),
                        ),
                      ],
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
            padding: const EdgeInsets.only(top: 100.0),
            child: Align(
              alignment: Alignment.topCenter,
              child: Text(
                'Home',
                style: TextStyle(
                  fontSize: 50,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
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
