import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_project/model/sidemenu.dart';
import 'package:flutter_application_project/views/homepage1.dart';
import 'package:http/http.dart ' as http;

class OrderDB extends StatefulWidget {
  const OrderDB({Key? key}) : super(key: key);

  @override
  State<OrderDB> createState() => _OrderDBState();
}

class _OrderDBState extends State<OrderDB> {
  dynamic data;
  @override
  void initState() {
    super.initState();
    startApi();
  }

  startApi() async {
    var item = await getOrders();
    setState(() {
      data = item;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 115, 243),
        title: const Text("ข้อมูลคำสั่งซื้อ"),
      ),
      backgroundColor: const Color.fromARGB(255, 227, 227, 227),
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
                                      'วันที่สั่ง : ${data[i]['order_date']}',
                                      style: const TextStyle(fontSize: 17),
                                    ),
                                    const SizedBox(height: 2),
                                    Text(
                                      'วันที่รับ :'
                                      '${data[i]['order_getdate']} ',
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

Future<dynamic> getOrders() async {
  Uri url = Uri.parse('http://192.168.43.18:3200/api/orders');
  return await http
      .get(
    url,
  )
      .then((req) async {
    print(req.statusCode);
    if (req.statusCode == 200) {
      var data = jsonDecode(req.body);
      return data;
    } else {
      return null;
    }
  });
}
