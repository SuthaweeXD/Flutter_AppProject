import 'package:flutter/material.dart';

class checkpayment extends StatefulWidget {
  checkpayment({Key? key}) : super(key: key);

  @override
  State<checkpayment> createState() => _checkpaymentState();
}

class _checkpaymentState extends State<checkpayment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ตรวจสอบการโอนชำระ'),
      ),
    );
  }
}
