import 'package:beslneme_pusulam/widgets/Colors.dart';
import 'package:flutter/material.dart';

class ColorProvider extends ChangeNotifier {
  bool _isRedTheme = true;

  // الوصول للألوان حسب الحالة
  Color get mainColor => _isRedTheme ? _redMain : _blueMain;
  Color get secondaryColor => _isRedTheme ? _redSecondary : _blueSecondary;
  Color get backgroundColor => _isRedTheme ? Colors.white : Colors.white;

  // تغيير الوضع
  void toggleTheme() {
    _isRedTheme = !_isRedTheme;
    notifyListeners();
  }

  // ألوان الوضع الأحمر
  static const Color _redMain = AppColors.redcolor; // الأحمر الأساسي
  static const Color _redSecondary = AppColors.bordcolor; // أحمر فاتح

  // ألوان الوضع الأزرق
  static const Color _blueMain = Color(0xFF1E88E5); // الأزرق الأساسي
  static const Color _blueSecondary = Color.fromARGB(
    255,
    0,
    57,
    122,
  ); // أزرق فاتح
}
