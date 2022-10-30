import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_project/config/api.dart';
import 'package:flutter_application_project/model/SideMenuOwn.dart';
import 'package:intl/intl.dart';

class ChartRealtime extends StatefulWidget {
  ChartRealtime({Key? key}) : super(key: key);

  @override
  State<ChartRealtime> createState() => _ChartRealtimeState();
}

class _ChartRealtimeState extends State<ChartRealtime> {
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
    var item = await getReportOrders(startDate, endDate);
    setState(() {
      data = item;
      print(data);
      print(now.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('แผนภูมิประจำวัน'),
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
                                      pieTouchResponse.touchedSection == null) {
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
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 95,
                        ),
                        SizedBox(
                          width: 60,
                          height: 30,
                          child: Card(
                              color: const Color(0xfff8b250),
                              child: Text(
                                'เส้นเล็ก',
                                style: TextStyle(),
                              )),
                        ),
                        SizedBox(
                          width: 60,
                          height: 30,
                          child: Card(
                              color: const Color(0xff845bef),
                              child: Text('เส้นใหญ่')),
                        ),
                        SizedBox(
                          width: 60,
                          height: 30,
                          child: Card(
                              color: const Color(0xff13d38e),
                              child: Text('เส้นม้วน')),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text('คำสั่งซื้อทั้งหมด : ' + "${data['totalorder']}"),
                  ],
                )
              ],
            )))
          : const Center(
              child: CupertinoActivityIndicator(),
            ),
      drawer: SideMenuOwn(),
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
