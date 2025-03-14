import 'package:flutter/material.dart';
import 'app_color.dart';
import 'app_textstyle.dart';

class AppTheme {
  static ThemeData get theme {
    return ThemeData(
      scaffoldBackgroundColor: AppColor.instance.white,
      appBarTheme: AppBarTheme(
        color: AppColor.instance.white,
        shadowColor: null,
        titleTextStyle: AppTextStyle.instance.appBar,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: AppColor.instance.cinza,
        hintStyle: AppTextStyle.instance.textInputHint,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 16.0, horizontal: 10),
      ),
      dropdownMenuTheme: DropdownMenuThemeData(
        inputDecorationTheme: InputDecorationTheme(
          fillColor: AppColor.instance.cinza,
          filled: true,
          focusColor: AppColor.instance.cinza,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: BorderSide.none,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: BorderSide.none,
          ),
        ),
      ),
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: AppColor.instance.black50,
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          backgroundColor: AppColor.instance.primary,
          minimumSize: const Size(double.infinity, 50),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
      ),
    );
  }
}
