import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../config/api.dart';
import '../../model/ColorCard.dart';

class CheckPayment1 extends StatefulWidget {
  CheckPayment1({Key? key, required this.data}) : super(key: key);
  final dynamic data;

  @override
  State<CheckPayment1> createState() => _CheckPayment1State();
}

class _CheckPayment1State extends State<CheckPayment1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('รายละเอียดการสั่งซื้อ'),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          const SizedBox(
            height: 15,
          ),
          IconStatus(widget.data['order_status']),
          SizedBox(
            width: 200,
            height: 45,
            child: Container(
              child: Card(
                color: widget.data["order_status"] != null
                    ? ColorCard(widget.data["order_status"])
                    : const Color.fromARGB(255, 255, 255, 255),
                shadowColor: const Color.fromARGB(255, 114, 114, 114),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'สถานะ : ' + ColorStatus(widget.data["order_status"]),
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(25, 10, 25, 15),
            child: SizedBox(
              width: 950,
              height: 450,
              child: Card(
                color: Color.fromARGB(255, 204, 255, 172),
                shadowColor: const Color.fromARGB(255, 114, 114, 114),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      'ชื่อ : ${widget.data['user_fname']} '
                      ' ${widget.data['user_lname']}',
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'วันที่สั่ง : ' +
                          DateFormat('dd-MM-yyyy เวลา HH:mm น. ').format(
                              DateTime.parse(widget.data['order_date'])),
                      style: const TextStyle(fontSize: 17),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'วันที่รับ : ' +
                          DateFormat('dd-MM-yyyy เวลา HH:mm น. ').format(
                              DateTime.parse(widget.data['order_getdate'])),
                      style: const TextStyle(fontSize: 17),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(50, 0, 25, 0),
                      child: Row(
                        children: [
                          Icon(Icons.phone),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            'เบอร์ : ${widget.data['user_number']} ',
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 300,
                      height: 150,
                      child: Card(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              'เส้นเล็ก :          ${widget.data['order_small']}' +
                                  '        กิโลกรัม',
                              style: const TextStyle(fontSize: 18),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              'เส้นใหญ่ :          ${widget.data['order_big']}' +
                                  '        กิโลกรัม',
                              style: const TextStyle(fontSize: 18),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              'เส้นม้วน :          ${widget.data['order_roll']}' +
                                  '        กิโลกรัม',
                              style: const TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      'ค่ามัดจำ : ${widget.data['order_dep']} ' + ' บาท',
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      'ราคาทั้งหมด : ${widget.data['order_total']} ' + ' บาท',
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(25, 10, 25, 15),
            child: SizedBox(
              child: Card(
                color: Color.fromARGB(255, 198, 198, 198),
                shadowColor: const Color.fromARGB(255, 114, 114, 114),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  children: [
                    const SizedBox(height: 15),
                    widget.data['order_payment'] != null
                        ? SizedBox.fromSize(
                            child: Container(
                                padding: EdgeInsets.fromLTRB(25, 10, 25, 0),
                                child: Image(
                                    image: NetworkImage(
                                      widget.data['order_payment'],
                                    ),
                                    fit: BoxFit.cover)),
                          )
                        : SizedBox.fromSize(
                            child: Container(
                              padding: EdgeInsets.fromLTRB(25, 10, 25, 0),
                              child: Image.asset(
                                'assets/images/empty.png',
                              ),
                            ),
                          ),
                    SizedBox(
                      height: 30,
                    )
                  ],
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(35, 0, 35, 0),
            child: ElevatedButton(
              onPressed: () {
                "5";

                sendstatusOrder1("5", widget.data['order_id'], context);
              },
              child: Row(
                children: [
                  Icon(
                    Icons.check_box,
                    size: 30,
                    color: Colors.black,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  const Text('ยืนยันการโอนชำระ',
                      style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 20,
                          fontWeight: FontWeight.w500)),
                ],
              ),
              style: ElevatedButton.styleFrom(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                primary: Color.fromARGB(255, 80, 255, 92),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          )
        ]),
      ),
    );
  }
}
