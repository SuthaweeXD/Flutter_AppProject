import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_project/config/api.dart';
import 'package:flutter_application_project/model/SidemenuEmp.dart';
import 'package:intl/intl.dart';

class ChartDaily extends StatefulWidget {
  ChartDaily({Key? key}) : super(key: key);

  @override
  State<ChartDaily> createState() => _ChartDailyState();
}

class _ChartDailyState extends State<ChartDaily> {
  DateTime? now = DateTime.now();
  dynamic data;
  int touchedIndex = -1;

  @override
  void initState() {
    startAPI();
    super.initState();
  }

  startAPI() async {
    String startDate, endDate;
    startDate = DateFormat("yyyy-MM-dd 00.00").format(now!);
    endDate = DateFormat("yyyy-MM-dd 23.59").format(now!);
    var item = await getReportAllOrder(startDate, endDate);
    setState(() {
      data = item;
      print(data);
      print(now.toString());
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('แผนภูมิประจำวัน'),
      ),
      body: data != null
          ? SingleChildScrollView(
              child: Container(
              child: Column(
                children: [
                  AspectRatio(
                      aspectRatio: 1.3,
                      child: Card(
                          color: Colors.white,
                          child: PieChart(
                            PieChartData(
                              pieTouchData: PieTouchData(
                                touchCallback:
                                    (FlTouchEvent event, pieTouchResponse) {
                                  setState(() {
                                    if (!event.isInterestedForInteractions ||
                                        pieTouchResponse == null ||
                                        pieTouchResponse.touchedSection ==
                                            null) {
                                      touchedIndex = -1;
                                      return;
                                    }
                                    touchedIndex = pieTouchResponse
                                        .touchedSection!.touchedSectionIndex;
                                  });
                                },
                              ),
                              borderData: FlBorderData(
                                show: false,
                              ),
                              sectionsSpace: 0,
                              centerSpaceRadius: 0,
                              sections: showingSections(),
                            ),
                          ))),
                  Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          // ignore: prefer_const_constructors
                          SizedBox(
                            width: 95,
                          ),
                          // ignore: prefer_const_constructors
                          SizedBox(
                            width: 60,
                            height: 30,
                            child: const Card(
                                color: Color(0xfff8b250),
                                // ignore: unnecessary_const
                                child: const Text(
                                  'เส้นเล็ก',
                                  style: TextStyle(),
                                )),
                          ),
                          const SizedBox(
                            width: 60,
                            height: 30,
                            child: Card(
                                color: Color(0xff845bef),
                                child: Text('เส้นใหญ่')),
                          ),
                          const SizedBox(
                            width: 60,
                            height: 30,
                            child: Card(
                                color: Color(0xff13d38e),
                                child: Text('เส้นม้วน')),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'คำสั่งซื้อทั้งหมด :  ' +
                            "${data['totalorder']}" +
                            '  คำสั่งซื้อ',
                        style: const TextStyle(fontSize: 22),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                        child: Card(
                          color: Color.fromARGB(255, 165, 249, 255),
                          shadowColor: const Color.fromARGB(255, 114, 114, 114),
                          child: DataTable(
                            border: TableBorder.symmetric(
                                inside: BorderSide(), outside: BorderSide()),
                            columns: const <DataColumn>[
                              DataColumn(
                                label: Expanded(
                                  child: Text(
                                    'ประเภทเส้น',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Expanded(
                                  child: Text(
                                    'จำนวนทั้งหมด',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                            ],
                            rows: <DataRow>[
                              DataRow(
                                cells: <DataCell>[
                                  DataCell(Text('เส้นเล็ก')),
                                  DataCell(Text('${data['allordersmall']}')),
                                ],
                              ),
                              DataRow(
                                cells: <DataCell>[
                                  DataCell(Text('เส้นใหญ่')),
                                  DataCell(Text('${data['allorderbig']}')),
                                ],
                              ),
                              DataRow(
                                cells: <DataCell>[
                                  DataCell(Text('เส้นม้วน')),
                                  DataCell(Text('${data['allorderroll']}')),
                                ],
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ))
          : Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const SizedBox(height: 150),
                const Center(
                  child: CupertinoActivityIndicator(),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text('ไม่มีคำสั่งซื้อ')
              ],
            ),
      drawer: SideMenuEmp(),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(3, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 20.0 : 16.0;
      final radius = isTouched ? 110.0 : 100.0;
      final widgetSize = isTouched ? 55.0 : 40.0;

      switch (i) {
        case 0:
          return PieChartSectionData(
            color: const Color(0xfff8b250),
            value: double.parse("${data['allordersmall']}"),
            title: "${data['allordersmall']}",
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
            ),
          );
        case 1:
          return PieChartSectionData(
            color: const Color(0xff845bef),
            value: double.parse("${data['allorderbig']}"),
            title: "${data['allorderbig']}",
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
            ),
          );
        case 2:
          return PieChartSectionData(
            color: const Color(0xff13d38e),
            value: double.parse("${data['allorderroll']}"),
            title: "${data['allorderroll']}",
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
            ),
          );
        default:
          throw Exception('Oh no');
      }
    });
  }
}
