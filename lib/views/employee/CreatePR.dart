import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_project/config/api.dart';
import 'package:image_picker/image_picker.dart';

class CreatePR extends StatefulWidget {
  CreatePR({Key? key}) : super(key: key);

  @override
  State<CreatePR> createState() => _CreatePRState();
}

class _CreatePRState extends State<CreatePR> {
  File? _image;
  bool isTapped = false;
  DateTime prdate = DateTime.now();

  TextEditingController description = TextEditingController();

  Future getImage(ImageSource imggallary) async {
    final image = await ImagePicker().pickImage(source: imggallary);
    if (image == null) return;

    final imageTemporary = File(image.path);
    setState(() {
      this._image = imageTemporary;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('เพิ่มประชาสัมพันธ์'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30),
            Container(
              padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
              child: TextFormField(
                  controller: description,
                  style: const TextStyle(color: Colors.black),
                  // ignore: prefer_const_constructors
                  decoration: InputDecoration(
                    labelText: 'ชื่อประชาสัมพันธ์',
                    hintText: 'ชื่อประชาสัมพันธ์',
                    labelStyle: const TextStyle(color: Colors.black),
                    hintStyle: const TextStyle(color: Colors.black),
                    enabledBorder: const OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 0, 0, 0)),
                      borderRadius: BorderRadius.all(
                        Radius.circular(150),
                      ),
                    ),
                    errorBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.pink),
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Color.fromARGB(255, 0, 0, 0)),
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(30),
                      ),
                    ),
                  )),
            ),
            SizedBox(height: 20),
            _image != null
                ? SizedBox.fromSize(
                    child: Container(
                        padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
                        child: Image.file(
                          _image!,
                        )),
                  )
                : SizedBox.fromSize(
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
                      child: Image.asset(
                        'assets/images/empty.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
            SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
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
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                  primary: const Color.fromARGB(255, 108, 235, 255),
                ),
              ),
            ),
            SizedBox(height: 20),
            _image != null
                ? Container(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: ElevatedButton(
                      onPressed: () {
                        if (!isTapped) {
                          isTapped = true;
                          createPR(_image!, description.text, prdate.toString(),
                              context);
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
                          const Text('บันทึกประชาสัมพันธ์',
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
                        primary: const Color.fromARGB(255, 0, 255, 55),
                      ),
                    ),
                  )
                : const Text(''),
          ],
        ),
      ),
    );
  }
}
