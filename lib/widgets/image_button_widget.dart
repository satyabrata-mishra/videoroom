import 'package:flutter/material.dart';
import './text_widget.dart';

GestureDetector ButtonWidget(
    double height,
    double width,
    Color color,
    String image,
    String text,
    double textSize,
    FontWeight weight,
    double borderRadius,
    Function onTap) {
  return GestureDetector(
    onTap: () {
      onTap();
    },
    child: Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      height: height,
      width: width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            image,
            height: height * 0.6,
          ),
          const SizedBox(width: 10),
          TextWidget(text, textSize, weight, 0)
        ],
      ),
    ),
  );
}
