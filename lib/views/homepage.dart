// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_application_project/views/ProflieUpdate.dart';
import 'package:flutter_application_project/views/HistoryOrder.dart';
import 'package:flutter_application_project/views/order/Orders.dart';
import 'package:flutter_application_project/views/order/OrdersDB.dart';

class Customerhome extends StatefulWidget {
  Customerhome({Key? key, required this.index}) : super(key: key);
  int index;
  @override
  CustomerHome createState() => CustomerHome();
}

class CustomerHome extends State<Customerhome> {
  int _selectedIndex = 0;
  @override
  void initState() {
    widget.index != null ? _selectedIndex = widget.index : _selectedIndex = 0;
  }

  final screens = [
    Orders(),
    OrderDB(),
    HistoryOrders(),
    ProfileUpdate(),
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
        selectedItemColor: Color.fromARGB(255, 255, 153, 20),
        showUnselectedLabels: true,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.add_shopping_cart),
            label: 'สั่งซื้อ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shop),
            label: 'รายการสั่งซื้อ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'ประวัติการสั่งซื้อ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'ข้อมูลส่วนตัว',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
