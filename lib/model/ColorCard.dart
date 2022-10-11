import 'package:flutter/cupertino.dart';

ColorCard(int orderstatus) {
  switch (orderstatus) {
    case 1:
      return Color.fromARGB(255, 255, 255, 255);
    case 2:
      return Color.fromARGB(255, 174, 255, 254);
    case 3:
      return Color.fromARGB(255, 255, 151, 90);
    case 4:
      return Color.fromARGB(255, 255, 89, 80);
    case 5:
      return Color.fromARGB(255, 146, 255, 103);
  }
}
