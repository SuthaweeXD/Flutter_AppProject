import 'package:flutter/material.dart';
import 'package:flutter_application_project/config/api.dart';
import 'package:flutter_application_project/model/ColorCard.dart';
import 'package:flutter_application_project/model/sidemenu.dart';
import 'package:flutter_application_project/views/order/OrderDetail.dart';
import 'package:http/http.dart ' as http;
import 'package:intl/intl.dart';

class OrderDB extends StatefulWidget {
  const OrderDB({
    Key? key,
  }) : super(key: key);

  @override
  State<OrderDB> createState() => _OrderDBState();
}

class _OrderDBState extends State<OrderDB> {
  dynamic data;
  dynamic dataadd;
  @override
  void initState() {
    super.initState();
    startApi();
  }

  startApi() async {
    var item = await getOrders();
    var itemadd = await getdataprofile();
    setState(() {
      data = item;
      dataadd = itemadd;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 89, 160, 51),
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
            reverse: true,
            itemCount: data?.length ?? 0,
            itemBuilder: (context, i) => Container(
              height: 150,
              width: 45,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                          builder: (BuildContext context) => OrderDetail(
                                data: data[i],
                                dataadd: data,
                              )));
                },
                child: SizedBox(
                  height: 300,
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
                                IconStatus1(data[i]["order_status"]),
                                Container(
                                  padding: const EdgeInsets.all(22),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'ชื่อ : ${dataadd['user_fname']}'
                                        '  '
                                        'นามสกุล : ${dataadd['user_lname']}',
                                        style: TextStyle(fontSize: 18),
                                      ),

                                      Text(
                                        'วันที่สั่ง : ' +
                                            DateFormat('dd-MM-yyyy เวลา HH:mm')
                                                .format(DateTime.parse(
                                                    '${data[i]['order_date']}')),
                                        style: const TextStyle(fontSize: 16),
                                      ),
                                      const SizedBox(height: 2),
                                      Text(
                                        'วันที่รับ :' +
                                            DateFormat('dd-MM-yyyy เวลา HH:mm')
                                                .format(DateTime.parse(
                                                    '${data[i]['order_getdate']}')),
                                        style: const TextStyle(fontSize: 16),
                                      ),
                                      const SizedBox(
                                        height: 2,
                                      ),
                                      Text(
                                        'สถานะ : ' +
                                            ColorStatus(
                                                data[i]["order_status"]),
                                        style: const TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),

                                      const SizedBox(
                                        height: 2,
                                      ),
                                      // ignore: prefer_const_constructors
                                    ],
                                  ),
                                ),
                              ])
                        ]),
                  ),
                ),
              ),
            ),
          ),
        )),
      ),
      drawer: SideMenu(),
    );
  }
}
