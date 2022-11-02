import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class CCreport extends StatefulWidget {
  CCreport({Key? key, required this.data}) : super(key: key);
  final dynamic data;
  @override
  State<CCreport> createState() => _CCreportState();
}

class _CCreportState extends State<CCreport> {
  int touchedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('สรุปการขาย'),
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
                    ),
                  ),
                ),
                Column(children: [
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
                            child: Text(
                              'เส้นเล็ก',
                              style: TextStyle(),
                            )),
                      ),
                      const SizedBox(
                        width: 60,
                        height: 30,
                        child: Card(
                            color: Color(0xff845bef), child: Text('เส้นใหญ่')),
                      ),
                      const SizedBox(
                        width: 60,
                        height: 30,
                        child: Card(
                            color: Color(0xff13d38e),
                            child: const Text('เส้นม้วน')),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'คำสั่งซื้อทั้งหมด :  ' +
                        "${widget.data['totalorder']}" +
                        '  คำสั่งซื้อ',
                    style: const TextStyle(fontSize: 22),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: Card(
                      color: Color.fromARGB(255, 255, 212, 212),
                      shadowColor: const Color.fromARGB(255, 114, 114, 114),
                      child: DataTable(
                        border: TableBorder.symmetric(
                            inside: BorderSide(), outside: BorderSide()),
                        columns: const <DataColumn>[
                          DataColumn(
                            label: Expanded(
                              child: Text(
                                'ประเภทเส้น',
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                          DataColumn(
                            label: Expanded(
                              child: Text(
                                'จำนวนทั้งหมด',
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ],
                        rows: <DataRow>[
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text('เส้นเล็ก')),
                              DataCell(Text('${widget.data['allordersmall']}')),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text('เส้นใหญ่')),
                              DataCell(Text('${widget.data['allorderbig']}')),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text('เส้นม้วน')),
                              DataCell(Text('${widget.data['allorderroll']}')),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ])
              ],
            ),
          ),
        ));
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
