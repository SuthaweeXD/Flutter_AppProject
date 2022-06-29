import 'package:flutter/material.dart';
import 'package:flutter_application_project/model/sidemenu.dart';

class HistoryOrders extends StatefulWidget {
  HistoryOrders({Key? key}) : super(key: key);

  @override
  State<HistoryOrders> createState() => _HistoryOrdersState();
}

class _HistoryOrdersState extends State<HistoryOrders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ประวัติการสั่งซื้อ'),
        backgroundColor: Color.fromARGB(255, 89, 160, 51),
      ),
      drawer: SideMenu(),
    );
  }
}
