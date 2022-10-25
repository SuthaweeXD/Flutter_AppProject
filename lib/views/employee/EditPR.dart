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
        title: Text('ประชาสัมพันธ์'),
        backgroundColor: const Color.fromARGB(255, 45, 134, 156),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 80),
              _image != null
                  ? ClipOval(
                      child: SizedBox.fromSize(
                        size: Size.fromRadius(150), // Image radius
                        child: Image.file(_image!, fit: BoxFit.cover),
                      ),
                    )
                  : widget.data['pr_photo'] != null
                      ? CircleAvatar(
                          // backgroundImage: avatarUser(),
                          backgroundImage:
                              NetworkImage(widget.data['pr_photo']),
                          radius: 150,
                        )
                      : CircleAvatar(
                          // backgroundImage: avatarUser(),
                          radius: 150,
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
              TextButton(
                  onPressed: () {
                    if (!isTapped) {
                      isTapped = true;
                      print(widget.data);
                      uploadPR(_image!, widget.data['pr_id'], context);
                    }
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.save,
                        color: Colors.white,
                      ),
                      Text('บันทึก'),
                    ],
                  )),
              Text('555'),
            ],
          ),
        ),
      ),
    );
  }
}
