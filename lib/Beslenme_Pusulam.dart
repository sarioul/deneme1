import 'package:beslneme_pusulam/admin.dart';
import 'package:beslneme_pusulam/nav_screen.dart';
import 'package:beslneme_pusulam/profile.dart';
import 'package:beslneme_pusulam/providers/theem.dart';
import 'package:beslneme_pusulam/register.dart';
import 'package:beslneme_pusulam/signin.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Flutter ana widget kütüphanesi
import 'package:beslneme_pusulam/widgets/Colors.dart'; // Renk sabitlerini içeren dosya
import 'package:beslneme_pusulam/widgets/mybutton.dart'; // Uygulamada kullanılan özel buton bileşeni

class BeslenmePusulam extends StatefulWidget {
  static const String screenRoute = 'BeslenmePusulam'; //
  const BeslenmePusulam({super.key});

  @override
  State<BeslenmePusulam> createState() => _BeslenmePusulamState();
}

class _BeslenmePusulamState extends State<BeslenmePusulam> {
  @override
  Widget build(BuildContext context) {
    final colorProvider = Provider.of<ColorProvider>(
      context,
    ); // Renkleri sağlayan provider

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            // Arka plan gradyan geçişli renk
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [colorProvider.mainColor, colorProvider.secondaryColor],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 400.0),
            child: Container(
              height: double.infinity,
              width: double.infinity,
              // Giriş/kayıt butonlarının bulunduğu kutu
              decoration: BoxDecoration(
                color: AppColors.textColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: 50),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.account_circle,
                          color: AppColors.textbackColor,
                          size: 35,
                        ),
                        SizedBox(width: 15),
                        Text(
                          'Giriş yapın',
                          style: TextStyle(
                            color: AppColors.textbackColor,
                            fontSize: 28,
                          ),
                        ),
                      ],
                    ),
                    MyButton(
                      TextColor: AppColors.textColor,
                      ButtonColor: colorProvider.mainColor,
                      ButtonColor1: colorProvider.secondaryColor,
                      title: 'Sign-in',
                      onPressed: () {
                        Navigator.pushNamed(context, SignInScreen.screenRoute);
                      },
                    ),
                    MyButton(
                      TextColor: AppColors.textColor,
                      ButtonColor: colorProvider.mainColor,
                      ButtonColor1: colorProvider.secondaryColor,
                      title: 'Register',
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          RegisterScreen.screenRoute,
                        );
                      },
                    ),
                    MyButton(
                      TextColor: AppColors.textColor,
                      ButtonColor: colorProvider.mainColor,
                      ButtonColor1: colorProvider.secondaryColor,
                      title: 'Home',
                      onPressed: () {
                        Navigator.pushNamed(context, NavScreen.screenRoute);
                      },
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        SizedBox(width: 15),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: MaterialButton(
                            onPressed: () {
                              // Admin olduğundan emin misin? uyarı penceresi
                              showDialog(
                                context: context,
                                builder:
                                    (context) => AlertDialog(
                                      title: Text(
                                        'Uyarı',
                                        style: TextStyle(
                                          color: AppColors.textbackColor,
                                        ),
                                      ),
                                      content: Text(
                                        'Admin olduğunuzdan emin misiniz ?',
                                        style: TextStyle(
                                          color: AppColors.textbackColor,
                                        ),
                                      ),
                                      actions: [
                                        IconButton(
                                          color: AppColors.textbackColor,
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          icon: Icon(Icons.cancel),
                                        ),
                                        SizedBox(width: 110),
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pushNamed(
                                              context,
                                              AdminScreen.screenRoute,
                                            );
                                          },
                                          child: Text(
                                            'Devam et',
                                            style: TextStyle(
                                              color: AppColors.textbackColor,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                              );
                            },
                            padding: EdgeInsets.all(8),
                            elevation: 10,
                            height: 10,
                            minWidth: 10,
                            color: AppColors.textbackColor,
                            child: Text(
                              'ADMIN',
                              style: TextStyle(
                                color: AppColors.textColor,
                                fontSize: 10,
                              ),
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
          Positioned(
            top: 50,
            left: 0,
            right: 0,
            child: Column(
              children: [
                InkWell(
                  // Logoya tıklanınca profil sayfasına gider
                  child: Image.asset(
                    'images/logo-1.webp',
                    width: 250,
                    height: 250,
                    fit: BoxFit.contain,
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, ProfileScreen.screenRoute);
                  },
                ),
                Text('Welcome'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
