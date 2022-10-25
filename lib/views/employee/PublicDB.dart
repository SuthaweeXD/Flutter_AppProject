import 'package:flutter/material.dart';
import 'package:flutter_application_project/views/employee/EditPR.dart';

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
                  height: 150,
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
                        color: Color.fromARGB(255, 247, 247, 247),
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
