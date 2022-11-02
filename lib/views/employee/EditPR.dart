import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_project/config/api.dart';
import 'package:image_picker/image_picker.dart';

class EditPR extends StatefulWidget {
  EditPR({Key? key, required this.data}) : super(key: key);
  final dynamic data;
  @override
  State<EditPR> createState() => _EditPRState();
}

class _EditPRState extends State<EditPR> {
  File? _image;
  bool isTapped = false;
  TextEditingController description = TextEditingController();
  @override
  void initState() {
    super.initState();
    setState(() {
      description.text = widget.data['pr_description'];
      print(description);
      print(widget.data);
    });
  }

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
        title: const Text('แก้ไขประชาสัมพันธ์'),
        backgroundColor: const Color.fromARGB(255, 45, 134, 156),
        actions: [
          IconButton(
              onPressed: () {
                showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                            title: const Text('ลบข้อมูลประชาสัมพันธ์?'),
                            content:
                                const Text('ข้อมูลประชาสัมพันธ์จะถูกลบออก'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(context, 'Cancel'),
                                child: const Text(
                                  'ยกเลิก',
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                              TextButton(
                                onPressed: () =>
                                    deletePR(widget.data['pr_id'], context),
                                child: const Text('ตกลง'),
                              )
                            ]));
              },
              icon: Icon(Icons.delete))
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 50),
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
                    )),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
                child: Card(
                  color: const Color.fromARGB(255, 45, 134, 156),
                  shadowColor: const Color.fromARGB(255, 114, 114, 114),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      _image != null
                          ? SizedBox.fromSize(
                              child: Container(
                                  padding:
                                      const EdgeInsets.fromLTRB(25, 10, 25, 10),
                                  child: Image.file(
                                    _image!,
                                  )),
                            )
                          : widget.data['pr_photo'] != null
                              ? SizedBox.fromSize(
                                  child: Container(
                                      padding: const EdgeInsets.fromLTRB(
                                          25, 10, 25, 10),
                                      child: Image(
                                          image: NetworkImage(
                                            widget.data['pr_photo'],
                                          ),
                                          fit: BoxFit.cover)),
                                )
                              : SizedBox.fromSize(
                                  child: Container(
                                    padding: const EdgeInsets.fromLTRB(
                                        25, 10, 25, 10),
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
              const SizedBox(
                height: 30,
              ),
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
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 40),
                    primary: const Color.fromARGB(255, 108, 235, 255),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              _image != null
                  ? Container(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: ElevatedButton(
                        onPressed: () {
                          if (!isTapped) {
                            isTapped = true;
                            uploadPR(
                                _image!,
                                widget.data['pr_id'],
                                description.text,
                                DateTime.now().toString(),
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
      ),
    );
  }
}
