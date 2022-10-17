import 'package:flutter/material.dart';
import 'package:flutter_application_project/config/api.dart';
import 'package:flutter_application_project/model/sidemenu.dart';
import 'package:flutter_application_project/views/order/CancleOrders.dart';
import 'package:intl/intl.dart';

import '../../model/ColorCard.dart';

class OrderDetail extends StatefulWidget {
  OrderDetail({
    Key? key,
    required this.data,
  }) : super(key: key);
  final dynamic data;
  dynamic statusOrder;

  @override
  State<OrderDetail> createState() => _OrderDetailState();
}

class _OrderDetailState extends State<OrderDetail> {
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
                height: 350,
                child: Card(
                  color: Color.fromARGB(255, 255, 236, 181),
                  shadowColor: const Color.fromARGB(255, 114, 114, 114),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 25,
                      ),
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
                        'วันที่รับ :' +
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
                    ],
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                widget.statusOrder = "6";
                print(widget.data['order_id']);
                print(widget.statusOrder);
                showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                            title: const Text('ยกเลิกคำสั่งซื้อ'),
                            content: const Text('ข้อมูลคำสั่งซื้อจะถูกยกเลิก'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(context, 'Cancel'),
                                child: const Text('ยกเลิก'),
                              ),
                              TextButton(
                                onPressed: () => sendstatusOrder0(
                                    widget.statusOrder,
                                    widget.data['order_id'],
                                    context),
                                child: const Text('ตกลง'),
                              ),
                            ]));
              },
              child: const Text('ยกเลิกคำสั่งซื้อ',
                  style: TextStyle(
                      color: Color.fromARGB(255, 255, 254, 254),
                      fontSize: 20,
                      fontWeight: FontWeight.w700)),
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
