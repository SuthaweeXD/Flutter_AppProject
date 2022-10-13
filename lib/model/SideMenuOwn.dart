import 'package:flutter/material.dart';
import 'package:flutter_application_project/model/Sidemenu.dart';
import 'package:flutter_application_project/views/Login.dart';
import 'package:flutter_application_project/views/owner/Main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SideMenuOwn extends StatefulWidget {
  SideMenuOwn({
    Key? key,
    this.routeName,
  }) : super(key: key);
  final String? routeName;
  @override
  State<SideMenuOwn> createState() => _SideMenuOwnState();
}

class _SideMenuOwnState extends State<SideMenuOwn> {
  dynamic data;

  @override
  void initState() {
    super.initState();
    startApi();
  }

  startApi() async {
    //เอาตัวidของcustomerมาใช้กับหน้านี้แล้วเอาค่าไปใส่ในidUser
    dynamic item = await getdataprofile(); //ส่งค่าไปยัง getdataหรือตัวรับapi
    setState(() {
      data = item;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 3, 87, 255),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: GestureDetector(
                  onTap: (() {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute<void>(
                    //         builder: (BuildContext context) => ProfileUpdate(
                    //               data: null,
                    //             )));
                  }),
                  child: Row(
                    children: [
                      CircleAvatar(
                        // backgroundImage: NetworkImage(
                        //     'https://github.com/SuthaweeXD/images/blob/main/ACE.jpg?raw=true'),
                        backgroundColor: Colors.white,
                        radius: 40,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            data != null
                                ? Text(
                                    ''' ${data['user_fname']}  ${data['user_lname']}''',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  )
                                : Text(''),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.fromLTRB(1, 5, 20, 5),
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomepageOwn(index: 0),
                          ),
                          (route) => false);
                    },
                    child: Text(
                      'หน้าหลัก',
                      style: TextStyle(fontSize: 18),
                    )),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  // leading: Icon(FontAwesomeIcons.rightFromBracket),
                  title: Text(
                    'ออกจากระบบ',
                    style: TextStyle(color: Colors.red),
                  ),
                  onTap: () async {
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    prefs.remove('token');
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ),
                        (route) => false);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
