import 'package:beslneme_pusulam/providers/theem.dart';
import 'package:beslneme_pusulam/widgets/Colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyTextFeild extends StatelessWidget {
  const MyTextFeild({
    Key? key,
    required this.WhatController,
    required this.hintText,
    required this.labelText,
    required this.labelColor,
    required this.borderColor,
    required this.textInputType,
    required this.textColor,
  });

  final TextEditingController WhatController;
  final String hintText;
  final String labelText;
  final Color borderColor;
  final Color textColor;
  final Color labelColor;
  final TextInputType textInputType;

  @override
  Widget build(BuildContext context) {
    final colorProvider = Provider.of<ColorProvider>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 25),
      child: TextField(
        controller: WhatController,
        keyboardType: textInputType,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(color: colorProvider.mainColor),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.bordcolor, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: colorProvider.mainColor, width: 2),
          ),
        ),
      ),
    );
  }
}

/*
import 'package:flutter/material.dart';

class MyTextFeild extends StatefulWidget {
  const MyTextFeild({
    Key? key,
    required this.WhatController,
    required this.hintText,
    required this.labelText,
    required this.labelColor,
    required this.borderColor,
    required this.textInputType,
    required this.textColor,
    required this.onValueChanged,
  }) : super(key: key);

  final TextEditingController WhatController;
  final String hintText;
  final String labelText;
  final Color borderColor;
  final Color textColor;
  final Color labelColor;
  final TextInputType textInputType;
  final Function(int) onValueChanged; // 👈 تمرير القيمة للخارج عند التغيير

  @override
  State<MyTextFeild> createState() => _MyTextFeildState();
}

class _MyTextFeildState extends State<MyTextFeild> {
  int enteredValue = 0;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.WhatController,
      keyboardType: widget.textInputType,
      onChanged: (value) {
        try {
          enteredValue = int.parse(value);
          widget.onValueChanged(enteredValue); // 👈 إرسال القيمة للخارج
        } catch (e) {
          // يمكنك تجاهل أو التعامل مع الخطأ هنا حسب الحاجة
        }
      },
      decoration: InputDecoration(
        hintText: widget.hintText,
        labelText: widget.labelText,
        labelStyle: TextStyle(color: widget.labelColor),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: widget.borderColor, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: widget.borderColor, width: 2),
        ),
      ),
    );
  }
}
*/
