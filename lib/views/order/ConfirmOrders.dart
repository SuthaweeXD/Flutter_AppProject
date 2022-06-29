import 'package:flutter/material.dart';
import 'package:flutter_application_project/model/sidemenu.dart';

class ConfirmOrders extends StatefulWidget {
  ConfirmOrders({Key? key}) : super(key: key);

  @override
  State<ConfirmOrders> createState() => _ConfirmOrdersState();
}

class _ConfirmOrdersState extends State<ConfirmOrders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ยืนยันที่อยู่การจัดส่ง'),
      ),
      body: Column(
        children: [Text('ที่อยู่จัดส่งสินค้า')],
      ),
      drawer: SideMenu(),
    );
  }
}
