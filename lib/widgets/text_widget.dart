import 'package:flutter/material.dart';

Text TextWidget(
    String s, double size, FontWeight weight, double letterSpacing) {
  return Text(
    s,
    textAlign: TextAlign.center,
    style: TextStyle(
      fontWeight: weight,
      fontSize: size,
      letterSpacing: letterSpacing,
    ),
  );
}
