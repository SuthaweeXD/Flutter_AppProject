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
    dynamic item = await (74);
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
      body: Column(
        children: [Text('')],
      ),
    );
  }
}
