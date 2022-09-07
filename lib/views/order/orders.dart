// ignore_for_file: file_names

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_project/config/api.dart';
import 'package:flutter_application_project/config/config.dart';
import 'package:flutter_application_project/model/ModelOrders.dart';
import 'package:flutter_application_project/model/sidemenu.dart';
import 'package:flutter_application_project/views/map.dart';
import 'package:flutter_application_project/views/order/ConfirmOrders.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Orders extends StatefulWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  TextEditingController small = TextEditingController();
  TextEditingController big = TextEditingController();
  TextEditingController roll = TextEditingController();
  TextEditingController picdate = TextEditingController();
  TextEditingController pictime = TextEditingController();
  DateTime? odate;
  TimeOfDay? selecttime;
  DateTime? datenow = DateTime.now();

  DateTime now = DateTime.now();

  @override
  Widget build(BuildContext context) {
    void newDate() async {
      odate = await showDatePicker(
          context: context,
          initialDate: datenow!,
          firstDate: DateTime(DateTime.now().year, DateTime.now().month, 1),
          lastDate: DateTime(DateTime.now().year, DateTime.now().month, 90));
      if (odate != null) {
        setState(() {
          datenow = odate;
          picdate.text = DateFormat("yyyy-MM-dd").format(odate!);
          DateFormat("yyyy-MM-dd").format(odate!);
        });
      }
    }

    void newTime() async {
      selecttime =
          await showTimePicker(context: context, initialTime: TimeOfDay.now());
      if (selecttime != null) {
        setState(() {
          // datenow = date;
          pictime.text = '${selecttime!.hour}:${selecttime?.minute}';
          // DateFormat("dd/MM/yyyy").format(date);
        });
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 77, 158, 88),
        title: const Text('สั่งซื้อ'),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,

            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const ModelOrders(
                ImagesP: ('assets/images/small.png'),
                TextP: ('เส้นเล็ก'),
              ),
              const SizedBox(
                width: 5,
              ),
              const ModelOrders(
                ImagesP: ('assets/images/big.png'),
                TextP: ('เส้นใหญ่'),
              ),
              const SizedBox(
                width: 5,
              ),
              const ModelOrdersNetwork(
                ImagesP:
                    ('https://github.com/SuthaweeXD/images/blob/main/roll.png?raw=true'),
                TextP: ('เส้นม้วน'),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          TextOrders(
            controller: small,
            texC: (' เส้นเล็ก'),
          ),
          SizedBox(
            height: 10,
          ),
          TextOrders(
            controller: big,
            texC: ('เส้นใหญ่'),
          ),
          SizedBox(
            height: 10,
          ),
          TextOrders(
            controller: roll,
            texC: (' เส้นม้วน'),
          ),
          SizedBox(
            height: 10,
          ),
          const SizedBox(
            height: 20,
          ),

          // ignore: prefer_const_constructors
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 10, 30, 20),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(children: [
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: picdate,
                  readOnly: true,
                  onTap: () {
                    newDate();
                  },
                  decoration: const InputDecoration(
                    labelText: 'วันที่ต้องการรับ',
                    labelStyle: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                    hintStyle: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 0, 0, 0), width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(100))),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 23, 142, 239),
                            width: 1.5),
                        borderRadius: BorderRadius.all(Radius.circular(100))),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: pictime,
                  readOnly: true,
                  onTap: () {
                    newTime();
                  },
                  decoration: const InputDecoration(
                    labelText: 'เวลา',
                    labelStyle: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                    hintStyle: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 0, 0, 0), width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(100))),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 23, 142, 239),
                            width: 1.5),
                        borderRadius: BorderRadius.all(Radius.circular(100))),
                  ),
                ),
              ]),
            ),
          ),
          // ignore: prefer_const_constructors
          SizedBox(
            height: 5,
          ),
          ElevatedButton(
            onPressed: () {
              // Navigator.push(
              //     context,
              //     MaterialPageRoute<void>(
              //         builder: (BuildContext context) => AddressMap()));
              sendorders(small.text, big.text, roll.text, picdate.text,
                  pictime.text, now.toString(), context);
            },
            child: const Text('ถัดไป',
                style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontSize: 27,
                    fontWeight: FontWeight.bold)),
            style: ElevatedButton.styleFrom(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(60))),
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 60),
              primary: Color.fromARGB(255, 77, 158, 88),
            ),
          ),
        ]),
      ),
      drawer: SideMenu(),
    );
  }
}

// Future sendorders(small, big, roll, picdate, pictime, now, context) async {
//   final prefs =
//       await SharedPreferences.getInstance(); //เพิ่มตัวแชร์จากหน้าlogin
//   int? userid = prefs.getInt('idm');
//   Uri url = Uri.parse('http://192.168.1.112:3200/api/orders');
//   http
//       .post(
//     url,
//     headers: headers,
//     body: jsonEncode({
//       "userid": userid,
//       "small": small,
//       "big": big,
//       "roll": roll,
//       "ogetdate": picdate + ' ' + pictime,
//       "odate": now
//     }),
//   )
//       .then((req) async {
//     print(req.statusCode);
//     print(picdate);
//     print(pictime);

//     if (req.statusCode == 201) {
//       EasyLoading.showSuccess('Great Success!');
//       Navigator.of(context).pushAndRemoveUntil(
//           MaterialPageRoute(builder: (context) => ConfirmOrders()),
//           (Route<dynamic> route) => false);
//     } else {
//       EasyLoading.showError('Failed with Error');
//     }
//   });
// }
