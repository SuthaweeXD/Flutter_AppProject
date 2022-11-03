import 'package:flutter/material.dart';
import 'package:flutter_application_project/views/employee/CheckPayment.dart';
import 'package:intl/intl.dart';

import '../../config/api.dart';
import '../../model/ColorCard.dart';
import '../../model/SidemenuEmp.dart';

class checkpayment extends StatefulWidget {
  checkpayment({Key? key}) : super(key: key);

  @override
  State<checkpayment> createState() => _checkpaymentState();
}

class _checkpaymentState extends State<checkpayment> {
  dynamic data;
  dynamic dataadd;
  @override
  void initState() {
    super.initState();
    startApi();
  }

  startApi() async {
    var item = await getPayment();

    setState(() {
      data = item;
      print(data);
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 59, 115, 255),
        title: const Text("ข้อมูลคำสั่งซื้อ"),
      ),
      backgroundColor: const Color.fromARGB(255, 227, 227, 227),
      body: Container(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: SizedBox(
            child: RefreshIndicator(
          onRefresh: () async {
            startApi();
          },
          child: ListView.builder(
            itemCount: data?.length ?? 0,
            itemBuilder: (context, i) => Container(
              height: 130,
              width: 20,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                          builder: (BuildContext context) =>
                              CheckPayment1(data: data[i])));
                },
                child: Card(
                  elevation: 10,
                  color: data[i]["order_status"] != null
                      ? ColorCard(data[i]["order_status"])
                      : const Color.fromARGB(255, 255, 255, 255),
                  shadowColor: const Color.fromARGB(255, 114, 114, 114),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ListTile(
                    leading: Card(
                      child: Column(
                        children: [
                          IconStatus1(data[i]["order_status"]),
                        ],
                      ),
                    ),
                    title: Text(
                        'ชื่อ : ${data[i]['user_fname']} ${data[i]['user_lname']}'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'วันที่สั่ง : ' +
                              DateFormat('dd-MM-yyyy เวลา HH:mm').format(
                                  DateTime.parse('${data[i]['order_date']}')),
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          'วันที่รับ : ' +
                              DateFormat('dd-MM-yyyy เวลา HH:mm').format(
                                  DateTime.parse(
                                      '${data[i]['order_getdate']}')),
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Text(
                          'สถานะ : ' + ColorStatus(data[i]["order_status"]),
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        )),
      ),
      drawer: SideMenuEmp(),
    );
  }
}
