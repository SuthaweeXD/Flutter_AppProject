import 'package:flutter/material.dart';

// ignore: camel_case_types
class C_Orders extends StatefulWidget {
  const C_Orders({Key? key}) : super(key: key);

  @override
  State<C_Orders> createState() => C_OrdersState();
}

class C_OrdersState extends State<C_Orders> {
  TextEditingController type_message = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          margin: EdgeInsets.all(10),
          child: Row(
            children: [
              Container(
                width: 120.0,
                child: Image.asset('images/thin line.png'),
              ),
              Text(" "),
              Container(
                width: 120.0,
                child: Image.asset('images/เส้นม้วน.png'),
              ),
              Text(" "),
              Container(
                width: 124.0,
                child: Image.asset('images/เส้นใหญ่.png'),
              )
            ],
          )),

      // appBar: AppBar(
      //   title: Text("สั่งซื้อสินค้า    "),
      // ),
      // body: Center(
      //   child: Column(
      //     mainAxisSize: MainAxisSize.min,
      //     children: <Widget>[
      //       Container(width: 120.0,
      //       // child: Image.asset('image/thin line.png/'))
      //   )],
      //   ),
      // ),
    );
  }
}
