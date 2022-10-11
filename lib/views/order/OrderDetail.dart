import 'package:flutter/material.dart';
import 'package:flutter_application_project/config/api.dart';
import 'package:flutter_application_project/model/sidemenu.dart';
import 'package:flutter_application_project/views/order/CancleOrders.dart';
import 'package:intl/intl.dart';

class OrderDetail extends StatefulWidget {
  OrderDetail({
    Key? key,
    required this.data,
  }) : super(key: key);
  final dynamic data;
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
      body: Container(
        padding: EdgeInsets.fromLTRB(25, 10, 25, 15),
        child: SizedBox(
          width: 950,
          height: 750,
          child: Card(
            color: Color.fromARGB(255, 255, 236, 181),
            shadowColor: const Color.fromARGB(255, 114, 114, 114),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
            child: Column(
              children: [
                const SizedBox(
                  height: 25,
                ),
                Text(
                  'วันที่สั่ง : ' +
                      DateFormat('dd-MM-yyyy เวลา HH:mmน. ')
                          .format(DateTime.parse(widget.data['order_date'])),
                  style: const TextStyle(fontSize: 17),
                ),
                const SizedBox(height: 10),
                Text(
                  'วันที่รับ :' +
                      DateFormat('dd-MM-yyyy เวลา HH:mm')
                          .format(DateTime.parse(widget.data['order_getdate'])),
                  style: const TextStyle(fontSize: 17),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'เส้นเล็ก : ${widget.data['order_small']}'
                  '  '
                  'เส้นใหญ่ : ${widget.data['order_big']}'
                  '  '
                  'เส้นม้วน : ${widget.data['order_roll']}',
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(
                  height: 50,
                ),
                Padding(
                    padding: const EdgeInsets.all(22),
                    child: TextButton(
                      onPressed: () {
                        showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                                    title: const Text('ยกเลิกคำสั่งซื้อ'),
                                    content: const Text(
                                        'ข้อมูลคำสั่งซื้อจะถูกยกเลิก'),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(context, 'Cancel'),
                                        child: const Text('ยกเลิก'),
                                      ),
                                      TextButton(
                                        onPressed: () => deleteorder(
                                            widget.data['order_id'], context),
                                        child: const Text('ตกลง'),
                                      ),
                                    ]));
                      },
                      child: const Text('ยกเลิกคำสั่งซื้อ',
                          style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontSize: 17,
                              fontWeight: FontWeight.bold)),
                      style: ElevatedButton.styleFrom(
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 30),
                        primary: Color.fromARGB(255, 255, 31, 61),
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
