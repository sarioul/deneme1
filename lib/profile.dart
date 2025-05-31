import 'package:beslneme_pusulam/widgets/resultbox.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  static const String screenRoute = 'ProfileScreen';
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late Future<DocumentSnapshot<Map<String, dynamic>>> _userDataFuture;

  @override
  void initState() {
    super.initState();
    final uid = FirebaseAuth.instance.currentUser?.uid;
    _userDataFuture =
        FirebaseFirestore.instance
            .collection('User') // إذا كنت استعملت 'User' فعدّل الاسم هنا
            .doc(uid)
            .get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
        future: _userDataFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || !snapshot.data!.exists) {
            return const Center(
              child: Text('لم يتم العثور على بيانات المستخدم.'),
            );
          }

          final data = snapshot.data!.data()!;
          final name = data['ad_soyad'] ?? 'غير معروف';
          final age = data['yas'] ?? 'غير محدد';
          final height = data['boy'] ?? 'غير محدد';
          final weight = data['agirlik'] ?? 'غير محدد';
          final gender = data['cinsiyet'] ?? 'غير محدد';

          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.all(80),
                  child: CircleAvatar(
                    backgroundImage: AssetImage('images/calc.webp'),
                    radius: 90,
                  ),
                ),
                resultBox(
                  title: 'Ad-Soyad',
                  resultText: name,
                  firstColor: Colors.blue,
                  secondColor: Colors.lightBlueAccent,
                  thirdColor: Colors.white,
                  icon: Icons.person,
                ),
                resultBox(
                  title: 'Yaş',
                  resultText: age.toString(),
                  firstColor: Colors.cyan,
                  secondColor: Colors.cyanAccent,
                  thirdColor: Colors.white,
                  icon: Icons.cake,
                ),
                resultBox(
                  title: 'Boy',
                  resultText: height.toString(),
                  firstColor: Colors.green,
                  secondColor: Colors.greenAccent,
                  thirdColor: Colors.white,
                  icon: Icons.height,
                ),
                resultBox(
                  title: 'Ağırlık',
                  resultText: weight.toString(),
                  firstColor: Colors.red,
                  secondColor: Colors.redAccent,
                  thirdColor: Colors.white,
                  icon: Icons.monitor_weight,
                ),
                resultBox(
                  title: 'Cinsiyet',
                  resultText: gender,
                  firstColor: Colors.teal,
                  secondColor: Colors.tealAccent,
                  thirdColor: Colors.white,
                  icon: Icons.wc,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
