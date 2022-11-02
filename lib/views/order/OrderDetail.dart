import 'package:flutter/material.dart';
import 'package:flutter_application_project/config/api.dart';
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
        title: const Text('รายละเอียดการสั่งซื้อ'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            IconStatus(widget.data['order_status']),
            Card(
              color: widget.data["order_status"] != null
                  ? ColorCard(widget.data["order_status"])
                  : const Color.fromARGB(255, 255, 255, 255),
              shadowColor: const Color.fromARGB(255, 114, 114, 114),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  'สถานะ : ' + ColorStatus(widget.data["order_status"]),
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(25, 10, 25, 15),
              child: SizedBox(
                width: 950,
                height: 550,
                child: Card(
                  color: const Color.fromARGB(255, 255, 236, 181),
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
                        'ค่ามัดจำ  :     ${widget.data['order_dep']}' +
                            '        บาท',
                        style: const TextStyle(fontSize: 18),
                      ),
                      SizedBox(
                        width: 300,
                        height: 150,
                        child: Card(
                          child: Column(
                            children: [
                              const SizedBox(
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
                        color: const Color.fromARGB(255, 255, 255, 255),
                        shadowColor: const Color.fromARGB(255, 114, 114, 114),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(15, 10, 15, 15),
                          child: Column(
                            children: [
                              const Icon(
                                Icons.home_rounded,
                                size: 45,
                                color: Colors.blueAccent,
                              ),
                              const Text(
                                'ที่อยู่ในการจัดส่ง : ',
                                style: TextStyle(
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
                              padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
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
                                                          "6",
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
                                  primary:
                                      const Color.fromARGB(255, 255, 31, 61),
                                ),
                              ),
                            )
                          : const Text(
                              '*ไม่สามารถยกเลิกได้ กรุณายกเลิกล่วงหน้า 2 วัน',
                              style: const TextStyle(
                                color: Colors.red,
                              ),
                            ),
                      const SizedBox(
                        height: 15,
                      ),
                    ],
                  )
                : widget.data['order_status'] == 2
                    ? Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.fromLTRB(25, 5, 25, 5),
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
                                // ignore: prefer_const_literals_to_create_immutables
                                children: [
                                  // ignore: prefer_const_constructors
                                  Icon(
                                    Icons.add_a_photo,
                                    color: Colors.grey,
                                  ),
                                  // ignore: prefer_const_constructors
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
                                primary:
                                    const Color.fromARGB(255, 255, 255, 255),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          checkC != false
                              ? Container(
                                  padding:
                                      const EdgeInsets.fromLTRB(30, 0, 30, 0),
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
                                                              "6",
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
                                      primary: const Color.fromARGB(
                                          255, 255, 31, 61),
                                    ),
                                  ),
                                )
                              : const Text(
                                  '*ไม่สามารถยกเลิกได้ กรุณายกเลิกล่วงหน้า 2 วัน',
                                  style: const TextStyle(
                                    color: Colors.red,
                                  ),
                                ),
                          const SizedBox(
                            height: 15,
                          ),
                        ],
                      )
                    : widget.data['order_status'] == 3
                        ? const Text('คำสั่งซื้อนี้ได้ถูกปฏิเสธแล้ว')
                        : widget.data['order_status'] == 4
                            ? Column(
                                children: [
                                  Container(
                                    padding:
                                        const EdgeInsets.fromLTRB(25, 5, 25, 5),
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
                                        // ignore: prefer_const_literals_to_create_immutables
                                        children: [
                                          const Icon(
                                            Icons.add_a_photo,
                                            color: Colors.grey,
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          const Text(
                                              'อัปโหลดหลักฐานการชำระเงิน',
                                              style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 34, 34, 34),
                                                fontSize: 16,
                                              )),
                                        ],
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10))),
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10, horizontal: 30),
                                        primary: const Color.fromARGB(
                                            255, 255, 255, 255),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const Text(
                                    'กำลังรอยืนยันการโอนชำระค่ามัดจำ',
                                    style: TextStyle(
                                      color: Colors.orange,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                ],
                              )
                            : widget.data['order_status'] == 5
                                ? ElevatedButton(
                                    onPressed: () {
                                      "7";
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
                                                              "7",
                                                              widget.data[
                                                                  'order_id'],
                                                              context),
                                                      child: const Text('ตกลง'),
                                                    ),
                                                  ]));
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
                                      primary:
                                          const Color.fromARGB(255, 255, 1, 1),
                                    ),
                                  )
                                : widget.data['order_status'] == 6
                                    ? Column(
                                        // ignore: prefer_const_literals_to_create_immutables
                                        children: [
                                          const Text(
                                            'คำสั่งซื้อนี้ได้ถูกยกเลิกแล้ว',
                                            style: TextStyle(
                                              color: Colors.red,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                        ],
                                      )
                                    : widget.data['order_status'] == 7
                                        ? Column(
                                            // ignore: prefer_const_literals_to_create_immutables
                                            children: [
                                              const Text(
                                                  'คุณได้ยกเลิกการจัดส่งสินค้า สามารถรับสินค้าได้ที่ร้าน'),
                                              const SizedBox(
                                                height: 15,
                                              ),
                                            ],
                                          )
                                        : widget.data['order_status'] == 8
                                            ? Column(
                                                // ignore: prefer_const_literals_to_create_immutables
                                                children: [
                                                  const Text(
                                                    'คำสั่งซื้อของคุณกำลังจัดส่ง',
                                                    style: TextStyle(
                                                      color: Colors.orange,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 15,
                                                  ),
                                                ],
                                              )
                                            : widget.data['order_status'] == 9
                                                ? Column(
                                                    // ignore: prefer_const_literals_to_create_immutables
                                                    children: [
                                                      const Text(
                                                        'คุณได้ชำระยอดคงเหลือเรียบร้อย \n คำสั่งซื้อของคุณกำลังจัดส่ง',
                                                        style: const TextStyle(
                                                          color: Colors
                                                              .greenAccent,
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 15,
                                                      ),
                                                    ],
                                                  )
                                                : widget.data['order_status'] ==
                                                        10
                                                    ? Column(
                                                        // ignore: prefer_const_literals_to_create_immutables
                                                        children: [
                                                          const Text(
                                                            'คำสั่งซื้อนี้ได้ถูกจัดส่งเรียบร้อยแล้ว',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.green,
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            height: 15,
                                                          ),
                                                        ],
                                                      )
                                                    : widget.data[
                                                                'order_status'] ==
                                                            11
                                                        ? Column(
                                                            children: [
                                                              Container(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .fromLTRB(
                                                                        25,
                                                                        5,
                                                                        25,
                                                                        5),
                                                                child:
                                                                    ElevatedButton(
                                                                  onPressed:
                                                                      () {
                                                                    Navigator
                                                                        .push(
                                                                      context,
                                                                      MaterialPageRoute(
                                                                          builder: (context) =>
                                                                              PaymentD(data: widget.data)),
                                                                    );
                                                                  },
                                                                  child: Row(
                                                                    // ignore: prefer_const_literals_to_create_immutables
                                                                    children: [
                                                                      const Icon(
                                                                        Icons
                                                                            .add_a_photo,
                                                                        color: Colors
                                                                            .grey,
                                                                      ),
                                                                      const SizedBox(
                                                                        width:
                                                                            10,
                                                                      ),
                                                                      const Text(
                                                                          'อัปโหลดหลักฐานการชำระเงิน',
                                                                          style:
                                                                              TextStyle(
                                                                            color: Color.fromARGB(
                                                                                255,
                                                                                34,
                                                                                34,
                                                                                34),
                                                                            fontSize:
                                                                                16,
                                                                          )),
                                                                    ],
                                                                  ),
                                                                  style: ElevatedButton
                                                                      .styleFrom(
                                                                    shape: const RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.all(Radius.circular(10))),
                                                                    padding: const EdgeInsets
                                                                            .symmetric(
                                                                        vertical:
                                                                            10,
                                                                        horizontal:
                                                                            30),
                                                                    primary:
                                                                        const Color.fromARGB(
                                                                            255,
                                                                            255,
                                                                            255,
                                                                            255),
                                                                  ),
                                                                ),
                                                              ),
                                                              const SizedBox(
                                                                width: 10,
                                                              ),
                                                              const Text(
                                                                'หลักฐานการโอนชำระเงินไม่ถูกต้อง',
                                                                style:
                                                                    const TextStyle(
                                                                  color: Colors
                                                                      .red,
                                                                ),
                                                              ),
                                                              const SizedBox(
                                                                height: 15,
                                                              ),
                                                            ],
                                                          )
                                                        : const Text('error')
          ],
        ),
      ),
    );
  }
}
