import 'package:flutter/material.dart';

class Orders extends StatefulWidget {
  @override
  _OrdersState createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  @override
  Widget build(BuildContext context) {
    TextEditingController type_product = TextEditingController();

    return Scaffold(
        body: Stack(children: <Widget>[
      Positioned(
          top: 160,
          left: 8,
          child: Container(
              width: 210,
              height: 210,
              decoration: const BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: const Radius.circular(36),
                  topRight: const Radius.circular(36),
                  bottomLeft: Radius.circular(36),
                  bottomRight: Radius.circular(36),
                ),
                image: const DecorationImage(
                    image: const AssetImage('assets/images/Rectangle1.png'),
                    fit: BoxFit.fitWidth),
              ))),
      Positioned(
          top: 160,
          left: 226,
          child: Container(
              width: 210,
              height: 210,
              decoration: const BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: const Radius.circular(36),
                  topRight: const Radius.circular(36),
                  bottomLeft: const Radius.circular(36),
                  bottomRight: Radius.circular(36),
                ),
                image: const DecorationImage(
                    image: const AssetImage('assets/images/Rectangle2.png'),
                    fit: BoxFit.fitWidth),
              ))),
      Positioned(
          top: 160,
          left: 443,
          child: Container(
              width: 210,
              height: 210,
              decoration: const BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(36),
                  topRight: Radius.circular(36),
                  bottomLeft: Radius.circular(36),
                  bottomRight: Radius.circular(36),
                ),
                image: DecorationImage(
                    image: AssetImage('assets/images/Rectangle3.png'),
                    fit: BoxFit.fitWidth),
              ))),
      Positioned(
          top: 376,
          left: 72,
          child: Container(
              width: 99,
              height: 51,
              decoration: const BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: const Radius.circular(3),
                  topRight: Radius.circular(3),
                  bottomLeft: Radius.circular(3),
                  bottomRight: Radius.circular(3),
                ),
                color: const Color.fromRGBO(121, 239, 81, 1),
              ))),
      Positioned(
          top: 376,
          left: 293,
          child: Container(
              width: 99,
              height: 51,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(3),
                  topRight: Radius.circular(3),
                  bottomLeft: Radius.circular(3),
                  bottomRight: Radius.circular(3),
                ),
                color: Color.fromRGBO(121, 239, 81, 1),
              ))),
      Positioned(
          top: 368,
          left: 508,
          child: Container(
              width: 99,
              height: 51,
              decoration: const BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: const Radius.circular(3),
                  topRight: const Radius.circular(3),
                  bottomLeft: const Radius.circular(3),
                  bottomRight: Radius.circular(3),
                ),
                color: const Color.fromRGBO(121, 239, 81, 1),
              ))),
      Positioned(
          top: 486,
          left: 159,
          child: Container(
              width: 135,
              height: 42,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(255, 255, 255, 1),
                border: Border.all(
                  color: const Color.fromRGBO(0, 0, 0, 1),
                  width: 1,
                ),
              ))),
      Positioned(
          top: 559,
          left: 159,
          child: Container(
              width: 135,
              height: 42,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(255, 255, 255, 1),
                border: Border.all(
                  color: const Color.fromRGBO(0, 0, 0, 1),
                  width: 1,
                ),
              ))),
      const Positioned(
          top: 387,
          left: 84,
          child: const Text(
            'เส้นเล็ก',
            textAlign: TextAlign.left,
            style: TextStyle(
                color: Color.fromRGBO(0, 0, 0, 1),
                fontFamily: 'Roboto',
                fontSize: 24,
                letterSpacing:
                    0 /*percentages not used in flutter. defaulting to zero*/,
                fontWeight: FontWeight.normal,
                height: 1),
          )),
      const Positioned(
          top: 387,
          left: 299,
          child: const Text(
            'เส้นใหญ่',
            textAlign: TextAlign.left,
            style: TextStyle(
                color: Color.fromRGBO(0, 0, 0, 1),
                fontFamily: 'Roboto',
                fontSize: 24,
                letterSpacing:
                    0 /*percentages not used in flutter. defaulting to zero*/,
                fontWeight: FontWeight.normal,
                height: 1),
          )),
      const Positioned(
          top: 379,
          left: 514,
          child: Text(
            'เส้นม้วน',
            textAlign: TextAlign.left,
            style: TextStyle(
                color: Color.fromRGBO(0, 0, 0, 1),
                fontFamily: 'Roboto',
                fontSize: 24,
                letterSpacing:
                    0 /*percentages not used in flutter. defaulting to zero*/,
                fontWeight: FontWeight.normal,
                height: 1),
          )),
      Positioned(
          top: 737,
          left: 64,
          child: Container(
              width: 413,
              height: 180,
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color.fromRGBO(114, 114, 114, 1),
                  width: 3,
                ),
                image: const DecorationImage(
                    image: const AssetImage('assets/images/Rectangle7.png'),
                    fit: BoxFit.fitWidth),
              ))),
      const Positioned(
          top: 495,
          left: 73,
          child: const Text(
            'เส้นเล็ก',
            textAlign: TextAlign.left,
            style: const TextStyle(
                color: Color.fromRGBO(0, 0, 0, 1),
                fontFamily: 'Roboto',
                fontSize: 18,
                letterSpacing:
                    0 /*percentages not used in flutter. defaulting to zero*/,
                fontWeight: FontWeight.normal,
                height: 1),
          )),
      const Positioned(
          top: 568,
          left: 73,
          child: const Text(
            'เส้นใหญ่',
            textAlign: TextAlign.left,
            style: TextStyle(
                color: Color.fromRGBO(0, 0, 0, 1),
                fontFamily: 'Roboto',
                fontSize: 18,
                letterSpacing:
                    0 /*percentages not used in flutter. defaulting to zero*/,
                fontWeight: FontWeight.normal,
                height: 1),
          )),
      const Positioned(
          top: 641,
          left: 73,
          child: const Text(
            'เส้นม้วน',
            textAlign: TextAlign.left,
            style: TextStyle(
                color: Color.fromRGBO(0, 0, 0, 1),
                fontFamily: 'Roboto',
                fontSize: 18,
                letterSpacing:
                    0 /*percentages not used in flutter. defaulting to zero*/,
                fontWeight: FontWeight.normal,
                height: 1),
          )),
      const Positioned(
          top: 496,
          left: 321,
          child: Text(
            'กิโลกรัม',
            textAlign: TextAlign.left,
            style: TextStyle(
                color: Color.fromRGBO(0, 0, 0, 1),
                fontFamily: 'Roboto',
                fontSize: 18,
                letterSpacing:
                    0 /*percentages not used in flutter. defaulting to zero*/,
                fontWeight: FontWeight.normal,
                height: 1),
          )),
      const Positioned(
          top: 568,
          left: 321,
          child: const Text(
            'กิโลกรัม',
            textAlign: TextAlign.left,
            style: const TextStyle(
                color: const Color.fromRGBO(0, 0, 0, 1),
                fontFamily: 'Roboto',
                fontSize: 18,
                letterSpacing:
                    0 /*percentages not used in flutter. defaulting to zero*/,
                fontWeight: FontWeight.normal,
                height: 1),
          )),
      const Positioned(
          top: 641,
          left: 321,
          child: const Text(
            'กิโลกรัม',
            textAlign: TextAlign.left,
            style: const TextStyle(
                color: Color.fromRGBO(0, 0, 0, 1),
                fontFamily: 'Roboto',
                fontSize: 18,
                letterSpacing:
                    0 /*percentages not used in flutter. defaulting to zero*/,
                fontWeight: FontWeight.normal,
                height: 1),
          )),
      Positioned(
          top: 1029,
          left: 255,
          child: Container(
            width: 227,
            height: 42,
            child: Column(
              children: [
                TextFormField(
                    controller: type_product,
                    style: const TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0), fontSize: 10),
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      hintText: 'ระบุจำนวน...',
                      hintStyle:
                          TextStyle(color: Color.fromARGB(255, 159, 158, 158)),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 23, 158, 237),
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 23, 158, 237),
                              width: 2),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                    )),
              ],
            ),
          )),
      Positioned(
          top: 1182,
          left: 225,
          child: Container(
              width: 182,
              height: 76,
              decoration: const BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: const Radius.circular(10),
                  topRight: const Radius.circular(10),
                  bottomLeft: const Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                color: const Color.fromRGBO(87, 172, 86, 1),
              ))),
      const Positioned(
          top: 1038,
          left: 66,
          child: const Text(
            'ราคาสินค้าทั้งหมด',
            textAlign: TextAlign.left,
            style: TextStyle(
                color: Color.fromRGBO(0, 0, 0, 1),
                fontFamily: 'Roboto',
                fontSize: 24,
                letterSpacing:
                    0 /*percentages not used in flutter. defaulting to zero*/,
                fontWeight: FontWeight.normal,
                height: 1),
          )),
      const Positioned(
          top: 1040,
          left: 508,
          child: Text(
            'บาท',
            textAlign: TextAlign.left,
            style: TextStyle(
                color: Color.fromRGBO(0, 0, 0, 1),
                fontFamily: 'Roboto',
                fontSize: 24,
                letterSpacing:
                    0 /*percentages not used in flutter. defaulting to zero*/,
                fontWeight: FontWeight.normal,
                height: 1),
          )),
      Positioned(
          top: 1092,
          left: 253,
          child: Container(
              width: 227,
              height: 42,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(255, 255, 255, 1),
                border: Border.all(
                  color: const Color.fromRGBO(0, 0, 0, 1),
                  width: 3,
                ),
              ))),
      const Positioned(
          top: 1101,
          left: 64,
          child: Text(
            'ค่ามัดจำ',
            textAlign: TextAlign.left,
            style: TextStyle(
                color: Color.fromRGBO(0, 0, 0, 1),
                fontFamily: 'Roboto',
                fontSize: 24,
                letterSpacing:
                    0 /*percentages not used in flutter. defaulting to zero*/,
                fontWeight: FontWeight.normal,
                height: 1),
          )),
      const Positioned(
          top: 1103,
          left: 506,
          child: const Text(
            'บาท',
            textAlign: TextAlign.left,
            style: const TextStyle(
                color: const Color.fromRGBO(0, 0, 0, 1),
                fontFamily: 'Roboto',
                fontSize: 24,
                letterSpacing:
                    0 /*percentages not used in flutter. defaulting to zero*/,
                fontWeight: FontWeight.normal,
                height: 1),
          )),
      Positioned(
          top: 0,
          left: 0,
          child: Container(
              width: 658,
              height: 65,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(0, 156, 191, 0.7200000286102295),
              ))),
      const Positioned(
          top: 1191,
          left: 270,
          child: const Text(
            'ถัดไป',
            textAlign: TextAlign.left,
            style: TextStyle(
                color: Color.fromRGBO(255, 255, 255, 1),
                fontFamily: 'Roboto',
                fontSize: 48,
                letterSpacing:
                    0 /*percentages not used in flutter. defaulting to zero*/,
                fontWeight: FontWeight.normal,
                height: 1),
          )),
      Positioned(
          top: 10,
          left: 591,
          child: Container(
              width: 52,
              height: 52,
              decoration: const BoxDecoration(
                color: const Color.fromRGBO(255, 0, 0, 1),
                borderRadius:
                    const BorderRadius.all(const Radius.elliptical(52, 52)),
              ))),
      const Positioned(
          top: 6,
          left: 604,
          child: const Text(
            'x',
            textAlign: TextAlign.left,
            style: const TextStyle(
                color: Color.fromRGBO(255, 255, 255, 1),
                fontFamily: 'Roboto',
                fontSize: 48,
                letterSpacing:
                    0 /*percentages not used in flutter. defaulting to zero*/,
                fontWeight: FontWeight.normal,
                height: 1),
          )),
      const Positioned(
          top: 948,
          left: 64,
          child: const Text(
            'วันที่สั่งคำสั่งซื้อ',
            textAlign: TextAlign.left,
            style: TextStyle(
                color: Color.fromRGBO(0, 0, 0, 1),
                fontFamily: 'Roboto',
                fontSize: 18,
                letterSpacing:
                    0 /*percentages not used in flutter. defaulting to zero*/,
                fontWeight: FontWeight.normal,
                height: 1),
          )),
      const Positioned(
          top: 708,
          left: 64,
          child: const Text(
            'วันที่รับคำสั่งซื้อ',
            textAlign: TextAlign.left,
            style: TextStyle(
                color: Color.fromRGBO(0, 0, 0, 1),
                fontFamily: 'Roboto',
                fontSize: 18,
                letterSpacing:
                    0 /*percentages not used in flutter. defaulting to zero*/,
                fontWeight: FontWeight.normal,
                height: 1),
          )),
      const Positioned(
          top: 94,
          left: 24,
          child: Text(
            'สั่งซื้อสินค้า',
            textAlign: TextAlign.left,
            style: TextStyle(
                color: Color.fromRGBO(0, 0, 0, 1),
                fontFamily: 'Roboto',
                fontSize: 24,
                letterSpacing:
                    0 /*percentages not used in flutter. defaulting to zero*/,
                fontWeight: FontWeight.normal,
                height: 1),
          )),
      const Positioned(
          top: 948,
          left: 217,
          child: const Text(
            'วว/ดด/ปป',
            textAlign: TextAlign.left,
            style: const TextStyle(
                color: Color.fromRGBO(0, 0, 0, 1),
                fontFamily: 'Roboto',
                fontSize: 18,
                letterSpacing:
                    0 /*percentages not used in flutter. defaulting to zero*/,
                fontWeight: FontWeight.normal,
                height: 1),
          )),
      Positioned(
          top: 6,
          left: 514,
          child: Container(
              width: 61,
              height: 58,
              decoration: const BoxDecoration(
                image: const DecorationImage(
                    image: const AssetImage('assets/images/Ellipse2.png'),
                    fit: BoxFit.fitWidth),
                borderRadius: const BorderRadius.all(Radius.elliptical(61, 58)),
              ))),
    ]));
  }
}
