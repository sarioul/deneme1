import 'package:flutter/material.dart';
import 'widgets/Colors.dart';
import 'widgets/yemekkarti.dart';

class FastfoodScreen extends StatefulWidget {
  static const String screenRoute = 'fastFoodScreen';
  const FastfoodScreen({super.key});

  @override
  State<FastfoodScreen> createState() => _FastfoodScreenState();
}

class _FastfoodScreenState extends State<FastfoodScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backColor,
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColors.redcolor, AppColors.bordcolor],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 100),
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
                child: Padding(
                  padding: const EdgeInsets.only(top: 15, right: 10, left: 10),
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
                      child: Column(
                        children: [
                          // Burger & Fast Food
                          yemekKarti(
                            calori: '295',
                            yemekAdi: 'Hamburger',
                            gram: '100',
                            protein: '17',
                            fats: '14',
                            carbs: '26',
                            imagepath: 'images/food/burger.png',
                          ),

                          yemekKarti(
                            calori: '450',
                            yemekAdi: 'Peynir burger',
                            gram: '150',
                            protein: '22',
                            fats: '24',
                            carbs: '37',
                            imagepath: 'images/food/elma.png',
                          ),
                          yemekKarti(
                            calori: '670',
                            yemekAdi: 'Islak burger',
                            gram: '250',
                            protein: '39',
                            fats: '40',
                            carbs: '49',
                            imagepath: 'images/food/elma.png',
                          ),
                          yemekKarti(
                            calori: '580',
                            yemekAdi: 'Tavuk Burger',
                            gram: '180',
                            protein: '28',
                            fats: '30',
                            carbs: '48',
                            imagepath: 'images/food/elma.png',
                          ),

                          // Döner & Kebab
                          yemekKarti(
                            calori: '450',
                            yemekAdi: 'Et Döner',
                            gram: '200',
                            protein: '30',
                            fats: '25',
                            carbs: '35',
                            imagepath: 'images/food/elma.png',
                          ),
                          yemekKarti(
                            calori: '550',
                            yemekAdi: 'Tavuk Döner',
                            gram: '250',
                            protein: '32',
                            fats: '28',
                            carbs: '45',
                            imagepath: 'images/food/elma.png',
                          ),
                          yemekKarti(
                            calori: '600',
                            yemekAdi: 'Iskender Kebabı',
                            gram: '300',
                            protein: '35',
                            fats: '40',
                            carbs: '50',
                            imagepath: 'images/food/elma.png',
                          ),

                          // Pizza & Pide
                          yemekKarti(
                            calori: '285',
                            yemekAdi: 'Margarita Pizza',
                            gram: '100',
                            protein: '12',
                            fats: '10',
                            carbs: '35',
                            imagepath: 'images/food/elma.png',
                          ),
                          yemekKarti(
                            calori: '350',
                            yemekAdi: 'kaşarlı Pizza',
                            gram: '120',
                            protein: '14',
                            fats: '15',
                            carbs: '40',
                            imagepath: 'images/food/elma.png',
                          ),
                          yemekKarti(
                            calori: '400',
                            yemekAdi: 'Sucuklu Pide',
                            gram: '150',
                            protein: '18',
                            fats: '20',
                            carbs: '45',
                            imagepath: 'images/food/elma.png',
                          ),

                          // Diğer Fast Food
                          yemekKarti(
                            calori: '320',
                            yemekAdi: 'Patates Kızartması',
                            gram: '150',
                            protein: '4',
                            fats: '17',
                            carbs: '40',
                            imagepath: 'images/food/elma.png',
                          ),
                          yemekKarti(
                            calori: '450',
                            yemekAdi: 'Sosisli Sandviç',
                            gram: '200',
                            protein: '18',
                            fats: '28',
                            carbs: '40',
                            imagepath: 'images/food/elma.png',
                          ),
                          yemekKarti(
                            calori: '700',
                            yemekAdi: 'Tavuk Kanatları',
                            gram: '300',
                            protein: '38',
                            fats: '50',
                            carbs: '25',
                            imagepath: 'images/food/elma.png',
                          ),
                          yemekKarti(
                            calori: '290',
                            yemekAdi: 'Simit',
                            gram: '100',
                            protein: '9',
                            fats: '5',
                            carbs: '55',
                            imagepath: 'images/food/elma.png',
                          ),
                          yemekKarti(
                            calori: '500',
                            yemekAdi: 'Midye Dolma',
                            gram: '200',
                            protein: '25',
                            fats: '20',
                            carbs: '60',
                            imagepath: 'images/food/elma.png',
                          ),
                          yemekKarti(
                            calori: '450',
                            yemekAdi: 'Gözleme',
                            gram: '180',
                            protein: '12',
                            fats: '25',
                            carbs: '50',
                            imagepath: 'images/food/elma.png',
                          ),
                          yemekKarti(
                            calori: '380',
                            yemekAdi: 'Tost',
                            gram: '150',
                            protein: '15',
                            fats: '18',
                            carbs: '40',
                            imagepath: 'images/food/elma.png',
                          ),
                          yemekKarti(
                            calori: '300',
                            yemekAdi: 'Börek',
                            gram: '120',
                            protein: '10',
                            fats: '20',
                            carbs: '35',
                            imagepath: 'images/food/elma.png',
                          ),
                        ],
                      ),
                    ),
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
}
