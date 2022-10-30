import 'package:flutter/material.dart';
import 'package:flutter_application_project/config/api.dart';
import 'package:flutter_application_project/model/sidemenu.dart';
import 'package:flutter_application_project/views/order/CancleOrders.dart';
import 'package:flutter_application_project/views/order/PaymentD.dart';
import 'package:intl/intl.dart';

import '../../model/ColorCard.dart';

class OrderDetail extends StatefulWidget {
  OrderDetail({Key? key, required this.data, required this.dataadd})
      : super(key: key);
  final dynamic data, dataadd;
  dynamic statusOrder;

  @override
  State<OrderDetail> createState() => _OrderDetailState();
}

class _OrderDetailState extends State<OrderDetail> {
  bool? checkC = true;

  checkCancleOrder() {
    DateTime? checkCancle;
    DateTime? datenow = DateTime.now();
    checkCancle = DateTime.parse(widget.data['order_getdate']);
    final difget = checkCancle.difference(datenow);
    print(difget.inDays.toString());
    print(widget.data);
    if (difget.inDays < 3) {
      setState(() {
        checkC = false;
      });
    }
  }

  @override
  void initState() {
    checkCancleOrder();
    super.initState();
  }

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
              width: 150,
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
                height: 550,
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
                      Text(
                        'ชื่อ : '
                        '${widget.dataadd['user_fname']}'
                        '     '
                        '${widget.dataadd['user_lname']}',
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w400),
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
                        'วันที่รับ : ' +
                            DateFormat('dd-MM-yyyy เวลา HH:mm น. ').format(
                                DateTime.parse(widget.data['order_getdate'])),
                        style: const TextStyle(fontSize: 17),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'ค่ามัดจำ :          ${widget.data['order_dep']}' +
                            '        บาท',
                        style: const TextStyle(fontSize: 18),
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
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Card(
                        color: Color.fromARGB(255, 255, 255, 255),
                        shadowColor: const Color.fromARGB(255, 114, 114, 114),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Container(
                          padding: EdgeInsets.fromLTRB(15, 10, 15, 15),
                          child: Column(
                            children: [
                              Icon(
                                Icons.home_rounded,
                                size: 45,
                                color: Colors.blueAccent,
                              ),
                              Text(
                                'ที่อยู่ในการจัดส่ง : ',
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w400),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                '${widget.dataadd['user_address']}',
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w400),
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
            const SizedBox(
              height: 10,
            ),
            widget.data['order_status'] == 1
                ? Column(
                    children: [
                      checkC != false
                          ? Container(
                              padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                              child: ElevatedButton(
                                onPressed: () {
                                  "6";
                                  print(widget.data['order_id']);
                                  showDialog<String>(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          AlertDialog(
                                              title: const Text(
                                                  'ยกเลิกคำสั่งซื้อ'),
                                              content: const Text(
                                                  'ข้อมูลคำสั่งซื้อจะถูกยกเลิก'),
                                              actions: <Widget>[
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          context, 'Cancel'),
                                                  child: const Text('ยกเลิก'),
                                                ),
                                                TextButton(
                                                  onPressed: () =>
                                                      sendstatusOrder0(
                                                          widget.statusOrder,
                                                          widget
                                                              .data['order_id'],
                                                          context),
                                                  child: const Text('ตกลง'),
                                                ),
                                              ]));
                                },
                                child: const Text('ยกเลิกคำสั่งซื้อ',
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 255, 254, 254),
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700)),
                                style: ElevatedButton.styleFrom(
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 30),
                                  primary: Color.fromARGB(255, 255, 31, 61),
                                ),
                              ),
                            )
                          : Text('ยกเลิกบ่ได้'),
                      const SizedBox(
                        height: 15,
                      ),
                    ],
                  )
                : widget.data['order_status'] == 2
                    ? Column(
                        children: [
                          Container(
                            padding: EdgeInsets.fromLTRB(25, 5, 25, 5),
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          PaymentD(data: widget.data)),
                                );
                              },
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.add_a_photo,
                                    color: Colors.grey,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  const Text('อัปโหลดหลักฐานการชำระเงิน',
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 34, 34, 34),
                                        fontSize: 16,
                                      )),
                                ],
                              ),
                              style: ElevatedButton.styleFrom(
                                shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 30),
                                primary: Color.fromARGB(255, 255, 255, 255),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          checkC != false
                              ? Container(
                                  padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      "6";
                                      print(widget.data['order_id']);
                                      showDialog<String>(
                                          context: context,
                                          builder: (BuildContext context) =>
                                              AlertDialog(
                                                  title: const Text(
                                                      'ยกเลิกคำสั่งซื้อ'),
                                                  content: const Text(
                                                      'ข้อมูลคำสั่งซื้อจะถูกยกเลิก'),
                                                  actions: <Widget>[
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(context,
                                                              'Cancel'),
                                                      child:
                                                          const Text('ยกเลิก'),
                                                    ),
                                                    TextButton(
                                                      onPressed: () =>
                                                          sendstatusOrder0(
                                                              widget
                                                                  .statusOrder,
                                                              widget.data[
                                                                  'order_id'],
                                                              context),
                                                      child: const Text('ตกลง'),
                                                    ),
                                                  ]));
                                    },
                                    child: const Text('ยกเลิกคำสั่งซื้อ',
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 255, 254, 254),
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700)),
                                    style: ElevatedButton.styleFrom(
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10))),
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 30),
                                      primary: Color.fromARGB(255, 255, 31, 61),
                                    ),
                                  ),
                                )
                              : Text(
                                  '*ไม่สามารถยกเลิกได้ กรุณายกเลิกล่วงหน้า 2 วัน'),
                        ],
                      )
                    : widget.data['order_status'] == 3
                        ? Text('คำสั่งซื้อนี้ได้ถูกปฏิเสธแล้ว')
                        : widget.data['order_status'] == 4
                            ? Text('กำลังรอยืนยันการโอนชำระค่ามัดจำ')
                            : widget.data['order_status'] == 5
                                ? ElevatedButton(
                                    onPressed: () {
                                      "7";

                                      sendstatusOrder0("7",
                                          widget.data['order_id'], context);
                                    },
                                    child: const Text('ยกเลิกการจัดส่งสินค้า',
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 255, 255, 255),
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500)),
                                    style: ElevatedButton.styleFrom(
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10))),
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 30),
                                      primary: Color.fromARGB(255, 255, 1, 1),
                                    ),
                                  )
                                : widget.data['order_status'] == 6
                                    ? Text('คำสั่งซื้อนี้ได้ถูกยกเลิกแล้ว')
                                    : widget.data['order_status'] == 7
                                        ? Text(
                                            'คุณได้ยกเลิกการจัดส่งสินค้า สามารถรับสินค้าได้ที่ร้าน')
                                        : widget.data['order_status'] == 8
                                            ? Text(
                                                'คำสั่งซื้อของคุณกำลังจัดส่ง')
                                            : widget.data['order_status'] == 9
                                                ? Text(
                                                    'คุณได้ชำระยอดคงเหลือเรียบร้อย \n คำสั่งซื้อของคุณกำลังจัดส่ง')
                                                : widget.data['order_status'] ==
                                                        10
                                                    ? Text(
                                                        'คำสั่งซื้อนี้ได้ถูกจัดส่งเรียบร้อยแล้ว')
                                                    : Text('error')
          ],
        ),
      ),
    );
  }
}
