import 'package:flutter/material.dart';
import 'package:flutter_application_project/model/SideMenuOwn.dart';
import 'package:flutter_application_project/views/owner/EditOrderOwn.dart';
import 'package:intl/intl.dart';

import '../../config/api.dart';
import '../../model/ColorCard.dart';
import '../employee/EditOrder.dart';

class OrderOwn extends StatefulWidget {
  OrderOwn({Key? key}) : super(key: key);

  @override
  State<OrderOwn> createState() => _OrderOwnState();
}

class _OrderOwnState extends State<OrderOwn> {
  dynamic data;
  dynamic dataadd;
  @override
  void initState() {
    super.initState();
    startApi();
  }

  startApi() async {
    var item = await getOrders();
    var itemadd = await getdataprofile1();
    setState(() {
      data = item;
      dataadd = itemadd;
    });
  }

  var size, height, width;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
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
            // reverse: true,
            itemCount: data?.length ?? 0,
            itemBuilder: (context, i) => Container(
              height: 200,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                          builder: (BuildContext context) =>
                              EditOrderOwn(data: data[i])));
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
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(
                                width: 10,
                              ),
                              Card(
                                child: Row(children: <Widget>[
                                  IconStatus1(data[i]["order_status"]),
                                ]),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                              ),
                              Container(
                                padding: const EdgeInsets.all(8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'ชื่อ : ${data[i]['user_fname']}',
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    Text(
                                      'นามสกุล : ${data[i]['user_fname']}',
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    Text(
                                      'วันที่สั่ง : ' +
                                          DateFormat(
                                                  'dd-MM-yyyy เวลา HH:mm น. ')
                                              .format(DateTime.parse(
                                                  '${data[i]['order_date']}')),
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                    const SizedBox(height: 2),
                                    Text(
                                      'วันที่รับ :' +
                                          DateFormat(
                                                  'dd-MM-yyyy เวลา HH:mm น. ')
                                              .format(DateTime.parse(
                                                  '${data[i]['order_getdate']}')),
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                    const SizedBox(
                                      height: 2,
                                    ),
                                    Expanded(
                                      child: Text(
                                        'สถานะ : ' +
                                            ColorStatus(
                                                data[i]["order_status"]),
                                        style: const TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ])
                      ]),
                ),
              ),
            ),
          ),
        )),
      ),
      drawer: SideMenuOwn(),
    );
  }
}
