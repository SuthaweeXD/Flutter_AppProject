import 'package:flutter/material.dart';
// import 'advertise.dart';
// import 'status_update.dart';

class EmplMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: <Widget>[
      Positioned(
          top: 0,
          left: 0,
          child: Container(
              width: 20,
              height: 65,
              decoration: BoxDecoration(
                color: Color.fromRGBO(0, 156, 191, 0.7200000286102295),
              ))),
      Positioned(
          top: 10,
          left: 591,
          child: Container(
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                color: Color.fromRGBO(255, 0, 0, 1),
                borderRadius: BorderRadius.all(Radius.elliptical(52, 52)),
              ))),
      Positioned(
          top: 6,
          left: 604,
          child: Text(
            'x',
            textAlign: TextAlign.left,
            style: TextStyle(
                color: Color.fromRGBO(255, 255, 255, 1),
                fontFamily: 'Roboto',
                fontSize: 12,
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
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/Ellipse2.png'),
                    fit: BoxFit.fitWidth),
                borderRadius: BorderRadius.all(Radius.elliptical(61, 58)),
              ))),
      Positioned(
          top: 96,
          left: 15,
          child: Text(
            'สำหรับพนักงาน',
            textAlign: TextAlign.left,
            style: TextStyle(
                color: Color.fromRGBO(0, 0, 0, 1),
                fontFamily: 'Roboto',
                fontSize: 48,
                letterSpacing:
                    0 /*percentages not used in flutter. defaulting to zero*/,
                fontWeight: FontWeight.normal,
                height: 1),
          )),
      Positioned(
          top: 228,
          left: 92,
          child: Container(
              width: 473,
              height: 96,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                color: Color.fromRGBO(81, 239, 97, 1),
                border: Border.all(
                  color: Color.fromRGBO(0, 0, 0, 1),
                  width: 1,
                ),
              ))),
      Positioned(
          top: 463,
          left: 92,
          child: Container(
              width: 473,
              height: 95,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                color: Color.fromRGBO(245, 78, 148, 1),
                border: Border.all(
                  color: Color.fromRGBO(0, 0, 0, 1),
                  width: 1,
                ),
              ))),
      Positioned(
          top: 349,
          left: 92,
          child: Container(
              width: 473,
              height: 96,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                color: Color.fromRGBO(255, 122, 0, 0.7200000286102295),
                border: Border.all(
                  color: Color.fromRGBO(0, 0, 0, 1),
                  width: 1,
                ),
              ))),
      Positioned(
          top: 704,
          left: 93,
          child: Container(
              width: 473,
              height: 96,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                color: Color.fromRGBO(10, 23, 26, 0.7200000286102295),
                border: Border.all(
                  color: Color.fromRGBO(0, 0, 0, 1),
                  width: 1,
                ),
              ))),
      Positioned(
          top: 583,
          left: 92,
          child: Container(
              width: 473,
              height: 96,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                color: Color.fromRGBO(184, 70, 70, 1),
                border: Border.all(
                  color: Color.fromRGBO(0, 0, 0, 1),
                  width: 1,
                ),
              ))),
      Positioned(
          top: 254,
          left: 143,
          child: Text(
            'จัดการข้อมูลประชาสัมพันธ์',
            textAlign: TextAlign.left,
            style: TextStyle(
                color: Color.fromRGBO(255, 255, 255, 1),
                fontFamily: 'Roboto',
                fontSize: 36,
                letterSpacing:
                    0 /*percentages not used in flutter. defaulting to zero*/,
                fontWeight: FontWeight.normal,
                height: 1),
          )),
      Positioned(
          top: 376,
          left: 180,
          child: Text(
            'จัดการข้อมูลสินค้า',
            textAlign: TextAlign.left,
            style: TextStyle(
                color: Color.fromRGBO(255, 255, 255, 1),
                fontFamily: 'Roboto',
                fontSize: 36,
                letterSpacing:
                    0 /*percentages not used in flutter. defaulting to zero*/,
                fontWeight: FontWeight.normal,
                height: 1),
          )),
      Positioned(
          top: 731,
          left: 163,
          child: Text(
            'ตรวจสอบการโอนชำระเงิน',
            textAlign: TextAlign.left,
            style: TextStyle(
                color: Color.fromRGBO(255, 255, 255, 1),
                fontFamily: 'Roboto',
                fontSize: 36,
                letterSpacing:
                    0 /*percentages not used in flutter. defaulting to zero*/,
                fontWeight: FontWeight.normal,
                height: 1),
          )),
      Positioned(
          top: 946,
          left: 93,
          child: Container(
              width: 473,
              height: 96,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                color: Color.fromRGBO(255, 122, 0, 0.7200000286102295),
                border: Border.all(
                  color: Color.fromRGBO(0, 0, 0, 1),
                  width: 1,
                ),
              ))),
      Positioned(
          top: 975,
          left: 110,
          child: Text(
            'ปรับปรุงสถานะการทำงานของลูกค้า',
            textAlign: TextAlign.left,
            style: TextStyle(
                color: Color.fromRGBO(255, 255, 255, 1),
                fontFamily: 'Roboto',
                fontSize: 32,
                letterSpacing:
                    0 /*percentages not used in flutter. defaulting to zero*/,
                fontWeight: FontWeight.normal,
                height: 1),
          )),
      Positioned(
          top: 1067,
          left: 92,
          child: Container(
              width: 473,
              height: 96,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                color: Color.fromRGBO(49, 191, 0, 0.7799999713897705),
                border: Border.all(
                  color: Color.fromRGBO(0, 0, 0, 1),
                  width: 1,
                ),
              ))),
      Positioned(
          top: 1096,
          left: 227,
          child: Text(
            'แสดงผลรายงาน',
            textAlign: TextAlign.left,
            style: TextStyle(
                color: Color.fromRGBO(255, 255, 255, 1),
                fontFamily: 'Roboto',
                fontSize: 36,
                letterSpacing:
                    0 /*percentages not used in flutter. defaulting to zero*/,
                fontWeight: FontWeight.normal,
                height: 1),
          )),
      Positioned(
          top: 825,
          left: 92,
          child: Container(
              width: 473,
              height: 96,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                color: Color.fromRGBO(141, 0, 191, 0.7200000286102295),
                border: Border.all(
                  color: Color.fromRGBO(0, 0, 0, 1),
                  width: 1,
                ),
              ))),
      Positioned(
          top: 854,
          left: 178,
          child: Text(
            'บันทึกการจัดส่งสินค้า',
            textAlign: TextAlign.left,
            style: TextStyle(
                color: Color.fromRGBO(255, 255, 255, 1),
                fontFamily: 'Roboto',
                fontSize: 36,
                letterSpacing:
                    0 /*percentages not used in flutter. defaulting to zero*/,
                fontWeight: FontWeight.normal,
                height: 1),
          )),
      Positioned(
          top: 489,
          left: 180,
          child: Text(
            'จัดการข้อมูลการสั่งซื้อ',
            textAlign: TextAlign.left,
            style: TextStyle(
                color: Color.fromRGBO(255, 255, 255, 1),
                fontFamily: 'Roboto',
                fontSize: 36,
                letterSpacing:
                    0 /*percentages not used in flutter. defaulting to zero*/,
                fontWeight: FontWeight.normal,
                height: 1),
          )),
      Positioned(
          top: 610,
          left: 123,
          child: Text(
            'ยืนยันและยกเลิการสั่งซื้อสินค้า',
            textAlign: TextAlign.left,
            style: TextStyle(
                color: Color.fromRGBO(255, 255, 255, 1),
                fontFamily: 'Roboto',
                fontSize: 36,
                letterSpacing:
                    0 /*percentages not used in flutter. defaulting to zero*/,
                fontWeight: FontWeight.normal,
                height: 1),
          )),
    ]));
  }
}
        
// class EmplMenu extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Padding(
//             padding: const EdgeInsets.fromLTRB(70, 30, 70, 65),
//             child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   SizedBox(
//                     height: 60,
//                     width: double.infinity,
//                     child: ElevatedButton.icon(
//                       icon: Icon(Icons.next_plan),
//                       label: Text(" จัดการข้อมูลประชาสัมพันธ์ "),
//                       style: ButtonStyle(),
//                       onPressed: () {
//                         Navigator.push(context,
//                             MaterialPageRoute(builder: (context) {
//                           return adertise();
//                         }));
//                       },
//                     ),
//                   ),
//                   SizedBox(
//                     height: 60,
//                     width: double.infinity,
//                     child: ElevatedButton.icon(
//                         icon: Icon(Icons.next_plan),
//                         label: Text("  การจัดการข้อมูลสินค้า       "),
//                         style: ButtonStyle(),
//                         onPressed: () {
//                           //   Navigator.push(context, MaterialPageRoute(builder: (context) {
//                           //     return RegisterScreen();
//                           //   }));
//                           // },
//                         }),
//                   ),
//                   SizedBox(
//                     height: 60,
//                     width: double.infinity,
//                     child: ElevatedButton.icon(
//                         icon: Icon(Icons.next_plan),
//                         label: Text("  จัดการข้อมูลการสั่งซื้อ       "),
//                         style: ButtonStyle(),
//                         onPressed: () {
//                           //   Navigator.push(context, MaterialPageRoute(builder: (context) {
//                           //     return RegisterScreen();
//                           //   }));
//                           // },
//                         }),
//                   ),
//                   SizedBox(
//                     height: 60,
//                     width: double.infinity,
//                     child: ElevatedButton.icon(
//                         icon: Icon(Icons.next_plan),
//                         label: Text("ยืนยันและยกเลิกการสั่งซื้อสินค้า"),
//                         style: ButtonStyle(),
//                         onPressed: () {
//                           //   Navigator.push(context, MaterialPageRoute(builder: (context) {
//                           //     return RegisterScreen();
//                           //   }));
//                           // },
//                         }),
//                   ),
//                   SizedBox(
//                     height: 60,
//                     width: double.infinity,
//                     child: ElevatedButton.icon(
//                         icon: Icon(Icons.next_plan),
//                         label: Text("  ตรวจสอบการโอนชำระเงิน       "),
//                         style: ButtonStyle(),
//                         onPressed: () {
//                           //   Navigator.push(context, MaterialPageRoute(builder: (context) {
//                           //     return RegisterScreen();
//                           //   }));
//                           // },
//                         }),
//                   ),
//                   SizedBox(
//                     height: 60,
//                     width: double.infinity,
//                     child: ElevatedButton.icon(
//                         icon: Icon(Icons.next_plan),
//                         label: Text("  บันทึกการจัดส่งสินค้า       "),
//                         style: ButtonStyle(),
//                         onPressed: () {
//                           //   Navigator.push(context, MaterialPageRoute(builder: (context) {
//                           //     return RegisterScreen();
//                           //   }));
//                           // },
//                         }),
//                   ),
//                   SizedBox(
//                     width: double.infinity,
//                     height: 60,
//                     child: ElevatedButton.icon(
//                       icon: Icon(Icons.next_plan),
//                       label: Text("ปรับปรุงสถานะการทำงาน        ของลูกค้า"),
//                       style: ButtonStyle(),
//                       onPressed: () {
//                         Navigator.push(context,
//                             MaterialPageRoute(builder: (context) {
//                           return Status();
//                         }));
//                       },
//                     ),
//                   ),
//                   SizedBox(
//                     height: 60,
//                     width: double.infinity,
//                     child: ElevatedButton.icon(
//                         icon: Icon(Icons.next_plan),
//                         label: Text("  แสดงผลรายงาน       "),
//                         style: ButtonStyle(),
//                         onPressed: () {
//                           //   Navigator.push(context, MaterialPageRoute(builder: (context) {
//                           //     return RegisterScreen();
//                           //   }));
//                           // },
//                         }),
//                   ),
//                 ])));
//   }
// }
