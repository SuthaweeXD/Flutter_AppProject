import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

ColorCard(int orderstatus) {
  switch (orderstatus) {
    case 1:
      return Color.fromARGB(255, 255, 255, 255);
    case 2:
      return Color.fromARGB(202, 121, 255, 204);
    case 3:
      return Color.fromARGB(255, 255, 134, 134);
    case 4:
      return Color.fromARGB(255, 255, 196, 162);
    case 5:
      return Color.fromARGB(237, 199, 255, 176);
    case 6:
      return Color.fromARGB(243, 255, 120, 120);
  }
}

ColorStatus(int orderstatus) {
  switch (orderstatus) {
    case 1:
      return "รอรับคำสั่งซื้อ";
    case 2:
      return "ยืนยันรับคำสั่งซื้อ";
    case 3:
      return "ปฏิเสธรับคำสั่งซื้อ";
    case 4:
      return "รอยืนยันการโอนชำระค่ามัดจำ";
    case 5:
      return "ชำระเงินเรียบร้อย กำลังดำเนินการ";
    case 6:
      return "ยกเลิกคำสั่งซื้อ";
  }
}

IconStatus(int orderstatus) {
  switch (orderstatus) {
    case 1:
      // ignore: prefer_const_constructors
      return Icon(Icons.watch_later_outlined,
          size: 70, color: Color.fromARGB(255, 110, 110, 110));
    case 2:
      return Icon(Icons.verified_rounded,
          size: 70, color: Color.fromARGB(255, 72, 255, 0));
    case 3:
      return Icon(
        Icons.cancel_presentation_rounded,
        size: 70,
        color: Color.fromARGB(255, 255, 0, 0),
      );
    case 4:
      return Icon(Icons.hourglass_top_rounded,
          size: 70, color: Color.fromARGB(255, 255, 196, 35));
    case 5:
      return Icon(Icons.offline_pin,
          size: 70, color: Color.fromARGB(255, 86, 255, 19));
    case 6:
      return Icon(Icons.cancel,
          size: 70, color: Color.fromARGB(255, 255, 0, 0));
  }
}

IconStatus1(int orderstatus) {
  switch (orderstatus) {
    case 1:
      // ignore: prefer_const_constructors
      return Icon(Icons.watch_later_outlined,
          size: 45, color: Color.fromARGB(255, 110, 110, 110));
    case 2:
      return Icon(Icons.verified_rounded,
          size: 45, color: Color.fromARGB(255, 72, 255, 0));
    case 3:
      return Icon(
        Icons.cancel_outlined,
        size: 45,
        color: Color.fromARGB(255, 255, 0, 0),
      );
    case 4:
      return Icon(Icons.hourglass_top_rounded,
          size: 45, color: Color.fromARGB(255, 255, 196, 35));
    case 5:
      return Icon(Icons.offline_pin,
          size: 45, color: Color.fromARGB(255, 86, 255, 19));
    case 6:
      return Icon(Icons.cancel,
          size: 45, color: Color.fromARGB(255, 255, 0, 0));
  }
}
