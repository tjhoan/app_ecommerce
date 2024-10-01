import 'package:flutter/material.dart';
import 'package:project_s6_mobile/utils/theme/custom_themes/appbar_theme.dart';
import 'package:project_s6_mobile/utils/theme/custom_themes/buttom_sheet_theme.dart';
import 'package:project_s6_mobile/utils/theme/custom_themes/checkbox_theme.dart';
import 'package:project_s6_mobile/utils/theme/custom_themes/chip_theme.dart';
import 'package:project_s6_mobile/utils/theme/custom_themes/elevated_button_theme.dart';
import 'package:project_s6_mobile/utils/theme/custom_themes/outlined_button_theme.dart';
import 'package:project_s6_mobile/utils/theme/custom_themes/text_field_theme.dart';
import 'package:project_s6_mobile/utils/theme/custom_themes/text_theme.dart';

class TAppTheme {
  TAppTheme._();

  // Tema Claro
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    textTheme: TTextTheme.lightTextTheme,
    chipTheme: TChipTheme.lightChipTheme,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: TAppBarTheme.lightAppBarTheme,
    checkboxTheme: TCheckboxTheme.lightCheckboxTheme,
    bottomSheetTheme: TBottomSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.lightTextFormFieldTheme,
  );

  // Tema Oscuro
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    textTheme: TTextTheme.darkTextTheme,
    chipTheme: TChipTheme.darkChipTheme,
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: TAppBarTheme.darkAppBarTheme,
    checkboxTheme: TCheckboxTheme.darkCheckboxTheme,
    bottomSheetTheme: TBottomSheetTheme.darkBottomSheetTheme,
    elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.darkTextFormFieldTheme,
  );
}