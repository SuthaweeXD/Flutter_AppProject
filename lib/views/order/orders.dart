// ignore_for_file: file_names

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_project/model/ModelOrders.dart';
import 'package:flutter_application_project/model/sidemenu.dart';
import 'package:flutter_application_project/views/order/ConfirmOrders.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class Orders extends StatefulWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  TextEditingController small = TextEditingController(text: '0.0');
  TextEditingController big = TextEditingController(text: '0.0');
  TextEditingController roll = TextEditingController(text: '0.0');
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
          firstDate: datenow!,
          lastDate: DateTime(DateTime.now().year, DateTime.now().month + 3));
      if (odate != null) {
        setState(() {
          datenow = odate;
          picdate.text = DateFormat("yyyy-MM-dd").format(odate!);
          DateFormat("dd-MM-yyyy").format(odate!);
        });
      }
    }

    void newTime() async {
      selecttime =
          await showTimePicker(context: context, initialTime: TimeOfDay.now());
      if (selecttime != null) {
        setState(() {
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
          Container(
            padding: EdgeInsets.fromLTRB(2, 0, 2, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,

              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        color: const Color.fromARGB(255, 77, 158, 88),
                        padding: const EdgeInsets.fromLTRB(7, 7, 7, 13),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            ('assets/images/small.png'),
                            width: 99,
                            height: 99,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      'เส้นเล็ก',
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),

                Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        color: const Color.fromARGB(255, 77, 158, 88),
                        padding: const EdgeInsets.fromLTRB(7, 7, 7, 13),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            ('assets/images/big.png'),
                            width: 99,
                            height: 99,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      'เส้นใหญ่',
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),

                Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        color: const Color.fromARGB(255, 77, 158, 88),
                        padding: const EdgeInsets.fromLTRB(7, 7, 7, 13),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            ('assets/images/roll.png'),
                            width: 99,
                            height: 99,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      'เส้นม้วน',
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),

                // const ModelOrders(
                //   ImagesP: ('assets/images/small.png'),
                //   TextP: ('เส้นเล็ก'),
                // ),
                // const SizedBox(
                //   width: 5,
                // ),
                // const ModelOrders(
                //   ImagesP: ('assets/images/big.png'),
                //   TextP: ('เส้นใหญ่'),
                // ),
                // const SizedBox(
                //   width: 5,
                // ),
                // const ModelOrders(
                //   ImagesP: ('assets/images/roll.png'),
                //   TextP: ('เส้นม้วน'),
                // ),
              ],
            ),
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
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'มีช่องว่าง';
                    } else {
                      return null;
                    }
                  },
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
              double.parse(small.text) +
                              double.parse(big.text) +
                              double.parse(roll.text) <
                          5 ||
                      picdate.text == "" ||
                      pictime.text == ""
                  ? normalDialogAlert(context,
                      ('*กรุณากรอกให้ถูกต้อง สั่งขั้นต่ำทั้งหมด 5 กิโลกรัมขึ้นไป'))
                  : Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ConfirmOrders(
                            small: small.text,
                            big: big.text,
                            roll: roll.text,
                            picdate: picdate.text,
                            pictime: pictime.text,
                            now: now.toString()),
                      ));
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
