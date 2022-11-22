import 'package:flutter/material.dart';

class PaletteLight {
  static const MaterialColor primaryColor = AppColors.wiggliPrimaryColor;
}

class AppColors {
  static const wiggliPrimaryColor = MaterialColor(
    0xffff6849, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    <int, Color>{
      50: Color(0xffF3CAC7), //10%
      100: Color(0xffF5BFB9), //20%
      200: Color(0xffF6B5AC), //30%
      300: Color(0xffF7AA9D), //40%
      400: Color(0xffF99E8E), //50%
      500: Color(0xffFA9381), //60%
      600: Color(0xffFB8973), //70%
      700: Color(0xffFC7E65), //80%
      800: Color(0xffFE7458), //90%
      900: Color(0xffff6849), //100%
    },
  );
}
