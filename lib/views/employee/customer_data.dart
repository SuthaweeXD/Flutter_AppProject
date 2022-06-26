import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_project/views/homepage1.dart';
import 'package:http/http.dart ' as http;

class CustomerDB extends StatefulWidget {
  CustomerDB({Key? key}) : super(key: key);

  @override
  State<CustomerDB> createState() => _CustomerDBState();
}

class _CustomerDBState extends State<CustomerDB> {
  dynamic data;
  @override
  void initState() {
    super.initState();
    startApi();
  }

  startApi() async {
    var item = await getdata();
    setState(() {
      data = item;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 227, 227, 227),
        appBar: AppBar(
          title: const Text('....'),
          backgroundColor: const Color.fromARGB(255, 45, 134, 156),
        ),
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
                                HomePage(data: data[i])));
                  },
                  child: Card(
                    elevation: 10,
                    color: const Color.fromARGB(255, 150, 217, 234),
                    shadowColor: const Color.fromARGB(255, 10, 91, 111),
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
                                  width: 10,
                                ),
                                const SizedBox(
                                  width: 55.0,
                                  height: 55.0,
                                  // color: Color.fromARGB(255, 150, 217, 234),
                                  // ignore: prefer_const_constructors
                                  child: CircleAvatar(),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  padding: const EdgeInsets.all(22),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${data[i]['user_fname']} ${data[i]['user_lname']}',
                                        style: const TextStyle(fontSize: 15),
                                      ),
                                      const SizedBox(
                                        height: 2,
                                      ),
                                      Text(
                                          'Address ${data[i]['user_address']}'),
                                      const SizedBox(
                                        height: 2,
                                      ),
                                      Text(
                                        '${data[i]['user_number']}',
                                        style: const TextStyle(
                                          fontSize: 20,
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
            )));
  }
}

Future<dynamic> getdata() async {
  Uri url = Uri.parse('http://192.168.43.18:3200/api/users');
  return await http
      .get(
    url,
  )
      .then((req) async {
    print(req.statusCode);
    if (req.statusCode == 200) {
      var data = jsonDecode(req.body);
      return data;
    } else {
      return null;
    }
  });
}
