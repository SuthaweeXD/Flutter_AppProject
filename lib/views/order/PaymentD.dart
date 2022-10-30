import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_project/config/api.dart';
import 'package:flutter_application_project/views/Homepage.dart';
import 'package:image_picker/image_picker.dart';

class PaymentD extends StatefulWidget {
  PaymentD({Key? key, required this.data}) : super(key: key);
  final dynamic data;

  @override
  State<PaymentD> createState() => _PaymentDState();
}

class _PaymentDState extends State<PaymentD> {
  File? _image;
  bool isTapped = false;
  Future getImage(ImageSource imggallary) async {
    final image = await ImagePicker().pickImage(source: imggallary);
    if (image == null) return;

    final imageTemporary = File(image.path);
    setState(() {
      this._image = imageTemporary;
      print(widget.data);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('โอนชำระ'),
        backgroundColor: const Color.fromARGB(255, 45, 134, 156),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 80),
              _image != null
                  ? SizedBox.fromSize(
                      child: Image.file(_image!, fit: BoxFit.cover),
                    )
                  : SizedBox.fromSize(
                      child: Container(
                        padding: EdgeInsets.fromLTRB(25, 10, 25, 0),
                        child: Image.asset(
                          'assets/images/empty.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
              SizedBox(height: 60),
              SizedBox(
                width: 350,
                height: 80,
              ),
              SizedBox(height: 20),
              SizedBox(
                width: 350,
                height: 80,
                child: TextButton(
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.fromLTRB(70, 15, 70, 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      backgroundColor: Color.fromARGB(255, 96, 192, 224),
                      primary: const Color.fromARGB(255, 255, 255, 255),
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      getImage(ImageSource.gallery);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.photo_album),
                        SizedBox(width: 20),
                        Text('อัปโหลดรูปภาพ'),
                      ],
                    )),
              ),
              _image != null
                  ? TextButton(
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.fromLTRB(70, 15, 70, 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        backgroundColor: Color.fromARGB(255, 96, 192, 224),
                        primary: const Color.fromARGB(255, 255, 255, 255),
                        textStyle: const TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        if (!isTapped) {
                          isTapped = true;
                          uploadPayment(
                              _image!, widget.data['order_id'], context);
                        }
                      },
                      child: Row(
                        children: [
                          Icon(Icons.photo_album),
                          SizedBox(width: 20),
                          Text('[บันทึกการโอนชำระ'),
                        ],
                      ))
                  : Text(''),
            ],
          ),
        ),
      ),
    );
  }
}
