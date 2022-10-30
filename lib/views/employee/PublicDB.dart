import 'package:flutter/material.dart';
import 'package:flutter_application_project/views/employee/EditPR.dart';
import 'package:intl/intl.dart';

import '../../config/api.dart';

class PRdata extends StatefulWidget {
  PRdata({Key? key}) : super(key: key);

  @override
  State<PRdata> createState() => _PRdataState();
}

class _PRdataState extends State<PRdata> {
  dynamic data;

  void initState() {
    super.initState();
    startApi();
  }

  startApi() async {
    var item = await getPR();
    setState(() {
      data = item;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('ประชาสัมพันธ์'),
        ),
        body: Container(
          child: ListView.builder(
              // reverse: true,
              itemCount: data?.length ?? 0,
              itemBuilder: (context, i) => Container(
                  height: 250,
                  width: 20,
                  child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute<void>(
                                builder: (BuildContext context) => EditPR(
                                      data: data[i],
                                    )));
                      },
                      child: Card(
                        elevation: 10,
                        color: Color.fromARGB(255, 255, 255, 255),
                        shadowColor: const Color.fromARGB(255, 114, 114, 114),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(18),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'ชื่อ : ${data[i]['pr_description']}',
                                            style: TextStyle(fontSize: 18),
                                          ),
                                          const SizedBox(
                                            height: 2,
                                          ),
                                          Text(
                                            'วันที่ : ' +
                                                DateFormat('dd-MM-yyyy ')
                                                    .format(DateTime.parse(
                                                        '${data[i]['pr_date']}')),
                                            style:
                                                const TextStyle(fontSize: 16),
                                          ),
                                          const SizedBox(
                                            height: 2,
                                          ),
                                          SizedBox(
                                            child: Container(
                                                child: Image(
                                              width: 200,
                                              height: 150,
                                              image: NetworkImage(
                                                data[i]['pr_photo'],
                                              ),
                                              fit: BoxFit.cover,
                                            )),
                                          )

                                          // ignore: prefer_const_constructors
                                        ],
                                      ),
                                    ),
                                  ])
                            ]),
                      )))),
        ));
  }
}
