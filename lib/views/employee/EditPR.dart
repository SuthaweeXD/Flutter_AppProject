import 'package:flutter/material.dart';

class EditPR extends StatefulWidget {
  EditPR({Key? key}) : super(key: key);

  @override
  State<EditPR> createState() => _EditPRState();
}

class _EditPRState extends State<EditPR> {
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
