import 'package:flutter/material.dart';

ColorCard(int orderstatus) {
  switch (orderstatus) {
    case 1:
      return const Color.fromARGB(255, 255, 255, 255);
    case 2:
      return const Color.fromARGB(201, 166, 255, 221);
    case 3:
      return const Color.fromARGB(255, 255, 162, 162);
    case 4:
      return const Color.fromARGB(255, 255, 209, 183);
    case 5:
      return const Color.fromARGB(236, 216, 255, 200);
    case 6:
      return const Color.fromARGB(222, 255, 185, 185);
    case 7:
      return const Color.fromARGB(243, 255, 147, 147);
    case 8:
      return const Color.fromARGB(243, 224, 255, 186);
    case 9:
      return const Color.fromARGB(243, 196, 255, 250);
    case 10:
      return const Color.fromARGB(243, 206, 255, 190);
    case 11:
      return const Color.fromARGB(243, 255, 191, 191);
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
      return "กำลังดำเนินการ";
    case 6:
      return "ยกเลิกคำสั่งซื้อ";
    case 7:
      return "ยกเลิกการจัดส่งสินค้า";
    case 8:
      return "กำลังจัดส่ง";
    case 9:
      return "ชำระเงินคงเหลือเรียบร้อยแล้ว";
    case 10:
      return "จัดส่งสำเร็จ";
    case 11:
      return "หลักฐานการโอนไม่ต้องถูกต้อง";
  }
}

IconStatus(int orderstatus) {
  switch (orderstatus) {
    case 1:
      // ignore: prefer_const_constructors
      return Icon(Icons.watch_later_outlined,
          size: 70, color: const Color.fromARGB(255, 110, 110, 110));
    case 2:
      return const Icon(Icons.verified_rounded,
          size: 70, color: const Color.fromARGB(255, 72, 255, 0));
    case 3:
      return const Icon(
        Icons.cancel_presentation_rounded,
        size: 70,
        color: const Color.fromARGB(255, 255, 0, 0),
      );
    case 4:
      return const Icon(Icons.hourglass_top_rounded,
          size: 70, color: const Color.fromARGB(255, 255, 196, 35));
    case 5:
      return const Icon(Icons.offline_pin,
          size: 70, color: const Color.fromARGB(255, 86, 255, 19));
    case 6:
      return const Icon(Icons.cancel,
          size: 70, color: Color.fromARGB(255, 255, 0, 0));
    case 7:
      return const Icon(Icons.cancel_schedule_send,
          size: 70, color: Color.fromARGB(255, 255, 25, 25));
    case 8:
      return const Icon(Icons.delivery_dining_sharp,
          size: 70, color: Color.fromARGB(255, 255, 204, 64));
    case 9:
      return const Icon(Icons.price_check,
          size: 70, color: Color.fromARGB(255, 0, 208, 3));
    case 10:
      return const Icon(Icons.check_circle_rounded,
          size: 70, color: Color.fromARGB(255, 30, 255, 0));
    case 11:
      return const Icon(Icons.refresh_outlined,
          size: 70, color: Color.fromARGB(255, 255, 0, 0));
  }
}

IconStatus1(int orderstatus) {
  switch (orderstatus) {
    case 1:
      return const Icon(Icons.watch_later_outlined,
          size: 45, color: const Color.fromARGB(255, 110, 110, 110));
    case 2:
      return const Icon(Icons.verified_rounded,
          size: 45, color: const Color.fromARGB(255, 72, 255, 0));
    case 3:
      return const Icon(
        Icons.cancel_outlined,
        size: 45,
        color: const Color.fromARGB(255, 255, 0, 0),
      );
    case 4:
      return const Icon(Icons.hourglass_top_rounded,
          size: 45, color: const Color.fromARGB(255, 255, 199, 44));
    case 5:
      return const Icon(Icons.offline_pin,
          size: 45, color: const Color.fromARGB(255, 86, 255, 19));
    case 6:
      return const Icon(Icons.cancel,
          size: 45, color: Color.fromARGB(255, 255, 0, 0));
    case 7:
      return const Icon(Icons.cancel_schedule_send,
          size: 45, color: Color.fromARGB(255, 255, 25, 25));
    case 8:
      return const Icon(Icons.delivery_dining_sharp,
          size: 45, color: Color.fromARGB(255, 255, 204, 64));
    case 9:
      return const Icon(Icons.price_check,
          size: 45, color: Color.fromARGB(255, 0, 208, 3));
    case 10:
      return const Icon(Icons.check_circle_rounded,
          size: 45, color: Color.fromARGB(255, 30, 255, 0));
    case 11:
      return const Icon(Icons.refresh_outlined,
          size: 45, color: Color.fromARGB(255, 255, 0, 0));
  }
}
