import 'package:flutter/material.dart';
import 'package:flutter_application_project/config/api.dart';
import 'package:flutter_application_project/model/ColorCard.dart';
import 'package:flutter_application_project/model/sidemenu.dart';
import 'package:flutter_application_project/views/order/OrderDetail.dart';
import 'package:intl/intl.dart';

class HistoryOrders extends StatefulWidget {
  HistoryOrders({Key? key}) : super(key: key);

  @override
  State<HistoryOrders> createState() => _HistoryOrdersState();
}

class _HistoryOrdersState extends State<HistoryOrders> {
  dynamic data;
  dynamic dataadd;
  @override
  void initState() {
    super.initState();
    startApi();
  }

  startApi() async {
    var item = await gethistoryod();
    var itemadd = await getdataprofile();
    setState(() {
      data = item;
      dataadd = itemadd;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ประวัติการสั่งซื้อ'),
        backgroundColor: Color.fromARGB(255, 89, 160, 51),
      ),
      body: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: RefreshIndicator(
            onRefresh: () async {
              startApi();
            },
            child: ListView.builder(
              itemCount: data?.length ?? 0,
              itemBuilder: (context, i) => Container(
                height: 200,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                            builder: (BuildContext context) => OrderDetail(
                                  data: data[i],
                                  dataadd: dataadd,
                                )));
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
                                  padding: const EdgeInsets.all(22),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'ชื่อ : ${dataadd['user_fname']}',
                                        style: TextStyle(fontSize: 18),
                                      ),
                                      Text(
                                        'นามสกุล : ${dataadd['user_lname']}',
                                        style: TextStyle(fontSize: 18),
                                      ),

                                      Text(
                                        'วันที่สั่ง : ' +
                                            DateFormat(
                                                    'dd-MM-yyyy เวลา HH:mm น.')
                                                .format(DateTime.parse(
                                                    '${data[i]['order_date']}')),
                                        style: const TextStyle(fontSize: 16),
                                      ),
                                      const SizedBox(height: 2),
                                      Text(
                                        'วันที่รับ : ' +
                                            DateFormat(
                                                    'dd-MM-yyyy เวลา HH:mm น.')
                                                .format(DateTime.parse(
                                                    '${data[i]['order_getdate']}')),
                                        style: const TextStyle(fontSize: 16),
                                      ),
                                      const SizedBox(
                                        height: 2,
                                      ),
                                      Text(
                                        'สถานะ  \n: ' +
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
          )),
      drawer: SideMenu(),
    );
  }
}
