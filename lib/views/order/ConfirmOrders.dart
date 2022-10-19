import 'package:flutter/material.dart';
import 'package:flutter_application_project/config/api.dart';
import 'package:flutter_application_project/model/ModelOrders.dart';
import 'package:intl/intl.dart';

class ConfirmOrders extends StatefulWidget {
  ConfirmOrders(
      {Key? key,
      this.small,
      this.big,
      this.roll,
      this.picdate,
      this.pictime,
      this.now,
      context})
      : super(key: key);

  dynamic small, big, roll, picdate, pictime, now;

  @override
  State<ConfirmOrders> createState() => _ConfirmOrdersState();
}

class _ConfirmOrdersState extends State<ConfirmOrders> {
  dynamic data;
  bool isSwitched = false;
  @override
  void initState() {
    super.initState();
    startApi();
  }

  startApi() async {
    dynamic item = await getaddress();
    setState(() {
      data = item;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('ยืนยันคำสั่งซื้อ'),
        ),
        body: data != null
            ? SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.fromLTRB(25, 10, 25, 15),
                  child: SizedBox(
                    width: 950,
                    height: 750,
                    child: Card(
                      color: Color.fromARGB(255, 203, 255, 170),
                      shadowColor: const Color.fromARGB(255, 114, 114, 114),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 50,
                            ),
                            Text(
                              'เส้นเล็ก: ' + widget.small + ' กิโลกรัม',
                              style: const TextStyle(fontSize: 18),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'เส้นใหญ่ : ' + widget.big + ' กิโลกรัม',
                              style: const TextStyle(fontSize: 18),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'เส้นม้วน: ' + widget.roll + ' กิโลกรัม',
                              style: const TextStyle(fontSize: 18),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'วันที่รับ: ' +
                                  DateFormat('dd-MM-yyyy')
                                      .format(DateTime.parse(widget.picdate)),
                              style: const TextStyle(fontSize: 18),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'เวลาที่รับ: ' + widget.pictime + ' น.',
                              style: const TextStyle(fontSize: 18),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(25, 10, 25, 5),
                              child: Card(
                                color: Color.fromARGB(255, 255, 255, 255),
                                shadowColor:
                                    const Color.fromARGB(255, 114, 114, 114),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
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
                                        'ที่อยู่สำหรับจัดส่ง: '
                                        ''' ${data['user_address']}''',
                                        style: TextStyle(
                                          color: Color.fromARGB(255, 0, 0, 0),
                                          fontSize: 18,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(15, 2, 15, 15),
                              child: Text(
                                '*หมายเหตุ หากต้องการเปลี่ยนที่อยู่การจัดส่งให้แก้ไขที่หน้าข้อมูลส่วนตัว',
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                            SizedBox(height: 75),
                            TextButton(
                              onPressed: () {
                                showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        AlertDialog(
                                            title: const Text(
                                                'แก้ไขที่อยู่การจัดส่ง'),
                                            content: const Text(
                                                '*หากต้องการแก้ไขให้ไปที่ข้อมูลส่วนตัว*'),
                                            actions: <Widget>[
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    context, 'Cancel'),
                                                child: const Text('ยกเลิก'),
                                              ),
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    context, 'OK'),
                                                child: const Text('ตกลง'),
                                              ),
                                            ]));
                              },
                              child: Switch(
                                value: isSwitched,
                                onChanged: (value) {
                                  setState(() {
                                    isSwitched = value;
                                    print(isSwitched);
                                  });
                                },
                                activeTrackColor: Colors.lightGreenAccent,
                                activeColor: Colors.green,
                              ),
                            ),
                            SizedBox(height: 20),
                            TextButton(
                              onPressed: () {
                                sendorders(
                                    widget.small,
                                    widget.big,
                                    widget.roll,
                                    widget.picdate,
                                    widget.pictime,
                                    widget.now,
                                    context);
                              },
                              child: const Text('ยืนยันคำสั่งซื้อ',
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
                                primary: Color.fromARGB(255, 77, 158, 88),
                              ),
                            ),
                          ]),
                    ),
                  ),
                ),
              )
            : Text('error'));
  }
}
