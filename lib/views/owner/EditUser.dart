import 'package:flutter/material.dart';
import 'package:flutter_application_project/config/api.dart';

import '../../model/TextModel.dart';

class EditUserOwn extends StatefulWidget {
  EditUserOwn({Key? key, required this.data}) : super(key: key);
  final dynamic data;

  @override
  State<EditUserOwn> createState() => _EditUserOwnState();
}

class _EditUserOwnState extends State<EditUserOwn> {
  TextEditingController fname = TextEditingController();
  TextEditingController lname = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController address = TextEditingController();

  @override
  void initState() {
    super.initState();
    print(widget.data);
    fname.text = widget.data['user_fname'];
    lname.text = widget.data['user_lname'];
    phone.text = widget.data['user_number'];
    address.text = widget.data['user_address'];
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 59, 115, 255),
        title: Text('แก้ไขข้อมูลผู้ใช้'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(40, 20, 40, 10),
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              CircleAvatar(
                child: Image.asset('assets/images/user.png'),
                backgroundColor: Color.fromARGB(255, 0, 0, 0),
                radius: 30,
              ),
              SizedBox(
                height: 20,
              ),
              TextFormFieldProfile(
                labelText: 'ชื่อ',
                controller: fname,
              ),
              SizedBox(
                height: 30,
              ),
              TextFormFieldProfile(
                labelText: 'นามสกุล',
                controller: lname,
              ),
              SizedBox(
                height: 30,
              ),
              TextFormFieldProfile(
                keytype: true,
                labelText: 'เบอร์โทรศัพท์',
                controller: phone,
              ),
              SizedBox(
                height: 30,
              ),
              TextFormFieldProfile(
                labelText: 'ที่อยู่',
                controller: address,
              ),

              // ElevatedButton(
              //   onPressed: () {},
              //   child: const Text('เลือกที่อยู่',
              //       style: TextStyle(
              //           color: Color.fromARGB(255, 255, 255, 255),
              //           fontSize: 16,
              //           fontWeight: FontWeight.w200)),
              //   style: ElevatedButton.styleFrom(
              //     shape: const RoundedRectangleBorder(
              //         borderRadius: BorderRadius.all(Radius.circular(10))),
              //     padding:
              //         const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
              //     primary: Color.fromARGB(255, 28, 122, 255),
              //   ),
              // ),
              // SizedBox(
              //   height: 10,
              // ),
              // // SizedBox(
              // //     height: 240,
              // //     width: 500,
              // //     child: widget.data != null
              // //         ? Card(
              // //             color: Color.fromARGB(255, 255, 236, 181),
              // //             shadowColor: const Color.fromARGB(255, 114, 114, 114),
              // //             shape: RoundedRectangleBorder(
              // //                 borderRadius: BorderRadius.circular(0)),
              // //             // child: AddressMap(
              // //             //   lat: widget.data['lat'],
              // //             //   lng: widget.data['lng'],
              // //             // ),
              // //           )
              // //         : Text('ไม่มีข้อมูล')),
              SizedBox(
                height: 40,
              ),
              ElevatedButton(
                onPressed: () {
                  sendDataProfile3(fname.text, lname.text, phone.text,
                      address.text, widget.data['user_id'], context);
                },
                child: const Text('ยืนยัน',
                    style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 27,
                        fontWeight: FontWeight.bold)),
                style: ElevatedButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(40))),
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 60),
                  primary: Color.fromARGB(255, 77, 158, 88),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
