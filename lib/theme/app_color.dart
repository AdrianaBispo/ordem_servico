import 'package:flutter/material.dart';

class AppColor {
  static AppColor? _instance;
  AppColor._();

  static AppColor get instance {
    _instance ??= AppColor._();
    return _instance!;
  }

  Color get primary => const Color(0xFF5997E2);
  Color get black => Colors.black;
  Color get black50 => const Color.fromRGBO(0, 0, 0, 0.5);
  Color get white => Colors.white;
  Color get cinza => const Color(0xFFECF0F1);
}
