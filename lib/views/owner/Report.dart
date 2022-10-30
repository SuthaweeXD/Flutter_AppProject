import 'package:flutter/material.dart';
import 'package:flutter_application_project/config/api.dart';
import 'package:flutter_application_project/views/owner/ChartReport.dart';
import 'package:intl/intl.dart';
import 'package:fl_chart/fl_chart.dart';

class ReportOrder extends StatefulWidget {
  ReportOrder({Key? key, this.data}) : super(key: key);
  final dynamic data;

  @override
  State<ReportOrder> createState() => _ReportOrderState();
}

class _ReportOrderState extends State<ReportOrder> {
  TextEditingController startdate = TextEditingController();
  TextEditingController enddate = TextEditingController();
  dynamic datareport;
  DateTime? odate;
  DateTime? datenow = DateTime.now();

  DateTime now = DateTime.now();
  @override
  Widget build(BuildContext context) {
    void startDate() async {
      odate = await showDatePicker(
          context: context,
          initialDate: datenow!,
          firstDate: DateTime(DateTime.now().year, DateTime.now().month - 5, 1),
          lastDate: DateTime(
            DateTime.now().year,
            DateTime.now().month + 3,
          ));
      if (odate != null) {
        setState(() {
          datenow = odate;
          startdate.text = DateFormat("yyyy-MM-dd").format(odate!);
          DateFormat("dd-MM-yyyy").format(odate!);
          print(datenow);
        });
      }
    }

    void endDate() async {
      odate = await showDatePicker(
          context: context,
          initialDate: datenow!,
          firstDate: datenow!,
          lastDate: DateTime(DateTime.now().year, DateTime.now().month, 90));
      if (odate != null) {
        setState(() {
          datenow = odate;
          enddate.text = DateFormat("yyyy-MM-dd").format(odate!);
          DateFormat("dd-MM-yyyy").format(odate!);
        });
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 59, 115, 255),
        title: Text('สรุปการขาย'),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30, 10, 30, 20),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(children: [
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: startdate,
              readOnly: true,
              onTap: () {
                startDate();
              },
              decoration: const InputDecoration(
                labelText: 'เริ่มต้น',
                labelStyle: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                hintStyle: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color.fromARGB(255, 0, 0, 0), width: 1),
                    borderRadius: BorderRadius.all(Radius.circular(100))),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color.fromARGB(255, 23, 142, 239), width: 1.5),
                    borderRadius: BorderRadius.all(Radius.circular(100))),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text('ถึง'),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: enddate,
              readOnly: true,
              onTap: () {
                endDate();
              },
              decoration: const InputDecoration(
                labelText: 'สิ้นสุด',
                labelStyle: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                hintStyle: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color.fromARGB(255, 0, 0, 0), width: 1),
                    borderRadius: BorderRadius.all(Radius.circular(100))),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color.fromARGB(255, 23, 142, 239), width: 1.5),
                    borderRadius: BorderRadius.all(Radius.circular(100))),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    var data =
                        await getReportOrders(startdate.text, enddate.text);
                    setState(() {
                      datareport = data;
                      //ใช้ datareportได้แล้ว
                      print(datareport);
                      print(datareport['totalorder']);
                    });
                    Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                            builder: (BuildContext context) => ChartReport(
                                  data: datareport,
                                )));
                  },
                  child: const Text('ค้นหา',
                      style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 15,
                          fontWeight: FontWeight.w500)),
                  style: ElevatedButton.styleFrom(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 40),
                    primary: Color.fromARGB(255, 55, 255, 102),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('เคลียร์ข้อมูล',
                      style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 15,
                          fontWeight: FontWeight.w500)),
                  style: ElevatedButton.styleFrom(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 30),
                    primary: Color.fromARGB(255, 251, 255, 0),
                  ),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
