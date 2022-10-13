import 'package:flutter/material.dart';
import 'package:flutter_application_project/config/api.dart';
import 'package:flutter_application_project/views/employee/editcustomer.dart';

class UserDetail extends StatefulWidget {
  UserDetail({
    Key? key,
    required this.data,
  }) : super(key: key);
  final dynamic data;

  @override
  State<UserDetail> createState() => _UserDetailState();
}

class _UserDetailState extends State<UserDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 59, 115, 255),
          title: Text('รายละเอียดผู้ใช้งาน'),
        ),
        body: Container(
          padding: EdgeInsets.fromLTRB(25, 10, 25, 15),
          child: SizedBox(
            width: 950,
            height: 750,
            child: Card(
              color: Color.fromARGB(255, 171, 230, 255),
              shadowColor: const Color.fromARGB(255, 114, 114, 114),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0)),
              child: Column(children: [
                const SizedBox(
                  height: 25,
                ),
                CircleAvatar(),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'ชื่อ : ${widget.data['user_fname']}'
                  '  '
                  'นามสกุล : ${widget.data['user_lname']}'
                  '  ',
                  style: const TextStyle(
                      fontSize: 21, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'เบอร์โทรศัพท์ : '
                  '${widget.data['user_number']}',
                  style: const TextStyle(
                      fontSize: 21, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'ที่อยู่ในการจัดส่ง : \n'
                  '${widget.data['user_address']}',
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                            builder: (BuildContext context) =>
                                EditCustomer(data: widget.data)));
                  },
                  child: const Text('แก้ไขข้อมูล',
                      style: TextStyle(
                          color: Color.fromARGB(255, 248, 248, 248),
                          fontSize: 27,
                          fontWeight: FontWeight.bold)),
                  style: ElevatedButton.styleFrom(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(18))),
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 30),
                    primary: Color.fromARGB(255, 255, 196, 118),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                ElevatedButton(
                  onPressed: () {
                    showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                                title: const Text('ยกเลิกคำสั่งซื้อ'),
                                content:
                                    const Text('ข้อมูลคำสั่งซื้อจะถูกยกเลิก'),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(context, 'Cancel'),
                                    child: const Text('ยกเลิก'),
                                  ),
                                  TextButton(
                                    onPressed: () => deleteprofile(
                                        widget.data['user_id'], context),
                                    child: const Text('ตกลง'),
                                  ),
                                ]));
                  },
                  child: const Text('ลบข้อมูล',
                      style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 27,
                          fontWeight: FontWeight.bold)),
                  style: ElevatedButton.styleFrom(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(18))),
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 30),
                    primary: Color.fromARGB(255, 255, 33, 33),
                  ),
                )
              ]),
            ),
          ),
        ));
  }
}
