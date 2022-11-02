import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_project/config/api.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/services.dart';

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
        title: Text('โอนชำระเงิน'),
        backgroundColor: const Color.fromARGB(255, 45, 134, 156),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 30),
              Container(
                padding: EdgeInsets.fromLTRB(45, 0, 45, 10),
                child: Column(
                  children: [
                    Icon(
                      Icons.paypal,
                      size: 50,
                      color: Colors.green,
                    ),
                    Text(
                      "พร้อมเพย์",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Card(
                      child: ListTile(
                        title: Text('0831854808'),
                        trailing: Icon(Icons.copy),
                        onTap: () async {
                          await Clipboard.setData(
                              ClipboardData(text: "0831854808"));
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.fromLTRB(25, 10, 25, 10),
                child: Card(
                  color: const Color.fromARGB(255, 204, 255, 172),
                  shadowColor: const Color.fromARGB(255, 114, 114, 114),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      _image != null
                          ? SizedBox.fromSize(
                              child: Image.file(_image!, fit: BoxFit.cover),
                            )
                          : widget.data['order_payment'] != null
                              ? SizedBox.fromSize(
                                  child: Container(
                                      padding:
                                          EdgeInsets.fromLTRB(25, 10, 25, 10),
                                      child: Image(
                                          image: NetworkImage(
                                            widget.data['order_payment'],
                                          ),
                                          fit: BoxFit.cover)),
                                )
                              : SizedBox.fromSize(
                                  child: Container(
                                    padding:
                                        EdgeInsets.fromLTRB(25, 10, 25, 10),
                                    child: Image.asset(
                                      'assets/images/empty.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: ElevatedButton(
                  onPressed: () {
                    getImage(ImageSource.gallery);
                  },
                  child: Row(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      // ignore: prefer_const_constructors
                      Icon(
                        Icons.photo,
                        size: 30,
                        color: Colors.grey,
                      ),
                      // ignore: prefer_const_constructors
                      SizedBox(
                        width: 20,
                      ),
                      const Text('อัปโหลดรูปภาพ',
                          style: TextStyle(
                              color: Color.fromARGB(255, 6, 6, 6),
                              fontSize: 22,
                              fontWeight: FontWeight.w500)),
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 40),
                    primary: Color.fromARGB(255, 108, 235, 255),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              _image != null
                  ? Container(
                      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: ElevatedButton(
                        onPressed: () {
                          if (!isTapped) {
                            isTapped = true;
                            uploadPayment(
                                _image!, widget.data['order_id'], context);
                          }
                        },
                        child: Row(
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            // ignore: prefer_const_constructors
                            Icon(Icons.payments, size: 30, color: Colors.grey),
                            // ignore: prefer_const_constructors
                            SizedBox(
                              width: 20,
                            ),
                            const Text('บันทึกการโอนชำระเงิน',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500)),
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 40),
                          primary: Color.fromARGB(255, 0, 255, 55),
                        ),
                      ),
                    )
                  : Text(''),

              // TextButton(
              //     style: TextButton.styleFrom(
              //       padding: const EdgeInsets.fromLTRB(70, 15, 70, 15),
              //       shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(10.0),
              //       ),
              //       backgroundColor: Color.fromARGB(255, 96, 192, 224),
              //       primary: const Color.fromARGB(255, 255, 255, 255),
              //       textStyle: const TextStyle(fontSize: 20),
              //     ),
              //     onPressed: () {
              //       if (!isTapped) {
              //         isTapped = true;
              //         uploadPayment(
              //             _image!, widget.data['order_id'], context);
              //       }
              //     },
              //     child: Row(
              //       children: [
              //         Icon(Icons.photo_album),
              //         SizedBox(width: 20),
              //         Text('[บันทึกการโอนชำระ'),
              //       ],
              //     ))
              // : Text(''),
            ],
          ),
        ),
      ),
    );
  }
}
