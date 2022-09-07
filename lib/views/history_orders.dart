import 'package:flutter/material.dart';
import 'package:flutter_application_project/config/api.dart';
import 'package:flutter_application_project/model/sidemenu.dart';
import 'package:flutter_application_project/views/homepage1.dart';
import 'package:intl/intl.dart';

class HistoryOrders extends StatefulWidget {
  HistoryOrders({Key? key}) : super(key: key);

  @override
  State<HistoryOrders> createState() => _HistoryOrdersState();
}

class _HistoryOrdersState extends State<HistoryOrders> {
  dynamic data;
  @override
  void initState() {
    super.initState();
    startApi();
  }

  startApi() async {
    var item = await gethistoryod();
    setState(() {
      data = item;
    });
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
              itemBuilder: (context, i) => InkWell(
                // onTap: () => Navigator.pushNamed(context, "/CDT"),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                          builder: (BuildContext context) =>
                              HomePage(data: data[i])));
                },
                child: Card(
                  elevation: 10,
                  color: Color.fromARGB(255, 255, 255, 255),
                  shadowColor: Color.fromARGB(255, 114, 114, 114),
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
                              const SizedBox(
                                width: 10,
                              ),
                              const SizedBox(
                                width: 20.0,
                                height: 20.0,
                                // color: Color.fromARGB(255, 150, 217, 234),
                                // ignore: prefer_const_constructors
                                child: CircleAvatar(
                                  backgroundColor:
                                      Color.fromARGB(255, 186, 186, 186),
                                ),
                              ),
                              const SizedBox(
                                width: 2,
                              ),
                              Container(
                                padding: const EdgeInsets.all(22),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'วันที่สั่ง : ' +
                                          DateFormat('dd-mm-yy KK:MM').format(
                                              DateTime.parse(
                                                  '${data[i]['order_date']}')),
                                      style: const TextStyle(fontSize: 17),

                                      // 'วันที่สั่ง : ${data[i]['order_date']}',
                                      // style: const TextStyle(fontSize: 17),
                                    ),
                                    const SizedBox(height: 2),
                                    Text(
                                      'วันที่รับ :' +
                                          DateFormat('dd-mm-yy KK:MM').format(
                                              DateTime.parse(
                                                  '${data[i]['order_getdate']}')),
                                      style: const TextStyle(fontSize: 17),
                                    ),
                                    const SizedBox(
                                      height: 2,
                                    ),
                                    Text(
                                      'เส้นเล็ก : ${data[i]['order_small']}'
                                      '  '
                                      'เส้นใหญ่ : ${data[i]['order_big']}'
                                      '  '
                                      'เส้นม้วน : ${data[i]['order_roll']}',
                                      style: TextStyle(fontSize: 15),
                                    ),
                                    const SizedBox(
                                      height: 2,
                                    ),
                                    Text(
                                      'ที่อยู่ในการจัดส่ง : '
                                      '${data[i]['order_address']}',
                                      style: const TextStyle(
                                        fontSize: 15,
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
          )),
      drawer: SideMenu(),
    );
  }
}
