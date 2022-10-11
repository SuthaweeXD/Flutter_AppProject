import 'package:flutter/material.dart';

class statusDB extends StatefulWidget {
  statusDB({Key? key}) : super(key: key);

  @override
  State<statusDB> createState() => _statusDBState();
}

class _statusDBState extends State<statusDB> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 59, 115, 255),
        title: Text('ประชาสัมพันธ์'),
      ),
    );
  }
}
