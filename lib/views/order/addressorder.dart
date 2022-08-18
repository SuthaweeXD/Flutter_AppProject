import 'package:flutter/material.dart';
import 'package:flutter_application_project/config/api.dart';
import 'package:flutter_application_project/model/TextModel.dart';

class AddressOrders extends StatefulWidget {
  AddressOrders({Key? key}) : super(key: key);

  @override
  State<AddressOrders> createState() => _AddressOrdersState();
}

class _AddressOrdersState extends State<AddressOrders> {
  TextEditingController phone = TextEditingController();
  TextEditingController address = TextEditingController();
  dynamic data;

  @override
  void initState() {
    super.initState();
    startApi();
  }

  startApi() async {
    var item = await getdataprofile();
    setState(() {
      data = item;
      // data['user_fname'] != null
      //     ? fname.text = data['user_fname']
      //     : fname.text = "";

      phone.text = data['user_number'];
      address.text = data['user_address'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('ที่อยู่สำหรับการจัดส่ง'),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 30,
            ),
            TextFormFieldProfile(
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
              height: 40,
            ),
          ],
        ));
  }
}
