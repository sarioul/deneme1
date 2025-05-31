// import 'package:flutter/material.dart';

// class YemekKarsilastirmaSayfasi extends StatelessWidget {
//   static const String screenRoute = 'newScreen';
//   const YemekKarsilastirmaSayfasi({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final List<Map<String, dynamic>> yemekler = [
//       {
//         "hazirAdi": "Lahmacun",
//         "hazirResim": "images/food/chicken.png",
//         "hazirKalori": 600,
//         "hazirIcerik": ["Hamur", "Yağlı kıyma", "Tuz"],
//         "hazirZarar": ["Yüksek kalori", "Yağ oranı yüksek"],
//         "saglikliAdi": "Tam buğday lavaş + Sebzeli kıyma",
//         "saglikliResim": "images/food/chicken.png",
//         "saglikliKalori": 350,
//         "saglikliIcerik": ["Tam buğday lavaş", "Az yağlı kıyma", "Bol sebze"],
//         "saglikliFayda": ["Daha az kalori", "Daha fazla lif"],
//       },
//       {
//         "hazirAdi": "Hamburger",
//         "hazirResim": "images/food/chicken.png",
//         "hazirKalori": 900,
//         "hazirIcerik": ["Beyaz ekmek", "İşlenmiş et", "Mayonez"],
//         "hazirZarar": ["Yüksek yağ", "Hazımsızlık"],
//         "saglikliAdi": "Izgara tavuklu tam buğday burger",
//         "saglikliResim": "images/food/chicken.png",
//         "saglikliKalori": 450,
//         "saglikliIcerik": ["Tam buğday ekmek", "Izgara tavuk", "Sebzeler"],
//         "saglikliFayda": ["Daha az yağ", "Protein açısından zengin"],
//       },
//       {
//         "hazirAdi": "Pizza",
//         "hazirResim": "images/food/chicken.png",
//         "hazirKalori": 1100,
//         "hazirIcerik": ["Hamur", "Sucuk", "Peynir"],
//         "hazirZarar": ["Yüksek kalori", "Tuzlu"],
//         "saglikliAdi": "Sebzeli tam buğday pizza",
//         "saglikliResim": "images/food/chicken.png",
//         "saglikliKalori": 500,
//         "saglikliIcerik": ["Tam buğday taban", "Az yağlı peynir", "Sebzeler"],
//         "saglikliFayda": ["Daha dengeli", "Vitamin deposu"],
//       },
//       {
//         "hazirAdi": "Kızarmış Tavuk",
//         "hazirResim": "images/food/chicken.png",
//         "hazirKalori": 800,
//         "hazirIcerik": ["Kızartma yağı", "Pane harcı"],
//         "hazirZarar": ["Yüksek yağ", "Kalp sağlığına zararlı"],
//         "saglikliAdi": "Fırında tavuk",
//         "saglikliResim": "images/food/chicken.png",
//         "saglikliKalori": 400,
//         "saglikliIcerik": ["Zeytinyağı", "Baharatlar"],
//         "saglikliFayda": ["Daha az yağlı", "Besleyici"],
//       },
//       {
//         "hazirAdi": "Döner",
//         "hazirResim": "images/food/chicken.png",
//         "hazirKalori": 750,
//         "hazirIcerik": ["Yağlı et", "Beyaz lavaş", "Soslar"],
//         "hazirZarar": ["Aşırı kalori", "Tuzlu"],
//         "saglikliAdi": "Izgara etli salata",
//         "saglikliResim": "images/food/chicken.png",
//         "saglikliKalori": 380,
//         "saglikliIcerik": ["Izgara dana", "Yeşillikler", "Zeytinyağı"],
//         "saglikliFayda": ["Daha hafif", "Lifli"],
//       },
//       {
//         "hazirAdi": "Patates Kızartması",
//         "hazirResim": "images/food/chicken.png",
//         "hazirKalori": 500,
//         "hazirIcerik": ["Kızartma yağı", "Tuz"],
//         "hazirZarar": ["Kilo aldırır", "Sindirim bozar"],
//         "saglikliAdi": "Fırında tatlı patates",
//         "saglikliResim": "images/food/chicken.png",
//         "saglikliKalori": 250,
//         "saglikliIcerik": ["Tatlı patates", "Zeytinyağı"],
//         "saglikliFayda": ["Antioksidan içerir", "Daha az yağ"],
//       },
//       {
//         "hazirAdi": "Tost",
//         "hazirResim": "images/food/chicken.png",
//         "hazirKalori": 600,
//         "hazirIcerik": ["Beyaz ekmek", "Kaşar", "Salam"],
//         "hazirZarar": ["İşlenmiş gıda", "Yüksek tuz"],
//         "saglikliAdi": "Tam buğday peynirli tost",
//         "saglikliResim": "images/food/chicken.png",
//         "saglikliKalori": 350,
//         "saglikliIcerik": ["Tam buğday ekmek", "Az yağlı peynir"],
//         "saglikliFayda": ["Daha sağlıklı karbonhidrat", "Protein dengeli"],
//       },
//       {
//         "hazirAdi": "Simit + Çay",
//         "hazirResim": "images/food/chicken.png",
//         "hazirKalori": 450,
//         "hazirIcerik": ["Beyaz un", "Susam"],
//         "hazirZarar": ["Düşük besin değeri"],
//         "saglikliAdi": "Yulaf ezmesi + Bitki çayı",
//         "saglikliResim": "images/food/chicken.png",
//         "saglikliKalori": 300,
//         "saglikliIcerik": ["Yulaf", "Meyve", "Badem"],
//         "saglikliFayda": ["Yüksek lif", "Uzun süre tok tutar"],
//       },
//       {
//         "hazirAdi": "Çikolatalı Gofret",
//         "hazirResim": "images/food/chicken.png",
//         "hazirKalori": 250,
//         "hazirIcerik": ["Şeker", "Palm yağı", "Kakao"],
//         "hazirZarar": ["Kan şekeri yükseltir", "Diş çürütür"],
//         "saglikliAdi": "Kuru meyve + bitter çikolata",
//         "saglikliResim": "images/food/chicken.png",
//         "saglikliKalori": 150,
//         "saglikliIcerik": ["Kuru üzüm", "Ceviz", "%70 bitter"],
//         "saglikliFayda": ["Doğal şeker", "Antioksidan"],
//       },
//       {
//         "hazirAdi": "Kokoreç",
//         "hazirResim": "images/food/chicken.png",
//         "hazirKalori": 700,
//         "hazirIcerik": ["Bağırsak", "Baharat", "Yağ"],
//         "hazirZarar": ["Kolesterol yüksek", "Ağır besin"],
//         "saglikliAdi": "Sebzeli ızgara hindi",
//         "saglikliResim": "images/food/chicken.png",
//         "saglikliKalori": 400,
//         "saglikliIcerik": ["Hindi göğüs", "Sebzeler"],
//         "saglikliFayda": ["Düşük kolesterol", "Yüksek protein"],
//       },
//     ];

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Sağlıklı Alternatifler"),
//         centerTitle: true,
//       ),
//       body: ListView.builder(
//         padding: const EdgeInsets.all(12),
//         itemCount: yemekler.length,
//         itemBuilder: (context, index) {
//           final yemek = yemekler[index];
//           return FoodComparisonCard(yemek: yemek);
//         },
//       ),
//     );
//   }
// }

// class FoodComparisonCard extends StatelessWidget {
//   final Map<String, dynamic> yemek;

//   const FoodComparisonCard({super.key, required this.yemek});

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: const EdgeInsets.only(bottom: 16),
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//       elevation: 5,
//       child: Padding(
//         padding: const EdgeInsets.all(12),
//         child: Column(
//           children: [
//             Text(
//               yemek["hazirAdi"],
//               style: Theme.of(
//                 context,
//               ).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 10),
//             Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // Hazır Yemek
//                 Expanded(
//                   child: Column(
//                     children: [
//                       ClipRRect(
//                         borderRadius: BorderRadius.circular(8),
//                         child: Image.asset(
//                           yemek["hazirResim"],
//                           height: 120,
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                       const SizedBox(height: 6),
//                       Text("Kalori: ${yemek["hazirKalori"]} kcal"),
//                       const Text(
//                         "İçerik:",
//                         style: TextStyle(fontWeight: FontWeight.bold),
//                       ),
//                       ...yemek["hazirIcerik"].map<Widget>((i) => Text("- $i")),
//                       const Text(
//                         "Zararları:",
//                         style: TextStyle(fontWeight: FontWeight.bold),
//                       ),
//                       ...yemek["hazirZarar"].map<Widget>((z) => Text("• $z")),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(width: 8),
//                 // Sağlıklı Alternatif
//                 Expanded(
//                   child: Column(
//                     children: [
//                       ClipRRect(
//                         borderRadius: BorderRadius.circular(8),
//                         child: Image.asset(
//                           yemek["saglikliResim"],
//                           height: 120,
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                       const SizedBox(height: 6),
//                       Text(
//                         yemek["saglikliAdi"],
//                         textAlign: TextAlign.center,
//                         style: const TextStyle(fontWeight: FontWeight.bold),
//                       ),
//                       Text("Kalori: ${yemek["saglikliKalori"]} kcal"),
//                       const Text(
//                         "İçerik:",
//                         style: TextStyle(fontWeight: FontWeight.bold),
//                       ),
//                       ...yemek["saglikliIcerik"].map<Widget>(
//                         (i) => Text("- $i"),
//                       ),
//                       const Text(
//                         "Faydaları:",
//                         style: TextStyle(fontWeight: FontWeight.bold),
//                       ),
//                       ...yemek["saglikliFayda"].map<Widget>(
//                         (f) => Text("• $f"),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class YemekKarsilastirmaSayfasi extends StatelessWidget {
  static const String screenRoute = 'newScreen';
  final List<Map<String, String>> foods = [
    {
      'name': 'Lahmacun',
      'image': 'images/food/lahmacun.webp',
      'calories': '850 kcal',
      'healthyName': 'Tam buğdaylı lahmacun',
      'healthyImage': 'images/food/cavdar-unlu-lahmacun.webp',
      'healthyCalories': '480 kcal',
    },
    {
      'name': 'Burger',
      'image': 'images/food/burgers.webp',
      'calories': '950 kcal',
      'healthyName': 'Ev_yapımı sebzeli burger',
      'healthyImage': 'images/food/ev_yapim_burger.webp',
      'healthyCalories': '550 kcal',
    },
    {
      'name': 'Pizza',
      'image': 'images/food/chicken.png',
      'calories': '1200 kcal',
      'healthyName': 'Sebzeli tam buğday pizza',
      'healthyImage': 'images/food/chicken.png',
      'healthyCalories': '650 kcal',
    },
    {
      'name': 'Kızarmış Tavuk',
      'image': 'images/food/chicken.png',
      'calories': '1100 kcal',
      'healthyName': 'Fırında tavuk',
      'healthyImage': 'images/food/chicken.png',
      'healthyCalories': '600 kcal',
    },
    {
      'name': 'Döner',
      'image': 'images/food/chicken.png',
      'calories': '980 kcal',
      'healthyName': 'Ev yapımı tavuk dürüm',
      'healthyImage': 'images/food/chicken.png',
      'healthyCalories': '550 kcal',
    },
    {
      'name': 'Patates Kızartması',
      'image': 'images/food/chicken.png',
      'calories': '750 kcal',
      'healthyName': 'Fırınlanmış tatlı patates',
      'healthyImage': 'images/food/chicken.png',
      'healthyCalories': '400 kcal',
    },
    {
      'name': 'Tost',
      'image': 'images/food/chicken.png',
      'calories': '700 kcal',
      'healthyName': 'Tam tahıllı sebzeli tost',
      'healthyImage': 'images/food/chicken.png',
      'healthyCalories': '450 kcal',
    },
    {
      'name': 'Simit ve Çay',
      'image': 'images/food/chicken.png',
      'calories': '680 kcal',
      'healthyName': 'Yulaf ezmesi ve meyve',
      'healthyImage': 'images/food/chicken.png',
      'healthyCalories': '400 kcal',
    },
    {
      'name': 'Çikolatalı Gofret',
      'image': 'images/food/chicken.png',
      'calories': '550 kcal',
      'healthyName': 'Bitter çikolatalı kuru yemiş',
      'healthyImage': 'images/food/chicken.png',
      'healthyCalories': '300 kcal',
    },
    {
      'name': 'Kokoreç',
      'image': 'images/food/chicken.png',
      'calories': '1000 kcal',
      'healthyName': 'Sebzeli ızgara köfte',
      'healthyImage': 'images/food/chicken.png',
      'healthyCalories': '580 kcal',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        centerTitle: true,
        title: Text(
          'Sağlıklı Alternatifler',
          style: GoogleFonts.poppins(
            fontSize: 20,
            color: Color(0xFF1E1E2C),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: foods.length,
        padding: const EdgeInsets.all(12),
        itemBuilder: (context, index) {
          final food = foods[index];
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            elevation: 6,
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    blurRadius: 6,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _buildFoodColumn(
                        food['image']!,
                        food['name']!,
                        food['calories']!,
                        false,
                      ),
                      const SizedBox(width: 10),
                      Icon(Icons.arrow_forward_ios, color: Color(0xFF6C63FF)),
                      const SizedBox(width: 10),
                      _buildFoodColumn(
                        food['healthyImage']!,
                        food['healthyName']!,
                        food['healthyCalories']!,
                        true,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildFoodColumn(
    String image,
    String name,
    String cal,
    bool isHealthy,
  ) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              image,
              height: 100,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            name,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: isHealthy ? Color(0xFF00C897) : Color(0xFF1E1E2C),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            cal,
            style: GoogleFonts.poppins(fontSize: 12, color: Color(0xFFFD5E53)),
          ),
        ],
      ),
    );
  }
}
