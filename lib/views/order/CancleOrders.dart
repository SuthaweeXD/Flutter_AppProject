import 'package:flutter/material.dart';
import 'package:flutter_application_project/views/order/Orders.dart';
import 'package:intl/intl.dart';

class CancleOrders extends StatefulWidget {
  CancleOrders({Key? key}) : super(key: key);

  @override
  State<CancleOrders> createState() => _CancleOrdersState();
}

class _CancleOrdersState extends State<CancleOrders> {
  dynamic data;

  @override
  void initState() {
    super.initState();
    startApi();
  }

  startApi() async {
    dynamic item = await (74); //ส่งค่าไปยัง getdataหรือตัวรับapi
    setState(() {
      data = item;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ยกเลิกคำสั่งซื้อ'),
        backgroundColor: const Color.fromARGB(255, 160, 42, 207),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(3, 0, 3, 0),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: RefreshIndicator(
            onRefresh: () async {
              // startApi();
            },
            child: ListView.builder(
              itemCount:
                  data?.length ?? 0, //เอาออกไปก่อนเพราะตัวdata.lengthยังพังอยู่
              itemBuilder: (context, i) => InkWell(
                onTap: () {},
                child: Card(
                  elevation: 10,
                  color: const Color.fromARGB(255, 186, 198, 201),
                  shadowColor: const Color.fromARGB(255, 99, 108, 110),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(27),
                  ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              const SizedBox(
                                width: 20,
                              ),
                              const SizedBox(
                                width: 55.0,
                                height: 55.0,
                                child: CircleAvatar(),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Container(
                                padding: const EdgeInsets.all(25),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${data[i]['title']} ${data[i]['fname']} ${data[i]['lname']}',
                                      style: const TextStyle(fontSize: 15),
                                    ),

                                    // Text(
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
      ), //หน้าปุ่มsidemenu
    );
  }
}
