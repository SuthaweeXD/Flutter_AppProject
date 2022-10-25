// ignore_for_file: non_constant_identifier_names

import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_project/views/employee/UsersDB.dart';
import 'package:flutter_application_project/views/order/ConfirmOrders.dart';
import 'package:flutter_application_project/views/order/OrdersDB.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ModelOrders extends StatelessWidget {
  const ModelOrders({Key? key, this.ImagesP, this.TextP}) : super(key: key);

  final String? ImagesP;
  final String? TextP;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            color: const Color.fromARGB(255, 77, 158, 88),
            padding: const EdgeInsets.fromLTRB(7, 7, 7, 13),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                ImagesP!,
                width: 110,
                height: 110,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Text(
          TextP!,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class ModelOrdersNetwork extends StatelessWidget {
  const ModelOrdersNetwork({Key? key, this.ImagesP, this.TextP})
      : super(key: key);

  final String? ImagesP;
  final String? TextP;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            color: const Color.fromARGB(255, 77, 158, 88),
            padding: const EdgeInsets.fromLTRB(7, 7, 7, 13),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                ImagesP!,
                width: 110,
                height: 110,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Text(
          TextP!,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class TextOrders extends StatelessWidget {
  const TextOrders({Key? key, this.controller, this.texC}) : super(key: key);

  final String? texC;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          texC!,
          style: const TextStyle(fontSize: 18),
        ),
        SizedBox(
            height: 50,
            width: 150,
            child: SpinBox(
                value: 0,
                decimals: 1,
                step: 0.5,
                max: 2000,
                showButtons: true,
                decoration:
                    const InputDecoration(labelText: 'ระบุจำนวนที่ต้องการ'),
                iconColor: MaterialStateProperty.resolveWith((states) {
                  if (states.contains(MaterialState.disabled)) {
                    return Color.fromARGB(255, 255, 28, 12);
                  }
                  if (states.contains(MaterialState.focused)) {
                    return Colors.green;
                  }
                }),
                onChanged: (value) {
                  controller?.text = value.toString();
                  print(controller?.text);
                })),
        const Text(
          'กิโลกรัม',
          style: TextStyle(fontSize: 18),
        ),
      ],
    );
  }
}

Future<void> normalDialog(BuildContext context, String message) async {
  showDialog(
      context: context,
      builder: (context) => AlertDialog(
              title: Text(
                message,
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context, 'OK'),
                  child: const Text('OK'),
                )
              ]));
}

Future<void> normalDialogAlert(BuildContext context, String message) async {
  showDialog(
      context: context,
      builder: (context) => AlertDialog(
              title: Text(
                message,
                style: TextStyle(color: Colors.red),
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context, 'OK'),
                  child: const Text('ตกลง'),
                )
              ]));
}
