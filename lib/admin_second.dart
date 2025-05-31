import 'package:beslneme_pusulam/providers/theem.dart';
import 'package:flutter/material.dart';
import 'package:beslneme_pusulam/widgets/Colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class AdminSecondScreen extends StatefulWidget {
  static const String screenRoute = 'AdminSecondScreen';
  const AdminSecondScreen({super.key});

  @override
  State<AdminSecondScreen> createState() => _AdminSecondScreenState();
}

class _AdminSecondScreenState extends State<AdminSecondScreen> {
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
              padding: const EdgeInsets.only(top: 100.0),
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
                child: StreamBuilder<QuerySnapshot>(
                  // Firestore'daki "User" koleksiyonundan anlık veri akışı
                  stream:
                      FirebaseFirestore.instance.collection('User').snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text('Hata oluştu: ${snapshot.error}'),
                      ); // Hata mesajı
                    }

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      ); // Veri yükleniyor göstergesi
                    }

                    final users = snapshot.data!.docs;

                    if (users.isEmpty) {
                      return const Center(
                        child: Text("Kayıtlı kullanıcı bulunamadı."),
                      ); // Boş koleksiyon mesajı
                    }

                    return ListView.builder(
                      itemCount: users.length,
                      itemBuilder: (context, index) {
                        final user = users[index];

                        // Kullanıcı bilgileri - null kontrolüyle birlikte
                        final name = user['ad_soyad'] ?? 'Bilinmiyor';
                        final mail = user['mail'] ?? 'E-posta yok';
                        final age = user['yas'] ?? '';
                        final boy = user['boy'] ?? '';
                        final agirlik = user['agirlik'] ?? '';
                        final cinsiyet = user['cinsiyet'] ?? '';

                        return Card(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 6,
                          ),
                          child: ListTile(
                            leading: Icon(
                              Icons.person,
                              color: colorProvider.mainColor,
                            ), // Profil ikonu
                            title: Text(name), // Ad soyad
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('$mail'), // E-posta
                                Text(
                                  'Yaş: $age /  Boy: $boy /  Kilo: $agirlik',
                                ), // Fiziksel bilgiler
                                Text(' Cinsiyet: $cinsiyet'), // Cinsiyet
                              ],
                            ),
                            isThreeLine: true,
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.only(top: 45.0),
              child: Align(
                alignment: Alignment.topCenter,
                child: Text(
                  'Kullanıcı Listesi',
                  style: TextStyle(
                    fontSize: 30,
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
