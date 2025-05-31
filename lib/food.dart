import 'package:beslneme_pusulam/widgets/Colors.dart';
import 'package:beslneme_pusulam/widgets/yemekkarti.dart';
import 'package:flutter/material.dart';

class FoodInfoPage extends StatelessWidget {
  static const String screenRoute = 'foodInfoScreen';

  const FoodInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                height: 0,
                width: 0,
                decoration: BoxDecoration(
                  color: AppColors.textColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 5),
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
                    child: ListView(
                      padding: EdgeInsets.all(16),
                      children: [
                        /////////////////////////////////////
                        /////////////////////////////////////
                        // Et
                        yemekKarti(
                          calori: '250',
                          yemekAdi: 'Dana Eti',
                          gram: '100',
                          protein: '26',
                          fats: '17',
                          carbs: '0',
                          imagepath: 'images/food/dana_eti.png',
                        ),
                        yemekKarti(
                          calori: '143',
                          yemekAdi: 'Kuzu Eti',
                          gram: '100',
                          protein: '25',
                          fats: '6',
                          carbs: '0',
                          imagepath: 'images/food/kuzu_eti.png',
                        ),
                        yemekKarti(
                          calori: '285',
                          yemekAdi: 'Biftek',
                          gram: '150',
                          protein: '45',
                          fats: '12',
                          carbs: '0',
                          imagepath: 'images/food/biftek.png',
                        ),

                        // Tavuk
                        yemekKarti(
                          calori: '165',
                          yemekAdi: 'Tavuk Göğsü',
                          gram: '100',
                          protein: '31',
                          fats: '3.6',
                          carbs: '0',
                          imagepath: 'images/food/tavuk_gogsu.png',
                        ),
                        yemekKarti(
                          calori: '215',
                          yemekAdi: 'Tavuk Budu',
                          gram: '100',
                          protein: '27',
                          fats: '10',
                          carbs: '0',
                          imagepath: 'images/food/tavuk_budu.png',
                        ),

                        // Balık
                        yemekKarti(
                          calori: '206',
                          yemekAdi: 'Somon',
                          gram: '100',
                          protein: '22',
                          fats: '13',
                          carbs: '0',
                          imagepath: 'images/food/somon.png',
                        ),
                        yemekKarti(
                          calori: '70',
                          yemekAdi: 'Levrek',
                          gram: '100',
                          protein: '15',
                          fats: '1.5',
                          carbs: '0',
                          imagepath: 'images/food/levrek.png',
                        ),
                        yemekKarti(
                          calori: '112',
                          yemekAdi: 'Ton Balığı',
                          gram: '100',
                          protein: '25',
                          fats: '0.5',
                          carbs: '0',
                          imagepath: 'images/food/ton.png',
                        ),
                        yemekKarti(
                          calori: '99',
                          yemekAdi: 'Karides',
                          gram: '100',
                          protein: '21',
                          fats: '1',
                          carbs: '0',
                          imagepath: 'images/food/karades.png',
                        ),

                        // Yumurta Peynir Süt
                        yemekKarti(
                          calori: '155',
                          yemekAdi: 'Yumurta',
                          gram: '100',
                          protein: '13',
                          fats: '11',
                          carbs: '1.1',
                          imagepath: 'images/food/yumurta.png',
                        ),
                        yemekKarti(
                          calori: '42',
                          yemekAdi: 'Süt',
                          gram: '100',
                          protein: '3.4',
                          fats: '1',
                          carbs: '5',
                          imagepath: 'images/food/sut.png',
                        ),
                        yemekKarti(
                          calori: '61',
                          yemekAdi: 'Laktozsuz Süt',
                          gram: '100',
                          protein: '3.2',
                          fats: '3.5',
                          carbs: '5',
                          imagepath: 'images/food/laktozsuz_sut.png',
                        ),
                        yemekKarti(
                          calori: '71',
                          yemekAdi: 'Keçi Sütü',
                          gram: '100',
                          protein: '3.6',
                          fats: '4.1',
                          carbs: '4.5',
                          imagepath: 'images/food/keci_sutu.png',
                        ),
                        yemekKarti(
                          calori: '47',
                          yemekAdi: 'Yoğurt',
                          gram: '100',
                          protein: '10',
                          fats: '0.4',
                          carbs: '3.6',
                          imagepath: 'images/food/yogurt.png',
                        ),
                        yemekKarti(
                          calori: '150',
                          yemekAdi: 'Beyaz Peynir',
                          gram: '50',
                          protein: '10',
                          fats: '12',
                          carbs: '1.5',
                          imagepath: 'images/food/beyaz_peynir.png',
                        ),
                        yemekKarti(
                          calori: '402',
                          yemekAdi: 'Kaşar Peyniri',
                          gram: '100',
                          protein: '25',
                          fats: '33',
                          carbs: '2.4',
                          imagepath: 'images/food/kasar_peyniri.png',
                        ),
                        yemekKarti(
                          calori: '477',
                          yemekAdi: 'Tereyağı',
                          gram: '100',
                          protein: '0.8',
                          fats: '81',
                          carbs: '0.1',
                          imagepath: 'images/food/tereyagi.png',
                        ),

                        // Fıstıklar
                        yemekKarti(
                          calori: '562',
                          yemekAdi: 'Fıstık',
                          gram: '100',
                          protein: '25',
                          fats: '49',
                          carbs: '16',
                          imagepath: 'images/food/fistik.png',
                        ),
                        yemekKarti(
                          calori: '557',
                          yemekAdi: 'Antep Fıstığı',
                          gram: '100',
                          protein: '20',
                          fats: '45',
                          carbs: '28',
                          imagepath: 'images/food/antep_fistigi.png',
                        ),
                        yemekKarti(
                          calori: '573',
                          yemekAdi: 'Kabak Çekirdeği',
                          gram: '100',
                          protein: '30',
                          fats: '49',
                          carbs: '11',
                          imagepath: 'images/food/kabak_cekirdegi.png',
                        ),
                        yemekKarti(
                          calori: '486',
                          yemekAdi: 'Ay Çekirdeği',
                          gram: '100',
                          protein: '21',
                          fats: '51',
                          carbs: '20',
                          imagepath: 'images/food/ay_cekirdegi.png',
                        ),
                        yemekKarti(
                          calori: '582',
                          yemekAdi: 'Badem',
                          gram: '100',
                          protein: '21',
                          fats: '50',
                          carbs: '22',
                          imagepath: 'images/food/badem.png',
                        ),
                        yemekKarti(
                          calori: '654',
                          yemekAdi: 'Ceviz',
                          gram: '100',
                          protein: '15',
                          fats: '65',
                          carbs: '14',
                          imagepath: 'images/food/ceviz.png',
                        ),
                        yemekKarti(
                          calori: '567',
                          yemekAdi: 'Fındık',
                          gram: '100',
                          protein: '14',
                          fats: '61',
                          carbs: '17',
                          imagepath: 'images/food/findik.png',
                        ),

                        // Sebzeler
                        yemekKarti(
                          calori: '35',
                          yemekAdi: 'Ispanak',
                          gram: '100',
                          protein: '2.9',
                          fats: '0.4',
                          carbs: '4',
                          imagepath: 'images/food/ispanak.png',
                        ),
                        yemekKarti(
                          calori: '41',
                          yemekAdi: 'Brokoli',
                          gram: '100',
                          protein: '4.3',
                          fats: '0.4',
                          carbs: '6',
                          imagepath: 'images/food/brokoli.png',
                        ),
                        yemekKarti(
                          calori: '40',
                          yemekAdi: 'Bezelye',
                          gram: '100',
                          protein: '5',
                          fats: '0.4',
                          carbs: '7',
                          imagepath: 'images/food/bezelye.png',
                        ),

                        // Meyveler
                        yemekKarti(
                          calori: '52',
                          yemekAdi: 'Elma',
                          gram: '100',
                          protein: '0.3',
                          fats: '0.2',
                          carbs: '14',
                          imagepath: 'images/food/elma.png',
                        ),
                        yemekKarti(
                          calori: '89',
                          yemekAdi: 'Muz',
                          gram: '100',
                          protein: '1.1',
                          fats: '0.3',
                          carbs: '23',
                          imagepath: 'images/food/muz.png',
                        ),
                        yemekKarti(
                          calori: '43',
                          yemekAdi: 'Çilek',
                          gram: '100',
                          protein: '0.8',
                          fats: '0.3',
                          carbs: '10',
                          imagepath: 'images/food/cilek.png',
                        ),

                        /////////////////////////////////////
                        /////////////////////////////////////
                        Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: LinearGradient(
                              colors: [
                                Colors.orange.shade200,
                                Colors.deepOrange.shade300,
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.deepOrange.withOpacity(0.3),
                                blurRadius: 10,
                                offset: Offset(0, 6),
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.asset(
                                  'images/food/elma.png',
                                  width: 70,
                                  height: 70,
                                ),
                              ),
                              SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Apple',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(height: 6),
                                    Text(
                                      'Calories: 52 kcal\nProtein: 0.3 g\nCarbs: 14 g\nFats: 0.2 g\nGram: 55 g',
                                      style: TextStyle(
                                        color: Colors.white70,
                                        height: 1.4,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 10,
                          ),
                          padding: EdgeInsets.all(14),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                AppColors.redcolor,
                                AppColors.bordcolor, // أزرق سماوي
                              ],
                              stops: [0.1, 0.95],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(blurRadius: 5, color: Colors.black12),
                            ],
                          ),
                          child: Row(
                            children: [
                              Image.asset('images/food/chicken.png', width: 70),
                              SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Chicken Breast',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color:
                                            Colors
                                                .white, // مهم لتوضيح النص على الخلفية الداكنة
                                      ),
                                    ),
                                    Divider(
                                      thickness: 1,
                                      color: AppColors.textColor,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: const [
                                        Icon(
                                          Icons.local_fire_department,
                                          size: 18,
                                          color: Colors.white,
                                        ),
                                        Text(
                                          '165 kcal',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        Icon(
                                          Icons.fitness_center,
                                          size: 18,
                                          color: Colors.white,
                                        ),
                                        Text(
                                          '31 g protein',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      'Fats: 3.6g | Carbs: 0g | 200g',
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: Colors.white70,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
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
      ),
    );
  }
}
