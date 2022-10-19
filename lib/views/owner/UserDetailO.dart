import 'package:flutter/material.dart';
import 'package:flutter_application_project/views/owner/EditUser.dart';

import '../../config/api.dart';

class UserDetailO extends StatefulWidget {
  UserDetailO({Key? key, required this.data}) : super(key: key);
  final dynamic data;

  @override
  State<UserDetailO> createState() => _UserDetailOState();
}

class _UserDetailOState extends State<UserDetailO> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 59, 115, 255),
          title: Text('รายละเอียดผู้ใช้งาน'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 25,
              ),
              CircleAvatar(
                child: Image.asset('assets/images/user.png'),
                backgroundColor: Color.fromARGB(255, 0, 0, 0),
                radius: 60,
              ),
              const SizedBox(
                width: 2,
              ),
              Container(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 15),
                child: SizedBox(
                  width: 950,
                  height: 400,
                  child: Card(
                    color: Color.fromARGB(255, 171, 230, 255),
                    shadowColor: const Color.fromARGB(255, 114, 114, 114),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Container(
                      padding: EdgeInsets.fromLTRB(15, 10, 15, 15),
                      child: Column(children: [
                        const SizedBox(
                          height: 25,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          '${widget.data['user_fname']}'
                          '   '
                          '${widget.data['user_lname']}'
                          '  ',
                          style: const TextStyle(
                              fontSize: 22, fontWeight: FontWeight.w600),
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
                        Card(
                          color: Color.fromARGB(255, 255, 255, 255),
                          shadowColor: const Color.fromARGB(255, 114, 114, 114),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: Container(
                            padding: EdgeInsets.fromLTRB(15, 10, 15, 15),
                            child: Column(
                              children: [
                                Icon(
                                  Icons.home_rounded,
                                  size: 45,
                                  color: Colors.blueAccent,
                                ),
                                Text(
                                  'ที่อยู่ในการจัดส่ง : ',
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  '${widget.data['user_address']}',
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                      ]),
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(25, 10, 10, 15),
                child: Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute<void>(
                                builder: (BuildContext context) =>
                                    EditUserOwn(data: widget.data)));
                      },
                      child: Row(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Icon(Icons.edit),
                          const SizedBox(
                            width: 2,
                          ),
                          const Text('แก้ไขข้อมูล',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 248, 248, 248),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500)),
                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        primary: Color.fromARGB(255, 255, 196, 118),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                                    title: const Text('ลบข้อมูลผู้ใช้งาน?'),
                                    content:
                                        const Text('ข้อมูลผู้ใช้งานจะถูกลบออก'),
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
                                        onPressed: () => deleteprofile1(
                                            widget.data['user_id'], context),
                                        child: const Text('ตกลง'),
                                      ),
                                    ]));
                      },
                      child: Row(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Icon(Icons.delete),
                          const Text('ลบข้อมูล',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500)),
                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        primary: Color.fromARGB(255, 255, 33, 33),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ));
  }
}
