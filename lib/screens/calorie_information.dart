import 'package:beslneme_pusulam/providers/theem.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CalorieInformationScreen extends StatefulWidget {
  static const String screenRoute = 'CalorieInformation';
  const CalorieInformationScreen({super.key});

  @override
  State<CalorieInformationScreen> createState() =>
      _CalorieInformationScreenState();
}

class _CalorieInformationScreenState extends State<CalorieInformationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Calorie_Information_Page(), // إصلاح اسم الكلاس
    );
  }
}

class Calorie_Information_Page extends StatelessWidget {
  const Calorie_Information_Page({super.key});

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
            padding: const EdgeInsets.only(top: 100.0),
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
                padding: EdgeInsets.all(16.0), // إضافة مسافة داخلية
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start, // محاذاة النصوص لليسار
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Expanded(child: Image.asset('images/calorie.png')),
                    ),
                    SizedBox(height: 20),

                    Text(
                      'Kalori Nedir?',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Kalori, vücudun yiyecek ve içeceklerden aldığı enerji birimidir. Vücut, nefes alma, sindirim ve hareket gibi temel işlevleri yerine getirmek için belirli bir miktarda kaloriye ihtiyaç duyar. ',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 20),
                    ///////////////////
                    Text(
                      'Kalori Türleri',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      '1. Alınan kaloriler (Calories In - Alınan Kalori): Yiyecek ve içeceklerden gelir.',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      '2. Yakılan kaloriler (Calories Out - Yakılan Kalori): Günlük aktiviteler ve egzersiz yoluyla harcanır.',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 20),

                    ///////////////////
                    Text(
                      'Günlük Kalori İhtiyacı',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Günlük kalori ihtiyacı; yaş, cinsiyet, kilo, fiziksel aktivite düzeyi ve sağlık durumuna bağlı olarak değişir.',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 5),
                    Text(
                      '- Erkekler: Günde yaklaşık 2500 kalori kiloyu korumak için.',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      '- Kadınlar: Günde yaklaşık 2000 kalori kiloyu korumak için.',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      '- Kilo vermek için: Günlük kalori alımını 500-1000 kalori azaltarak haftada 0,5 - 1 kg vermek mümkündür.',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 20),

                    ///////////////////
                    Text(
                      'Kalori Kaynakları',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      '- Karbonhidratlar (Carbohydrates - Karbonhidratler): 1 gramda 4 kalori sağlar. Ekmek, pirinç, makarna, meyve ve sebzelerde bulunur.',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      '- Yağlar (Fats - Yağlar): 1 gramda 9 kalori sağlar. Yağlar, fındık, avokado ve tam yağlı süt ürünlerinde bulunur.',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      '- Proteinler (Proteins - Proteinler): 1 gramda 4 kalori sağlar. Et, balık, yumurta ve baklagillerde bulunur.',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 20),

                    ///////////////////
                    Text(
                      'Kalori İhtiyacı Nasıl Hesaplanır?',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Günlük kalori ihtiyacı yaşa, cinsiyete ve fiziksel aktivite seviyesine bağlıdır. '
                      'Genellikle bir yetişkinin günlük ortalama kalori ihtiyacı erkekler için 2500, kadınlar için ise 2000 kalori civarındadır.',
                      style: TextStyle(fontSize: 16),
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
            padding: const EdgeInsets.only(top: 45.0),
            child: Align(
              alignment: Alignment.topCenter,
              child: Text(
                'Calorie info',
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
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
    );
  }
}
