import 'package:beslneme_pusulam/Beslenme_Pusulam.dart';
import 'package:flutter/material.dart';
import 'package:beslneme_pusulam/widgets/Colors.dart';
import 'package:beslneme_pusulam/providers/theem.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  static const String screenRoute = 'SettingScreen';
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: setting_page(), backgroundColor: AppColors.textColor);
  }
}

class setting_page extends StatefulWidget {
  const setting_page({super.key});

  @override
  State<setting_page> createState() => _setting_pageState();
}

class _setting_pageState extends State<setting_page> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    final colorProvider = Provider.of<ColorProvider>(context);
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 100),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                gradient: LinearGradient(
                  colors: [
                    colorProvider.mainColor,
                    colorProvider.secondaryColor,
                  ],
                ),
              ),
              child: TextButton.icon(
                onPressed: () {
                  _auth.signOut();
                  Navigator.pushNamed(context, BeslenmePusulam.screenRoute);
                },
                icon: Icon(Icons.logout, color: AppColors.textColor, size: 30),
                label: Text(
                  'logout',
                  style: TextStyle(fontSize: 20, color: AppColors.textColor),
                ),
              ),
            ),
          ),
          SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                gradient: LinearGradient(
                  colors: [
                    colorProvider.mainColor,
                    colorProvider.secondaryColor,
                  ],
                ),
              ),
              child: TextButton.icon(
                onPressed: () {
                  Provider.of<ColorProvider>(
                    context,
                    listen: false,
                  ).toggleTheme();
                },
                icon: Icon(Icons.color_lens, color: Colors.white, size: 30),
                label: Text(
                  'change theme',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
