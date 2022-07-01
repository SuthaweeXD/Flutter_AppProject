import 'package:flutter/material.dart';
import 'package:flutter_application_project/model/sidemenu.dart';
import 'package:flutter_application_project/views/homepage.dart';

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
        children: [
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(60))),
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 60),
                primary: Color.fromARGB(255, 77, 158, 88),
              ),
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Customerhome(index: 1),
                      //แก้ตรงนี้--------------------------------------------------------------------------------------
                    ),
                    (route) => false);
              },
              child: Text(
                'ยืนยัน',
                style: TextStyle(fontSize: 18),
              )),
        ],
      ),
      drawer: SideMenu(),
    );
  }
}
