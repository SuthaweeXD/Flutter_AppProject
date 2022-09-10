// ignore_for_file: non_constant_identifier_names

import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_project/views/employee/customer_data.dart';
import 'package:flutter_application_project/views/employee/usersDB.dart';
import 'package:flutter_application_project/views/order/ordersDB.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';

class ModelOrders extends StatelessWidget {
  const ModelOrders({Key? key, this.ImagesP, this.TextP}) : super(key: key);

  final String? ImagesP;
  final String? TextP;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            color: const Color.fromARGB(255, 77, 158, 88),
            padding: const EdgeInsets.fromLTRB(7, 7, 7, 13),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                ImagesP!,
                width: 110,
                height: 110,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Text(
          TextP!,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class ModelOrdersNetwork extends StatelessWidget {
  const ModelOrdersNetwork({Key? key, this.ImagesP, this.TextP})
      : super(key: key);

  final String? ImagesP;
  final String? TextP;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            color: const Color.fromARGB(255, 77, 158, 88),
            padding: const EdgeInsets.fromLTRB(7, 7, 7, 13),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                ImagesP!,
                width: 110,
                height: 110,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Text(
          TextP!,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class TextOrders extends StatelessWidget {
  const TextOrders({Key? key, this.controller, this.texC}) : super(key: key);

  final String? texC;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          texC!,
          style: const TextStyle(fontSize: 18),
        ),
        SizedBox(
            height: 50,
            width: 150,
            child: SpinBox(
                value: 0,
                decimals: 1,
                step: 0.5,
                onChanged: (value) {
                  controller?.text = value.toString();
                  print(controller?.text);
                })),
        const Text(
          'กิโลกรัม',
          style: TextStyle(fontSize: 18),
        ),
      ],
    );
  }
}

Future<void> normalDialog(BuildContext context, String message) async {
  showDialog(
      context: context,
      builder: (context) => AlertDialog(title: Text(message), actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('OK'),
            )
          ]));
}

// class DialogExample extends StatelessWidget {
//   // ignore: use_key_in_widget_constructors
//   const DialogExample({key});

//   @override
//   Widget build(BuildContext context) {
//     return TextButton(
//       onPressed: () => showDialog<String>(
//         context: context,
//         builder: (BuildContext context) => AlertDialog(
//           title: const Text('AlertDialog Title'),
//           content: const Text('AlertDialog description'),
//           actions: <Widget>[
// //             TextButton(
// //               onPressed: () => Navigator.pop(context, 'Cancel'),
// //               child: const Text('Cancel'),
// //             ),
//             TextButton(
//               onPressed: () => Navigator.pop(context, 'OK'),
//               child: const Text('OK'),
// //             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


// class MainEmployee extends StatefulWidget {
//   MainEmployee({Key? key, required this.index}) : super(key: key);
//   int index;
//   @override
//   State createState() => _State();
// }

// class _State extends State<MainEmployee> {
//   int _selectedIndex = 0;
//   @override
//   void initState() {
//     widget.index != null ? _selectedIndex = widget.index : _selectedIndex = 0;
//   }

//   final screens = [
//     OrderDB(),
//     usersDB(),
//   ];

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: screens[_selectedIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         // type: BottomNavigationBarType.fixed,
//         // backgroundColor: Color.fromARGB(255, 163, 50, 255),
//         // fixedColor: Color.fromARGB(255, 163, 50, 255),
//         iconSize: 32.0,

//         unselectedFontSize: 14,
//         unselectedItemColor: Color.fromARGB(255, 126, 125, 125),
//         selectedItemColor: Color.fromARGB(255, 82, 255, 1),
//         showUnselectedLabels: true,
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.add_shopping_cart),
//             label: 'ข้อมูลการสั่งซื้อ',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.shop),
//             label: 'ข้อมูลผู้ใช้งาน',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.history),
//             label: 'ปรับปรุงสถานะ',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person),
//             label: 'ตรวจสอบการโอนชำระ',
//           ),
//         ],
//         currentIndex: _selectedIndex,
//         onTap: _onItemTapped,
//       ),
//     );
//   }
// }
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       initialRoute: "/",
//       routes: {
//         "/": (_) => HelloConvexAppBar(),
//         "/bar": (BuildContext context) => usersDB(),
//         // "/custom": (BuildContext context) => CustomAppBarDemo(),
//         "/fab": (BuildContext context) => CustomerDB(),
//       },
//     );
//   }
// }

// class HelloConvexAppBar extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('สำหรับพนักงาน')),
//       body: Center(
//           child: TextButton(
//         child: Text('Click to show full example'),
//         onPressed: () => Navigator.of(context).pushNamed('/bar'),
//       )),
//       bottomNavigationBar: ConvexAppBar(
//         style: TabStyle.react,
//         items: [
//           TabItem(title: 'ข้อมูลสั่งซื้อ', icon: Icons.list_alt),
//           TabItem(title: 'ข้อมูลผู้ใช้งาน', icon: Icons.person),
//           TabItem(title: 'ปรับปรุงสถานะ', icon: Icons.adjust),
//         ],
//         initialActiveIndex: 1,
//         onTap: (int i) => print('click index=$i'),
//       ),
//     );
//   }
