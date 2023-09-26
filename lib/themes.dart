import 'package:flutter/material.dart';

ThemeData appLightMode() {
  return ThemeData(
      colorScheme: const ColorScheme.light().copyWith(
    primary: const Color.fromARGB(255, 166, 127, 211),
  ));
}
