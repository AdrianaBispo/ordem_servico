import 'package:flutter/material.dart';
import 'app_color.dart';

class AppTextStyle {
  static AppTextStyle? _instance;
  AppTextStyle._();

  static AppTextStyle get instance {
    _instance = AppTextStyle._();
    return _instance!;
  }

  TextStyle? textButton = TextStyle(
    color: AppColor.instance.white,
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );

  
  TextStyle? textButtonSecondary = TextStyle(
    color: AppColor.instance.white,
    fontSize: 18,
    fontWeight: FontWeight.normal,
  );

  TextStyle? appBar = TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: 20,
    color: AppColor.instance.black,
  );
  TextStyle? textInputHint = TextStyle(
    color: AppColor.instance.black50,
    fontSize: 14,
    fontWeight: FontWeight.normal,
  );
  
  TextStyle? textInputTitle = TextStyle(
    color: AppColor.instance.black,
    fontSize: 14,
    fontWeight: FontWeight.normal,
  );
}
