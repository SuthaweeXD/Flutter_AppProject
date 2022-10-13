import 'package:flutter/material.dart';
import 'package:flutter_application_project/views/owner/OrderOwn.dart';
import 'package:flutter_application_project/views/owner/Report.dart';
import 'package:flutter_application_project/views/owner/UserDBOwn.dart';

import '../employee/OrderDBEmp.dart';
import '../employee/Payment.dart';
import '../employee/StatusDB.dart';
import '../employee/UsersDB.dart';

// ignore: must_be_immutable
class HomepageOwn extends StatefulWidget {
  HomepageOwn({Key? key, required this.index}) : super(key: key);
  int index;

  @override
  State<HomepageOwn> createState() => _HomepageOwnState();
}

class _HomepageOwnState extends State<HomepageOwn> {
  int _selectedIndex = 0;
  @override
  void initState() {
    widget.index != null ? _selectedIndex = widget.index : _selectedIndex = 0;
  }

  final screens = [
    OrderOwn(),
    UserDBOwn(),
    ReportOrder(),
    // checkpayment(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 32.0,
        unselectedFontSize: 14,
        unselectedItemColor: Color.fromARGB(255, 126, 125, 125),
        // ignore: prefer_const_constructors
        selectedItemColor: Color.fromARGB(
          255,
          59,
          115,
          255,
        ),
        showUnselectedLabels: true,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.all_inbox),
            label: 'ข้อมูลคำสั่งซื้อ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_pin),
            label: 'ข้อมูลผู้ใช้งาน',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.history),
          //   label: 'ปรับปรุงสถานะ',
          // ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart_outlined),
            label: 'สรุปการขาย',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
