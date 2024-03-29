import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_project/config/api.dart';
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
      this.dep,
      this.total,
      context})
      : super(key: key);

  dynamic small, big, roll, picdate, pictime, now, dep, total;

  @override
  State<ConfirmOrders> createState() => _ConfirmOrdersState();
}

class _ConfirmOrdersState extends State<ConfirmOrders> {
  dynamic data;
  bool isSwitched = false;
  double result = 0, deposit = 0;
  @override
  void initState() {
    super.initState();
    startApi();
    calculator();
  }

  startApi() async {
    dynamic item = await getaddress();
    setState(() {
      data = item;
    });
  }

  calculator() {
    double total = double.parse(widget.small) +
        double.parse(widget.big) +
        double.parse(widget.roll);

    result = (double.parse(widget.small) * 20) +
        (double.parse(widget.big) * 20) +
        (double.parse(widget.roll) * 20);

    if (total >= 100) {
      deposit = result / 10;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ยืนยันคำสั่งซื้อ'),
      ),
      body: data != null
          ? SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.fromLTRB(25, 10, 25, 15),
                child: SizedBox(
                  width: 950,
                  height: 700,
                  child: Card(
                    color: const Color.fromARGB(255, 203, 255, 170),
                    shadowColor: const Color.fromARGB(255, 114, 114, 114),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Container(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 50,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'ชื่อ :  ${data['user_fname']}'
                                  '   '
                                  ' ${data['user_lname']}',
                                  style: const TextStyle(fontSize: 22),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              width: 300,
                              height: 280,
                              child: Card(
                                child: Column(
                                  children: [
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      'เส้นเล็ก :     ' +
                                          widget.small +
                                          '      กิโลกรัม',
                                      style: const TextStyle(fontSize: 18),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'เส้นใหญ่ :    ' +
                                          widget.big +
                                          '      กิโลกรัม',
                                      style: const TextStyle(fontSize: 18),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'เส้นม้วน :     ' +
                                          widget.roll +
                                          '      กิโลกรัม',
                                      style: const TextStyle(fontSize: 18),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'วันที่รับ :  ' +
                                          DateFormat('dd-MM-yyyy').format(
                                              DateTime.parse(widget.picdate)),
                                      style: const TextStyle(fontSize: 18),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'เวลาที่รับ :  ' + widget.pictime + ' น.',
                                      style: const TextStyle(fontSize: 18),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      'ราคา  ' + result.toString() + '  บาท',
                                      style: const TextStyle(fontSize: 21),
                                    ),
                                    Text(
                                        'มัดจำ  ' +
                                            deposit.toString() +
                                            '  บาท',
                                        style: const TextStyle(fontSize: 21)),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.fromLTRB(25, 10, 25, 5),
                              child: Card(
                                color: const Color.fromARGB(255, 255, 255, 255),
                                shadowColor:
                                    const Color.fromARGB(255, 114, 114, 114),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                child: Container(
                                  padding:
                                      const EdgeInsets.fromLTRB(15, 10, 15, 15),
                                  child: Column(
                                    children: [
                                      const Icon(
                                        Icons.home_rounded,
                                        size: 45,
                                        color: Colors.blueAccent,
                                      ),
                                      Text(
                                        'ที่อยู่สำหรับจัดส่ง: '
                                        ''' ${data['user_address']}''',
                                        style: const TextStyle(
                                          color: Color.fromARGB(255, 0, 0, 0),
                                          fontSize: 18,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text(
                                '*หมายเหตุ หากต้องการแก้ไข้ที่อยู่การจัดส่งให้แก้ไขหน้าข้อมูลส่วนตัว',
                                style:
                                    TextStyle(fontSize: 15, color: Colors.red)),
                            const SizedBox(height: 20),
                            TextButton(
                              onPressed: () {
                                sendorders(
                                    widget.small,
                                    widget.big,
                                    widget.roll,
                                    widget.picdate,
                                    widget.pictime,
                                    widget.now,
                                    result,
                                    deposit,
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
                                        BorderRadius.all(Radius.circular(10))),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 30),
                                primary: const Color.fromARGB(255, 77, 158, 88),
                              ),
                            ),
                          ]),
                    ),
                  ),
                ),
              ),
            )
          : const Center(
              child: CupertinoActivityIndicator(),
            ),
    );
  }
}
