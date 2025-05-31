import 'package:beslneme_pusulam/Beslenme_Pusulam.dart';
import 'package:beslneme_pusulam/fastfood.dart';
import 'package:beslneme_pusulam/hesaplama.dart';
import 'package:beslneme_pusulam/admin.dart';
import 'package:beslneme_pusulam/input.dart';
import 'package:beslneme_pusulam/providers/theem.dart'; // Tema renklerini sağlayan Provider sınıfı
import 'package:beslneme_pusulam/screens/calorie_screen.dart';
import 'package:beslneme_pusulam/screens/training_screen.dart';
import 'package:flutter/material.dart'; // Flutter ana widget kütüphanesi
import 'package:beslneme_pusulam/register.dart';
import 'package:beslneme_pusulam/signin.dart';
import 'package:beslneme_pusulam/screens/home_screen.dart';
import 'package:beslneme_pusulam/screens/spor.dart';
import 'package:beslneme_pusulam/screens/food_screen.dart';
import 'package:beslneme_pusulam/screens/settings_screen.dart';
import 'package:beslneme_pusulam/screens/calorie_information.dart';
import 'package:firebase_core/firebase_core.dart'; // Firebase başlatmak için gerekli
import 'package:beslneme_pusulam/admin_second.dart';
import 'package:beslneme_pusulam/food.dart';
import 'package:beslneme_pusulam/profile.dart';
import 'package:beslneme_pusulam/new.dart';
import 'package:beslneme_pusulam/sets.dart';
import 'package:beslneme_pusulam/nav_screen.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Firebase kullanıcı girişi yönetimi
import 'package:provider/provider.dart'; // Durum yönetimi sağlayan Provider paketi

//Provider: Durum yönetimi ,widget ağacında veri paylaşımını kolaylaştıran bir paket(Package)
void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Firebase'den önce widget sistemini başlat

  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyBJcNPUBwfyEn5E8iAWlyGZ3-w6jchjMIY",
      appId: "1:716025338087:android:f9e16026da5229e52b2a42",
      messagingSenderId: "716025338087",
      projectId: "beslenmepusulam",
      storageBucket: "beslenmepusulam.firebasestorage.app",
    ),
  );

  // Şu an oturum açmış kullanıcıyı kontrol eder
  final userIsHere = FirebaseAuth.instance.currentUser;

  runApp(
    // MultiProvider: birden fazla provider kullanmak için
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ColorProvider())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        // Kullanıcı giriş yaptıysa ana ekrana, yapmadıysa giriş ekranına yönlendirir
        initialRoute:
            userIsHere != null
                ? NavScreen.screenRoute
                : BeslenmePusulam.screenRoute,
        routes: {
          //'HomePage':(context)=>HomePage(),
          AdminScreen.screenRoute: (context) => AdminScreen(),
          BeslenmePusulam.screenRoute: (context) => BeslenmePusulam(),
          RegisterScreen.screenRoute: (context) => RegisterScreen(),
          SignInScreen.screenRoute: (context) => SignInScreen(),
          Hesaplama.screenRoute: (context) => Hesaplama(),
          AdminSecondScreen.screenRoute: (context) => AdminSecondScreen(),
          InputPage.screenRoute: (context) => InputPage(),
          FoodInfoPage.screenRoute: (context) => FoodInfoPage(),
          TrainingScreen.screenRoute: (context) => TrainingScreen(),
          ProfileScreen.screenRoute: (context) => ProfileScreen(),
          SettingsScreen.screenRoute: (context) => SettingsScreen(),
          BenchPressTracker.screenRoute: (context) => BenchPressTracker(),
          FastfoodScreen.screenRoute: (context) => FastfoodScreen(),
          HomeScreen.screenRoute: (context) => HomeScreen(),
          SporScreen.screenRoute: (context) => SporScreen(),
          FoodScreen.screenRoute: (context) => FoodScreen(),
          CalorieScreen.screenRoute: (context) => CalorieScreen(),
          YemekKarsilastirmaSayfasi.screenRoute:
              (context) => YemekKarsilastirmaSayfasi(),
          NavScreen.screenRoute: (context) => NavScreen(),
          CalorieInformationScreen.screenRoute:
              (context) => CalorieInformationScreen(),
        },
      ),
    ),
  );
}
