// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_application_project/model/sidemenu.dart';
import 'package:flutter_application_project/views/advertise.dart';
import 'package:flutter_application_project/views/employee/customer_data.dart';
import 'package:flutter_application_project/views/ProflieUpdate.dart';
import 'package:flutter_application_project/views/order/Orders.dart';

class Customerhome extends StatefulWidget {
  const Customerhome({Key? key}) : super(key: key);

  @override
  CustomerHome createState() => CustomerHome();
}

class CustomerHome extends State<Customerhome> {
  int _selectedIndex = 0;
  final screens = [
    Orders(),
    const CustomerDB(),
    adertise(),
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
        // type: BottomNavigationBarType.fixed,
        backgroundColor: Color.fromARGB(255, 163, 50, 255),
        iconSize: 40,
        // selectedFontSize: 15,
        unselectedItemColor: Color.fromARGB(255, 251, 247, 247),
        selectedItemColor: Color.fromARGB(255, 43, 255, 0),
        showUnselectedLabels: true,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.add_shopping_cart),
            label: 'สั่งซื้อ',
            backgroundColor: Color.fromARGB(255, 240, 180, 51),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shop),
            label: 'รายการสั่งซื้อ',
            backgroundColor: Color.fromARGB(255, 60, 42, 217),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'ประวัติการสั่งซื้อ',
            backgroundColor: Color.fromARGB(255, 89, 160, 51),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'ข้อมูลส่วนตัว',
            backgroundColor: Color.fromARGB(255, 143, 9, 114),
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
