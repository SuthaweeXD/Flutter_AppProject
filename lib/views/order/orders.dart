// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_application_project/model/ModelOrders.dart';
import 'package:flutter_application_project/model/sidemenu.dart';

class Orders extends StatefulWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  TextEditingController small = TextEditingController();
  TextEditingController big = TextEditingController();
  TextEditingController roll = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 240, 180, 51),
        title: const Text('สั่งซื้อ'),
      ),
      body: Column(children: [
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const ModelOrders(
              ImagesP: ('assets/images/small.png'),
              TextP: ('เส้นเล็ก'),
            ),
            const SizedBox(
              width: 5,
            ),
            const ModelOrders(
              ImagesP: ('assets/images/big.png'),
              TextP: ('เส้นใหญ่'),
            ),
            const SizedBox(
              width: 5,
            ),
            const ModelOrdersNetwork(
              ImagesP:
                  ('https://github.com/SuthaweeXD/images/blob/main/roll.png?raw=true'),
              TextP: ('เส้นม้วน'),
            )
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        TextOrders(
          controller: small,
          texC: ('เส้นเล็ก'),
        ),
        TextOrders(
          controller: big,
          texC: ('เส้นใหญ่'),
        ),
        TextOrders(
          controller: roll,
          texC: ('เส้นม้วน'),
        ),
      ]),
      drawer: SideMenu(),
    );
  }
}
// 'https://github.com/SuthaweeXD/images/blob/main/roll.png?raw=true'