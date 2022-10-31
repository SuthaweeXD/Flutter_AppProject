import 'package:flutter/material.dart';
import 'package:flutter_application_project/model/SideMenuOwn.dart';
import 'package:flutter_application_project/views/owner/UserDetailO.dart';

import '../../config/api.dart';

class UserDBOwn extends StatefulWidget {
  UserDBOwn({Key? key}) : super(key: key);

  @override
  State<UserDBOwn> createState() => _UserDBOwnState();
}

class _UserDBOwnState extends State<UserDBOwn> {
  dynamic data;
  @override
  void initState() {
    super.initState();
    startApi();
  }

  startApi() async {
    var item = await getUsers();
    setState(() {
      data = item;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 59, 115, 255),
        title: const Text("ข้อมูลผู้ใช้งาน"),
      ),
      backgroundColor: const Color.fromARGB(255, 227, 227, 227),
      body: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: RefreshIndicator(
            onRefresh: () async {
              startApi();
            },
            child: ListView.builder(
              itemCount: data?.length ?? 0,
              itemBuilder: (context, i) => InkWell(
                // onTap: () => Navigator.pushNamed(context, "/CDT"),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                          builder: (BuildContext context) =>
                              UserDetailO(data: data[i])));
                },
                child: Card(
                  elevation: 10,
                  color: Color.fromARGB(255, 255, 255, 255),
                  shadowColor: Color.fromARGB(255, 114, 114, 114),
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
                              const SizedBox(
                                width: 20,
                              ),
                              CircleAvatar(
                                child: Image.asset('assets/images/user.png'),
                                backgroundColor: Color.fromARGB(255, 0, 0, 0),
                                radius: 30,
                              ),
                              const SizedBox(
                                width: 2,
                              ),
                              const SizedBox(
                                width: 2,
                              ),
                              Container(
                                padding: const EdgeInsets.all(22),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 2,
                                    ),
                                    Text(
                                      'ชื่อ : ${data[i]['user_fname']}',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    Text(
                                      'นามสกุล : ${data[i]['user_lname']}',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    const SizedBox(
                                      height: 2,
                                    ),
                                    const SizedBox(
                                      height: 2,
                                    ),
                                    Text(
                                      'เบอร์โทร : '
                                      '${data[i]['user_number']}',
                                      style: const TextStyle(
                                        fontSize: 15,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ])
                      ]),
                ),
              ),
            ),
          )),
      drawer: SideMenuOwn(),
    );
  }
}
