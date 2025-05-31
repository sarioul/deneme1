import 'package:beslneme_pusulam/nav_screen.dart';
import 'package:beslneme_pusulam/providers/theem.dart';
import 'package:beslneme_pusulam/widgets/Colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:beslneme_pusulam/widgets/mybutton.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatefulWidget {
  static const String screenRoute = 'SigninSCreen';
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;
  bool _isloading = false; //loading circle
  bool _change =
      true; // Şifrenin gösterilmesini/gizlenmesini kontrol etmek için

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
            child: Container(
              child: Padding(
                padding: const EdgeInsets.only(top: 120.0),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    'SIGN IN',
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),

          // geri buttonu
          Positioned(
            top: 40, // üstten uzaklık
            left: 16, // المسافة من اليسار
            child: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white, size: 30),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 230.0),
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
                child: ModalProgressHUD(
                  //loading circle
                  inAsyncCall: _isloading, //loading circle
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(height: 70),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 30,
                        ),
                        child: TextField(
                          style: TextStyle(color: AppColors.textbackColor),
                          onChanged: (value) {
                            // girilen değeri tutmak için
                            email = value;
                          },
                          //hinttext - label - padding - border -
                          //enabeledborder:outlineinputborder - focuseddorder -
                          decoration: InputDecoration(
                            label: Text(
                              'E-mail',
                              style: TextStyle(color: colorProvider.mainColor),
                            ),
                            prefixIcon: Icon(Icons.mail),
                            prefixIconColor: colorProvider.mainColor,

                            //labelText: 'User name',
                            //labelStyle: TextStyle(color: AppColors.textColor),
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 30,
                        ),
                        child: TextField(
                          obscureText: _change,
                          style: TextStyle(color: AppColors.textbackColor),
                          onChanged: (value) {
                            // girilen değeri tutmak için
                            password = value;
                          },
                          //hinttext - label - padding - border -
                          //enabeledborder:outlineinputborder - focuseddorder -
                          decoration: InputDecoration(
                            label: Text(
                              'Password',
                              style: TextStyle(color: colorProvider.mainColor),
                            ),
                            prefixIcon: Icon(Icons.lock), // أيقونة القفل
                            suffixIcon: IconButton(
                              onPressed: () {
                                viewPass();
                              },
                              icon: Icon(
                                _change
                                    ? Icons.visibility
                                    : Icons.visibility_off, // تغيير الأيقونة
                              ),
                            ),
                            prefixIconColor: colorProvider.mainColor,

                            suffixIconColor: colorProvider.mainColor,
                          ),
                        ),
                      ),
                      MyButton(
                        TextColor: AppColors.textColor,
                        ButtonColor: colorProvider.mainColor,
                        ButtonColor1: colorProvider.secondaryColor,
                        title: 'Sign-in',
                        //hasan@gmail.com
                        onPressed: () async {
                          if (email.isEmpty ||
                              password.isEmpty ||
                              email == null ||
                              password == null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Lütfen boş alanlerı doldurun'),
                              ),
                            );
                            return;
                          }

                          setState(() {
                            _isloading = true;
                          });

                          try {
                            final userControl = await _auth
                                .signInWithEmailAndPassword(
                                  email: email,
                                  password: password,
                                );

                            if (userControl.user != null) {
                              Navigator.pushNamed(
                                context,
                                NavScreen.screenRoute,
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Kullanıcı bulunmadı')),
                              );
                            }
                          } on FirebaseAuthException catch (e) {
                            String message = 'giriş esnasında hata oluştu';
                            if (e.code == 'user-not-found') {
                              message =
                                  'Bu mail adresine sahip kullanıcı bulunmamaktadır';
                            } else if (e.code == 'wrong-password') {
                              message = 'Şifre yanlıştır';
                            }
                            ScaffoldMessenger.of(
                              context,
                            ).showSnackBar(SnackBar(content: Text(message)));
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Bilinmeyen bir hata oluştu: $e'),
                              ),
                            );
                          } finally {
                            setState(() {
                              _isloading = false;
                            });
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 40, // üstten uzaklık
            left: 16, // soldan uzaklık
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

  void viewPass() {
    setState(() {
      _change = !_change; // تبديل حالة الإخفاء
    });
  }
}
