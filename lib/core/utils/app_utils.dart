import 'package:flutter/material.dart';

class AppUtils {
  static Color getColorFromName(String colorName) {
    switch (colorName) {
      case 'black':
        return Colors.black;
      case 'blue':
        return Colors.blue;
      case 'brown':
        return Colors.brown;
      case 'gray':
        return Colors.grey;
      case 'green':
        return Colors.green;
      case 'pink':
        return Colors.pink;
      case 'purple':
        return Colors.purple;
      case 'red':
        return Colors.red;
      case 'white':
        return Colors.white;
      case 'yellow':
        return Colors.yellow;
      default:
        return Colors.grey;
    }
  }

  static double decimeterToMeter(int decimeters) {
    return decimeters / 10.0;
  }

  static double hectogramToKilogram(int hectograms) {
    return hectograms / 10.0;
  }
}
