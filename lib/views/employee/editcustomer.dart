import 'package:flutter/material.dart';
import 'package:flutter_application_project/model/sidemenu.dart';
import 'package:flutter_application_project/views/homepage.dart';

class EditCustomer extends StatefulWidget {
  const EditCustomer({Key? key, required this.data}) : super(key: key);
  final dynamic data;
  @override
  State<EditCustomer> createState() => _EditCustomerState();
}

class _EditCustomerState extends State<EditCustomer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('จัดการข้อมูลลูกค้า'),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(100, 20, 40, 50),
        child: Column(
          children: [
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(60))),
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 60),
                  primary: Color.fromARGB(255, 255, 36, 36),
                ),
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Customerhome(index: 0),
                        //แก้ตรงนี้--------------------------------------------------------------------------------------
                      ),
                      (route) => false);
                },
                child: Text(
                  'ยกเลิก',
                  style: TextStyle(fontSize: 18),
                )),
          ],
        ),
      ),
      drawer: SideMenu(),
    );
  }
}
