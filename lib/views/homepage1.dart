import 'package:flutter/material.dart';
import 'package:flutter_application_project/model/sidemenu.dart';
import 'package:flutter_application_project/views/order/CancleOrders.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.data}) : super(key: key);
  final dynamic data;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('รายละเอียดการสั่งซื้อ'),
      ),
      body: Column(
        children: [
          TextButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CancleOrders(),
                      //แก้ตรงนี้--------------------------------------------------------------------------------------
                    ),
                    (route) => false);
              },
              child: Text('ยกเลิก', style: TextStyle(fontSize: 18))),
        ],
      ),
      drawer: SideMenu(),
    );
  }
}
