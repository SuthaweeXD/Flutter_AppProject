import 'package:flutter/material.dart';
import 'package:flutter_application_project/model/TextModel.dart';

import '../../config/api.dart';

class EditCustomer extends StatefulWidget {
  const EditCustomer({Key? key, required this.data}) : super(key: key);
  final dynamic data;
  @override
  State<EditCustomer> createState() => _EditCustomerState();
}

class _EditCustomerState extends State<EditCustomer> {
  TextEditingController fname = TextEditingController();
  TextEditingController lname = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController address = TextEditingController();

  @override
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
                radius: 60,
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
              SizedBox(
                height: 30,
              ),
              Container(
                padding: EdgeInsets.fromLTRB(35, 0, 35, 0),
                child: ElevatedButton(
                  onPressed: () {
                    sendDataProfile2(fname.text, lname.text, phone.text,
                        address.text, widget.data['user_id'], context);
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.save,
                        size: 30,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      const Text('ยืนยัน',
                          style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontSize: 27,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 40),
                    primary: Color.fromARGB(255, 77, 158, 88),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
