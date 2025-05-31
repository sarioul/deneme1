import 'package:beslneme_pusulam/profile.dart';
import 'package:beslneme_pusulam/providers/theem.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/home_screen.dart';
import 'screens/settings_screen.dart';

class NavScreen extends StatefulWidget {
  static const String screenRoute = 'NavScreen';
  @override
  _NavScreenState createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [HomeScreen(), SettingsScreen(), ProfileScreen()];

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    final colorProvider = Provider.of<ColorProvider>(context);
    return Scaffold(
      body: IndexedStack(index: _selectedIndex, children: _pages),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedIconTheme: IconThemeData(size: 40 + 8),
        unselectedIconTheme: IconThemeData(size: 40),
        selectedItemColor: colorProvider.mainColor,
        unselectedItemColor: colorProvider.secondaryColor,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
