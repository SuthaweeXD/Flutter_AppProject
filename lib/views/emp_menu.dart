import 'package:flutter/material.dart';
import 'package:flutter_application_project/views/advertise.dart';
import 'package:flutter_application_project/views/ProflieUpdate.dart';

class EmplMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.fromLTRB(70, 30, 70, 65),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    height: 60,
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      icon: Icon(Icons.next_plan),
                      label: Text(" จัดการข้อมูลประชาสัมพันธ์ "),
                      style: ButtonStyle(),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const adertise();
                        }));
                      },
                    ),
                  ),
                  SizedBox(
                    height: 60,
                    width: double.infinity,
                    child: ElevatedButton.icon(
                        icon: Icon(Icons.next_plan),
                        label: Text("  การจัดการข้อมูลสินค้า       "),
                        style: ButtonStyle(),
                        onPressed: () {
                          //   Navigator.push(context, MaterialPageRoute(builder: (context) {
                          //     return RegisterScreen();
                          //   }));
                          // },
                        }),
                  ),
                  SizedBox(
                    height: 60,
                    width: double.infinity,
                    child: ElevatedButton.icon(
                        icon: Icon(Icons.next_plan),
                        label: Text("  จัดการข้อมูลการสั่งซื้อ       "),
                        style: ButtonStyle(),
                        onPressed: () {
                          //   Navigator.push(context, MaterialPageRoute(builder: (context) {
                          //     return RegisterScreen();
                          //   }));
                          // },
                        }),
                  ),
                  SizedBox(
                    height: 60,
                    width: double.infinity,
                    child: ElevatedButton.icon(
                        icon: Icon(Icons.next_plan),
                        label: Text("ยืนยันและยกเลิกการสั่งซื้อสินค้า"),
                        style: ButtonStyle(),
                        onPressed: () {
                          //   Navigator.push(context, MaterialPageRoute(builder: (context) {
                          //     return RegisterScreen();
                          //   }));
                          // },
                        }),
                  ),
                  SizedBox(
                    height: 60,
                    width: double.infinity,
                    child: ElevatedButton.icon(
                        icon: Icon(Icons.next_plan),
                        label: Text("  ตรวจสอบการโอนชำระเงิน       "),
                        style: ButtonStyle(),
                        onPressed: () {
                          //   Navigator.push(context, MaterialPageRoute(builder: (context) {
                          //     return RegisterScreen();
                          //   }));
                          // },
                        }),
                  ),
                  SizedBox(
                    height: 60,
                    width: double.infinity,
                    child: ElevatedButton.icon(
                        icon: Icon(Icons.next_plan),
                        label: Text("  บันทึกการจัดส่งสินค้า       "),
                        style: ButtonStyle(),
                        onPressed: () {
                          //   Navigator.push(context, MaterialPageRoute(builder: (context) {
                          //     return RegisterScreen();
                          //   }));
                          // },
                        }),
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: ElevatedButton.icon(
                      icon: Icon(Icons.next_plan),
                      label: Text("ปรับปรุงสถานะการทำงาน        ของลูกค้า"),
                      style: ButtonStyle(),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return ProfileUpdate();
                        }));
                      },
                    ),
                  ),
                  SizedBox(
                    height: 60,
                    width: double.infinity,
                    child: ElevatedButton.icon(
                        icon: Icon(Icons.next_plan),
                        label: Text("  แสดงผลรายงาน       "),
                        style: ButtonStyle(),
                        onPressed: () {
                          //   Navigator.push(context, MaterialPageRoute(builder: (context) {
                          //     return RegisterScreen();
                          //   }));
                          // },
                        }),
                  ),
                ])));
  }
}
