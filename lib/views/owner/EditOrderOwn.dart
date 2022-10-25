import 'package:flutter/material.dart';
import 'package:flutter_application_project/views/owner/Main.dart';
import 'package:intl/intl.dart';

import '../../config/api.dart';
import '../../model/ColorCard.dart';

class EditOrderOwn extends StatefulWidget {
  EditOrderOwn({Key? key, required this.data}) : super(key: key);
  final dynamic data;
  dynamic statusOrder;

  @override
  State<EditOrderOwn> createState() => _EditOrderOwnState();
}

class _EditOrderOwnState extends State<EditOrderOwn> {
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
                height: 950,
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
            const SizedBox(
              height: 10,
            ),
            widget.data['order_status'] == 1
                ? Column(
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(45, 0, 45, 0),
                        child: ElevatedButton(
                          onPressed: () {
                            sendstatusOrder1(
                                "2", widget.data['order_id'], context);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.check_box,
                                size: 30,
                                color: Colors.black87,
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              const Text('ยืนยันรับคำสั่งซื้อ',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500)),
                            ],
                          ),
                          style: ElevatedButton.styleFrom(
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 40),
                            primary: Color.fromARGB(255, 55, 255, 102),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          "3";

                          sendstatusOrder1(
                              "3", widget.data['order_id'], context);
                        },
                        child: const Text('ปฏิเสธรับคำสั่งซื้อ',
                            style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontSize: 20,
                                fontWeight: FontWeight.w500)),
                        style: ElevatedButton.styleFrom(
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 40),
                          primary: Color.fromARGB(255, 255, 87, 87),
                        ),
                      )
                    ],
                  )
                : widget.data['order_status'] == 2
                    ? Column(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              "4";

                              sendstatusOrder1(
                                  "4", widget.data['order_id'], context);
                            },
                            child: const Text('ยืนยันการโอนชำระ',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500)),
                            style: ElevatedButton.styleFrom(
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 30),
                              primary: Color.fromARGB(255, 0, 143, 232),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                        ],
                      )
                    : widget.data['order_status'] == 3
                        ? ElevatedButton(
                            onPressed: () {
                              "6";

                              sendstatusOrder1(
                                  "6", widget.data['order_id'], context);
                            },
                            child: const Text('ยกเลิกคำสั่งซื้อ',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500)),
                            style: ElevatedButton.styleFrom(
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 30),
                              primary: Color.fromARGB(255, 255, 31, 61),
                            ),
                          )
                        : widget.data['order_status'] == 4
                            ? ElevatedButton(
                                onPressed: () {
                                  "5";

                                  sendstatusOrder1(
                                      "5", widget.data['order_id'], context);
                                },
                                child: const Text('ยืนยันการโอนชำระ',
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 0, 0, 0),
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500)),
                                style: ElevatedButton.styleFrom(
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 30),
                                  primary: Color.fromARGB(255, 0, 143, 232),
                                ),
                              )
                            : widget.data['order_status'] == 5
                                ? ElevatedButton(
                                    onPressed: () {
                                      "8";

                                      sendstatusOrder1("8",
                                          widget.data['order_id'], context);
                                    },
                                    child: const Text('กำลังจัดส่ง',
                                        style: TextStyle(
                                            color: Color.fromARGB(255, 0, 0, 0),
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500)),
                                    style: ElevatedButton.styleFrom(
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10))),
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 30),
                                      primary: Color.fromARGB(255, 0, 193, 19),
                                    ),
                                  )
                                : widget.data['order_status'] == 6
                                    ? Text('คำสั่งซื้อนี้ได้ถูกยกเลิกแล้ว')
                                    : widget.data['order_status'] == 7
                                        ? ElevatedButton(
                                            onPressed: () {
                                              "10";
                                              print(widget.data['order_id']);

                                              sendstatusOrder1(
                                                  "10",
                                                  widget.data['order_id'],
                                                  context);
                                            },
                                            child: const Text('จัดส่งสำเร็จ',
                                                style: TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 0, 0, 0),
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                            style: ElevatedButton.styleFrom(
                                              shape:
                                                  const RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  10))),
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 10,
                                                      horizontal: 30),
                                              primary: Color.fromARGB(
                                                  255, 24, 255, 86),
                                            ),
                                          )
                                        : widget.data['order_status'] == 8
                                            ? ElevatedButton(
                                                onPressed: () {
                                                  "10";
                                                  print(
                                                      widget.data['order_id']);

                                                  sendstatusOrder1(
                                                      "10",
                                                      widget.data['order_id'],
                                                      context);
                                                },
                                                child: const Text(
                                                    'จัดส่งสำเร็จ',
                                                    style: TextStyle(
                                                        color: Color.fromARGB(
                                                            255, 0, 0, 0),
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.w500)),
                                                style: ElevatedButton.styleFrom(
                                                  shape:
                                                      const RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          10))),
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      vertical: 10,
                                                      horizontal: 30),
                                                  primary: Color.fromARGB(
                                                      255, 92, 255, 33),
                                                ),
                                              )
                                            : widget.data['order_status'] == 9
                                                ? ElevatedButton(
                                                    onPressed: () {
                                                      "10";
                                                      print(widget
                                                          .data['order_id']);

                                                      sendstatusOrder1(
                                                          "10",
                                                          widget
                                                              .data['order_id'],
                                                          context);
                                                    },
                                                    child: const Text(
                                                        'จัดส่งสำเร็จ',
                                                        style: TextStyle(
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    0,
                                                                    0,
                                                                    0),
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500)),
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      shape: const RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          10))),
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          vertical: 10,
                                                          horizontal: 30),
                                                      primary: Color.fromARGB(
                                                          255, 92, 255, 33),
                                                    ),
                                                  )
                                                : widget.data['order_status'] ==
                                                        10
                                                    ? Text(
                                                        'คำสั่งซื้อนี้ได้ถูกจัดส่งเรียบร้อยแล้ว')
                                                    : Text('Error'),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
