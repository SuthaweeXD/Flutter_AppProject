import 'package:flutter/material.dart';
import 'package:flutter_application_project/model/ColorCard.dart';
import 'package:intl/intl.dart';

import '../../config/api.dart';

class EditOrders extends StatefulWidget {
  EditOrders({
    Key? key,
    required this.data,
  }) : super(key: key);
  final dynamic data;
  dynamic statusOrder;
  @override
  State<EditOrders> createState() => _EditOrdersState();
}

class _EditOrdersState extends State<EditOrders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('รายละเอียดการสั่งซื้อ'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
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
                height: 300,
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
                        height: 10,
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
                        height: 10,
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                widget.statusOrder = "2";
                print(widget.data['order_id']);
                print(widget.statusOrder);
                sendstatusOrder(
                    widget.statusOrder, widget.data['order_id'], context);
              },
              child: const Text('ยืนยันรับคำสั่งซื้อ',
                  style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 20,
                      fontWeight: FontWeight.w500)),
              style: ElevatedButton.styleFrom(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                primary: Color.fromARGB(255, 55, 255, 102),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: () {
                widget.statusOrder = "3";
                print(widget.data['order_id']);
                print(widget.statusOrder);
                sendstatusOrder(
                    widget.statusOrder, widget.data['order_id'], context);
              },
              child: const Text('ปฏิเสธรับคำสั่งซื้อ',
                  style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 20,
                      fontWeight: FontWeight.w500)),
              style: ElevatedButton.styleFrom(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                primary: Color.fromARGB(255, 251, 255, 0),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: () {
                widget.statusOrder = "4";
                print(widget.data['order_id']);
                print(widget.statusOrder);
                sendstatusOrder(
                    widget.statusOrder, widget.data['order_id'], context);
              },
              child: const Text('ยืนยันการโอนชำระ',
                  style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 20,
                      fontWeight: FontWeight.w500)),
              style: ElevatedButton.styleFrom(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                primary: Color.fromARGB(255, 0, 143, 232),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: () {
                widget.statusOrder = "5";
                print(widget.data['order_id']);
                print(widget.statusOrder);
                sendstatusOrder(
                    widget.statusOrder, widget.data['order_id'], context);
              },
              child: const Text('จัดส่งสำเร็จ',
                  style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 20,
                      fontWeight: FontWeight.w500)),
              style: ElevatedButton.styleFrom(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                primary: Color.fromARGB(255, 0, 193, 19),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: () {
                widget.statusOrder = "6";
                print(widget.data['order_id']);
                print(widget.statusOrder);
                sendstatusOrder(
                    widget.statusOrder, widget.data['order_id'], context);
              },
              child: const Text('ยกเลิกคำสั่งซื้อ',
                  style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 20,
                      fontWeight: FontWeight.w500)),
              style: ElevatedButton.styleFrom(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                primary: Color.fromARGB(255, 255, 31, 61),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
