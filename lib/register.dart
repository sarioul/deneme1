import 'package:beslneme_pusulam/providers/theem.dart';
import 'package:beslneme_pusulam/signin.dart';
import 'package:beslneme_pusulam/widgets/Colors.dart';
import 'package:beslneme_pusulam/widgets/MyTextFeild.dart';
import 'package:flutter/material.dart';
import 'package:beslneme_pusulam/widgets/mybutton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  static const String screenRoute = 'registerScreen';
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _auth = FirebaseAuth.instance;

  //deneme //kullanıcıları çağırmak için
  Future<void> saveUserToFirestore({
    required User user,
    required String name,
    required String age,
    required String gender,
    required String height,
    required String weight,
  }) async {
    final docRef = FirebaseFirestore.instance.collection('User').doc(user.uid);

    await docRef.set({
      'uid': user.uid,
      'mail': user.email,
      'ad_soyad': name,
      'yas': age,
      'cinsiyet': gender,
      'boy': height,
      'agirlik': weight,
    }, SetOptions(merge: true));
  }

  //deneme bitiş
  TextEditingController AgeController = TextEditingController();
  TextEditingController NameController = TextEditingController();
  TextEditingController HeightController = TextEditingController();
  TextEditingController WeightController = TextEditingController();

  late String password;
  late String email;
  bool _isloading = false;
  String? SelectGender;
  List<String> genders = ['Male', 'Female'];
  bool _change = true; // للتحكم في إظهار/إخفاء كلمة السر

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
                    'SIGN UP',
                    style: TextStyle(
                      fontSize: 40,
                      color: AppColors.textColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
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
              child: SingleChildScrollView(
                child: ModalProgressHUD(
                  //loading circle
                  inAsyncCall: _isloading, //loading circle
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(height: 25),
                      MyTextFeild(
                        WhatController: NameController,
                        hintText: 'Name',
                        labelText: 'Name',
                        labelColor: AppColors.textColor,
                        borderColor: Colors.white,
                        textInputType: TextInputType.name,
                        textColor: Colors.white,
                      ),
                      MyTextFeild(
                        WhatController: AgeController,
                        hintText: 'Age',
                        labelText: 'Age',
                        labelColor: AppColors.textColor,
                        borderColor: Colors.white,
                        textInputType: TextInputType.number,
                        textColor: Colors.white,
                      ),
                      MyTextFeild(
                        WhatController: HeightController,
                        hintText: 'Height',
                        labelText: 'Height',
                        labelColor: AppColors.textColor,
                        borderColor: Colors.white,
                        textInputType: TextInputType.number,
                        textColor: Colors.white,
                      ),
                      MyTextFeild(
                        WhatController: WeightController,
                        hintText: 'Weight',
                        labelText: 'weight',
                        labelColor: AppColors.textColor,
                        borderColor: Colors.white,
                        textInputType: TextInputType.number,
                        textColor: Colors.white,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 25,
                        ),
                        child: DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            labelText: 'Gender',
                            labelStyle: TextStyle(
                              color: colorProvider.mainColor,
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
                          items:
                              genders.map((gender) {
                                return DropdownMenuItem(
                                  value: gender,
                                  child: Text(gender),
                                );
                              }).toList(),
                          onChanged: (value) {
                            setState(() {
                              SelectGender = value;
                            });
                          },
                        ),
                      ),
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
                            labelText: 'e-mail',
                            labelStyle: TextStyle(
                              color: colorProvider.mainColor,
                            ),
                            contentPadding: EdgeInsets.all(10),
                            prefixIcon: Icon(
                              Icons.mail,
                              color: colorProvider.mainColor,
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
                            labelText: 'Password',
                            labelStyle: TextStyle(
                              color: colorProvider.mainColor,
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
                        ),
                      ),
                      //hasan2020@gmail.com
                      MyButton(
                        TextColor: AppColors.textColor,
                        ButtonColor: colorProvider.mainColor,
                        ButtonColor1: colorProvider.secondaryColor,
                        title: 'Register',
                        onPressed: () async {
                          if (email.isEmpty || password.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'الرجاء إدخال البريد الإلكتروني وكلمة المرور',
                                ),
                              ),
                            );
                            return;
                          }

                          setState(() => _isloading = true);

                          try {
                            final newUser = await _auth
                                .createUserWithEmailAndPassword(
                                  email: email.trim(),
                                  password: password.trim(),
                                );

                            if (newUser.user != null) {
                              final uid = newUser.user!.uid;

                              await FirebaseFirestore.instance
                                  .collection('User')
                                  .doc(uid)
                                  .set({
                                    'uid': uid,
                                    'mail': email.trim(),
                                    'ad_soyad': NameController.text.trim(),
                                    'yas': AgeController.text.trim(),
                                    'boy': HeightController.text.trim(),
                                    'agirlik': WeightController.text.trim(),
                                    'cinsiyet': SelectGender ?? '',
                                  }, SetOptions(merge: true));

                              // بعد التخزين، ننتقل إلى الصفحة التالية
                              Navigator.pushNamed(
                                context,
                                SignInScreen.screenRoute,
                              );
                            }
                          } on FirebaseAuthException catch (e) {
                            String errorMessage = 'حدث خطأ غير معروف';
                            if (e.code == 'weak-password') {
                              errorMessage = 'كلمة المرور ضعيفة جدًا';
                            } else if (e.code == 'email-already-in-use') {
                              errorMessage =
                                  'الحساب موجود بالفعل لهذا البريد الإلكتروني';
                            } else if (e.code == 'invalid-email') {
                              errorMessage = 'بريد إلكتروني غير صالح';
                            }
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(errorMessage)),
                            );
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('حدث خطأ: ${e.toString()}'),
                              ),
                            );
                          } finally {
                            setState(() => _isloading = false);
                          }
                        },
                      ),
                    ],
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
      ),
    );
  }

  void viewPass() {
    setState(() {
      _change = !_change; // تبديل حالة الإخفاء
    });
  }
}
