import 'package:beslneme_pusulam/Beslenme_Pusulam.dart';
import 'package:beslneme_pusulam/admin_second.dart';
import 'package:beslneme_pusulam/providers/theem.dart';
import 'package:flutter/material.dart';
import 'package:beslneme_pusulam/widgets/Colors.dart';
import 'package:beslneme_pusulam/widgets/mybutton.dart';
import 'package:provider/provider.dart';

class AdminScreen extends StatefulWidget {
  static const String screenRoute = 'adminScreen';

  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  String admin1 = 'HasanSarioul';
  String pass1 = '123456';
  String admin2 = 'Ahmedgazal';
  String pass2 = '123456';
  bool adminCheck = false;
  bool passCheck = false;
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
              padding: const EdgeInsets.only(top: 230.0),
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 25),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 20,
                      ),
                      child: TextField(
                        style: TextStyle(color: AppColors.bordcolor),
                        decoration: InputDecoration(
                          labelText: 'Admin',
                          labelStyle: TextStyle(color: AppColors.bordcolor),
                          hintText: 'Admin Name',
                          hintStyle: TextStyle(
                            color: AppColors.bordcolor,
                            fontSize: 12,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColors.bordcolor,
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
                        onChanged: (value) {
                          setState(() {
                            if (value == admin1 || value == admin2) {
                              adminCheck = true;
                            } else
                              adminCheck = false;
                          });
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 20,
                      ),
                      child: TextField(
                        style: TextStyle(color: AppColors.bordcolor),
                        decoration: InputDecoration(
                          labelText: 'password',
                          labelStyle: TextStyle(color: AppColors.bordcolor),
                          hintText: 'Password',
                          hintStyle: TextStyle(
                            color: AppColors.bordcolor,
                            fontSize: 10,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColors.bordcolor,
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
                        onChanged: (value) {
                          setState(() {
                            if (value == pass1 || value == pass2) {
                              passCheck = true;
                            } else
                              passCheck = false;
                          });
                        },
                      ),
                    ),
                    MyButton(
                      TextColor: AppColors.textColor,
                      ButtonColor: colorProvider.mainColor,
                      ButtonColor1: colorProvider.secondaryColor,
                      title: 'Doğrula',
                      onPressed: () {
                        setState(() {
                          if (adminCheck == true && passCheck == true) {
                            Navigator.pushNamed(
                              (context),
                              AdminSecondScreen.screenRoute,
                            );
                          } else if (adminCheck == false ||
                              passCheck == false) {
                            showDialog(
                              context: context,
                              builder:
                                  (context) => AlertDialog(
                                    title: Text('Error'),
                                    content: Text('eroor error errorooorah'),
                                    actions: [
                                      IconButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        icon: Icon(Icons.cancel),
                                      ),
                                      SizedBox(width: 100),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pushNamed(
                                            context,
                                            BeslenmePusulam.screenRoute,
                                          );
                                        },
                                        child: Text('Home Page'),
                                      ),
                                    ],
                                  ),
                            );
                          }
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.only(top: 120.0),
              child: Align(
                alignment: Alignment.topCenter,
                child: Text(
                  'Admin giriş sayfası',
                  style: TextStyle(
                    fontSize: 40,
                    color: AppColors.textColor,
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
      ),
    );
  }
}
