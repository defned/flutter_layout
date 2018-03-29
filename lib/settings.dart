import 'package:flutter/material.dart';

class AppColors {
  final Color backgroundColor = new Color(0xFF251829);
  final Color backgroundAccentColor = new Color(0xFF4b3053);
  final Color buttonColor = new Color(0xFFFd5fb5);
  final Color buttonAccentColor = new Color(0xFFEE8AE1);
  final Color headerIconColor = new Color(0xFF7A4E87);

  static final bluePrimaryValue = 0xFF024EFD;

  final MaterialColor blue = new MaterialColor(
    bluePrimaryValue,
    <int, Color>{
      50: const Color(0xFFe0e0e0),
      100: const Color(0xFFb3b3b3),
      200: const Color(0xFF808080),
      300: const Color(0xFF4d4d4d),
      400: const Color(0xFF262626),
      500: new Color(bluePrimaryValue),
      600: const Color(0xFF000000),
      700: const Color(0xFF000000),
      800: const Color(0xFF000000),
      900: const Color(0xFF000000),
    },
  );
}


class Settings {
  static AppColors colors = new AppColors();
  static final String graphqlEndpoint = "http://django-public-eflyr-django.193b.starter-ca-central-1.openshiftapps.com/graphql";
  //static final String graphqlEndpoint = "http://localhost:8000/graphql";
}