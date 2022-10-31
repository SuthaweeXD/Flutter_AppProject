import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class ChartReport extends StatefulWidget {
  ChartReport({Key? key, required this.data}) : super(key: key);
  final dynamic data;
  @override
  State<ChartReport> createState() => _ChartReportState();
}

class _ChartReportState extends State<ChartReport> {
  int touchedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('สรุปการขาย'),
        ),
        body: SingleChildScrollView(
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
                        touchCallback: (FlTouchEvent event, pieTouchResponse) {
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
                  ),
                ),
              ),
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
                  Text(
                    'คำสั่งซื้อทั้งหมด :  ' +
                        "${widget.data['totalorder']}" +
                        '  คำสั่งซื้อ',
                    style: TextStyle(fontSize: 22),
                  ),
                ],
              )
            ],
          ),
        )));
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
            value: double.parse("${widget.data['allordersmall']}"),
            title: "${widget.data['allordersmall']}",
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
            value: double.parse("${widget.data['allorderbig']}"),
            title: "${widget.data['allorderbig']}",
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
            value: double.parse("${widget.data['allorderroll']}"),
            title: "${widget.data['allorderroll']}",
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
