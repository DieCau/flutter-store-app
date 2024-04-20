import 'package:flutter/material.dart';
import 'package:store_app/src/design/colors.dart';


class StoreAppThemes{
  StoreAppThemes._();
  static ThemeData defaultTheme = ThemeData(
    fontFamily: 'RobotoMono',
    primaryColor: StoreAppColors.brandPrimaryColor,
    textTheme: const TextTheme(
      displayLarge:   TextStyle(fontSize: 48.0, fontWeight: FontWeight.bold, color: StoreAppColors.brandLightColor),
      displayMedium:  TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: StoreAppColors.brandLightColor),
      displaySmall:   TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: StoreAppColors.brandLightColor),
      headlineLarge:  TextStyle(fontSize: 21.0, color: StoreAppColors.brandPrimaryColor),
      bodyLarge:      TextStyle(fontSize: 14.0),
      bodyMedium:     TextStyle(fontSize: 13.0),
      bodySmall:      TextStyle(fontSize: 10.0),
    )
  );
}
