import 'package:flutter/material.dart';
import 'package:flutter_application_project/views/employee/PublicDB.dart';

import '../../model/SidemenuEmp.dart';

class HomePR extends StatefulWidget {
  HomePR({Key? key}) : super(key: key);

  @override
  State<HomePR> createState() => _HomePRState();
}

class _HomePRState extends State<HomePR> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ประชาสัมพันธ์'),
      ),
      body: Container(
        padding: EdgeInsets.all(22),
        child: Column(children: [
          const SizedBox(height: 80),
          SizedBox(
            width: 300,
            child: Card(
              color: Colors.orange[100],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: TextButton(
                onPressed: () {},
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          )),
                      child: Text(
                        'สร้าง',
                        style: const TextStyle(fontSize: 25),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 40),
          SizedBox(
            width: 300,
            child: Card(
              color: Colors.green[100],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                          builder: (BuildContext context) => PRdata()));
                },
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    const Icon(
                      Icons.date_range_rounded,
                      size: 80,
                    ),
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          )),
                      child: Text(
                        'ข้อมูลประชาสัมพันธ์ : ',
                        style: const TextStyle(fontSize: 25),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ]),
      ),
      drawer: SideMenuEmp(),
    );
  }
}
