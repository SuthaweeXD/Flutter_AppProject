import 'package:flutter/material.dart';
import 'package:flutter_application_project/model/ColorCard.dart';
import 'package:flutter_application_project/views/Map.dart';
import 'package:intl/intl.dart';

import '../../config/api.dart';

class EditOrders extends StatefulWidget {
  const EditOrders({
    Key? key,
    required this.data,
  }) : super(key: key);
  final dynamic data;

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
        child: Column(children: [
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
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                'สถานะ : ' + ColorStatus(widget.data["order_status"]),
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(25, 10, 25, 15),
            child: SizedBox(
              width: 950,
              height: 750,
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
                    const SizedBox(
                      height: 15,
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
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute<void>(
                                builder: (BuildContext context) => MapWidget(
                                      lat: widget.data['lat'].toDouble(),
                                      lng: widget.data['lng'].toDouble(),
                                    )));
                      },
                      child: const Text('แสดงที่อยู่ลูกค้า',
                          style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontSize: 16,
                              fontWeight: FontWeight.w200)),
                      style: ElevatedButton.styleFrom(
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 40),
                        primary: Color.fromARGB(255, 28, 122, 255),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Container(
                      padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
                      child: SizedBox(
                          height: 240,
                          width: 450,
                          child: widget.data != null
                              ? Card(
                                  color: Color.fromARGB(255, 255, 236, 181),
                                  shadowColor:
                                      const Color.fromARGB(255, 114, 114, 114),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(0)),
                                  child: AddressMap(
                                    lat: widget.data['lat'].toDouble(),
                                    lng: widget.data['lng'].toDouble(),
                                  ),
                                )
                              : Text('ไม่มีข้อมูล')),
                    ),
                    SizedBox(
                      height: 30,
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
                      padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                      child: ElevatedButton(
                        onPressed: () {
                          sendstatusOrder1(
                              "2", widget.data['order_id'], context);
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
                    Container(
                      padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                      child: ElevatedButton(
                        onPressed: () {
                          "3";

                          sendstatusOrder1(
                              "3", widget.data['order_id'], context);
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.cancel_presentation,
                              size: 30,
                              color: Colors.black,
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            const Text('ปฏิเสธรับคำสั่งซื้อ',
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
                          primary: Color.fromARGB(255, 255, 87, 87),
                        ),
                      ),
                    )
                  ],
                )
              : widget.data['order_status'] == 2
                  ? Column(
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(35, 0, 30, 0),
                          child: ElevatedButton(
                            onPressed: () {
                              "4";

                              sendstatusOrder11(
                                  "4", widget.data['order_id'], context);
                            },
                            child: Row(
                              children: [
                                Icon(
                                  Icons.search,
                                  size: 30,
                                  color: Colors.black,
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                const Text('ตรวจสอบการโอนชำระ',
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
                                  vertical: 10, horizontal: 30),
                              primary: Color.fromARGB(255, 255, 220, 94),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                      ],
                    )
                  : widget.data['order_status'] == 3
                      ? Container(
                          padding: EdgeInsets.fromLTRB(35, 0, 35, 0),
                          child: ElevatedButton(
                            onPressed: () {
                              "6";

                              sendstatusOrder1(
                                  "6", widget.data['order_id'], context);
                            },
                            child: Row(
                              children: [
                                Icon(
                                  Icons.cancel,
                                  size: 30,
                                  color: Colors.black,
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                const Text('ยกเลิกคำสั่งซื้อ',
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
                                  vertical: 10, horizontal: 30),
                              primary: Color.fromARGB(255, 255, 91, 113),
                            ),
                          ),
                        )
                      : widget.data['order_status'] == 4
                          ? Container(
                              padding: EdgeInsets.fromLTRB(35, 0, 35, 0),
                              child: ElevatedButton(
                                onPressed: () {
                                  "5";

                                  sendstatusOrder1(
                                      "5", widget.data['order_id'], context);
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
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 30),
                                  primary: Color.fromARGB(255, 80, 255, 92),
                                ),
                              ),
                            )
                          : widget.data['order_status'] == 5
                              ? Container(
                                  padding: EdgeInsets.fromLTRB(35, 0, 35, 0),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      "8";

                                      sendstatusOrder1("8",
                                          widget.data['order_id'], context);
                                    },
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.delivery_dining,
                                          size: 30,
                                          color: Colors.black,
                                        ),
                                        SizedBox(
                                          width: 15,
                                        ),
                                        const Text('กำลังจัดส่ง',
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 0, 0, 0),
                                                fontSize: 20,
                                                fontWeight: FontWeight.w500)),
                                      ],
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10))),
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 60),
                                      primary:
                                          Color.fromARGB(255, 255, 218, 98),
                                    ),
                                  ),
                                )
                              : widget.data['order_status'] == 6
                                  ? Text('คำสั่งซื้อนี้ได้ถูกยกเลิกแล้ว')
                                  : widget.data['order_status'] == 7
                                      ? Container(
                                          padding:
                                              EdgeInsets.fromLTRB(35, 0, 35, 0),
                                          child: ElevatedButton(
                                            onPressed: () {
                                              "10";
                                              print(widget.data['order_id']);

                                              sendstatusOrder1(
                                                  "10",
                                                  widget.data['order_id'],
                                                  context);
                                            },
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons
                                                      .check_circle_outline_rounded,
                                                  size: 30,
                                                  color: Colors.black,
                                                ),
                                                SizedBox(
                                                  width: 15,
                                                ),
                                                const Text('จัดส่งสำเร็จ',
                                                    style: TextStyle(
                                                        color: Color.fromARGB(
                                                            255, 0, 0, 0),
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.w500)),
                                              ],
                                            ),
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
                                                      horizontal: 60),
                                              primary: Color.fromARGB(
                                                  255, 24, 255, 86),
                                            ),
                                          ),
                                        )
                                      : widget.data['order_status'] == 8
                                          ? Container(
                                              padding: EdgeInsets.fromLTRB(
                                                  35, 0, 35, 0),
                                              child: ElevatedButton(
                                                onPressed: () {
                                                  "10";
                                                  print(
                                                      widget.data['order_id']);

                                                  sendstatusOrder1(
                                                      "10",
                                                      widget.data['order_id'],
                                                      context);
                                                },
                                                child: Row(
                                                  children: [
                                                    Icon(
                                                      Icons
                                                          .check_circle_outline_rounded,
                                                      size: 30,
                                                      color: Colors.black,
                                                    ),
                                                    SizedBox(
                                                      width: 15,
                                                    ),
                                                    const Text('จัดส่งสำเร็จ',
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
                                                  ],
                                                ),
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
                                                      horizontal: 60),
                                                  primary: Color.fromARGB(
                                                      255, 24, 255, 86),
                                                ),
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
                                                        widget.data['order_id'],
                                                        context);
                                                  },
                                                  child: Row(
                                                    children: [
                                                      Icon(
                                                        Icons
                                                            .check_circle_outline_rounded,
                                                        size: 30,
                                                        color: Colors.black,
                                                      ),
                                                      SizedBox(
                                                        width: 15,
                                                      ),
                                                      const Text('จัดส่งสำเร็จ',
                                                          style: TextStyle(
                                                              color: Color
                                                                  .fromARGB(255,
                                                                      0, 0, 0),
                                                              fontSize: 20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500)),
                                                    ],
                                                  ),
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    shape: const RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    10))),
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        vertical: 10,
                                                        horizontal: 60),
                                                    primary: Color.fromARGB(
                                                        255, 24, 255, 86),
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
        ]),
      ),
    );
  }
}
