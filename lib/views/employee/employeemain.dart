import 'package:flutter/material.dart';
import 'package:flutter_application_project/views/employee/payment.dart';
import 'package:flutter_application_project/views/employee/statusDB.dart';
import 'package:flutter_application_project/views/employee/usersDB.dart';
import 'package:flutter_application_project/views/order/ordersDB.dart';

class MainEmployee extends StatefulWidget {
  MainEmployee({Key? key, required this.index}) : super(key: key);
  int index;
  @override
  State createState() => _State();
}

class _State extends State<MainEmployee> {
  int _selectedIndex = 0;
  @override
  void initState() {
    widget.index != null ? _selectedIndex = widget.index : _selectedIndex = 0;
  }

  final screens = [
    OrderDB(),
    usersDB(),
    statusDB(),
    checkpayment(),
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
        // type: BottomNavigationBarType.fixed,
        // backgroundColor: Color.fromARGB(255, 163, 50, 255),
        // fixedColor: Color.fromARGB(255, 163, 50, 255),
        iconSize: 32.0,

        unselectedFontSize: 14,
        unselectedItemColor: Color.fromARGB(255, 126, 125, 125),
        selectedItemColor: Color.fromARGB(255, 82, 255, 1),
        showUnselectedLabels: true,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.add_shopping_cart),
            label: 'ข้อมูลการสั่งซื้อ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shop),
            label: 'ข้อมูลผู้ใช้งาน',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'ปรับปรุงสถานะ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'ตรวจสอบการโอนชำระ',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
