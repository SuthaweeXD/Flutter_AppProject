// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_application_project/model/sidemenu.dart';
import 'package:flutter_application_project/views/advertise.dart';
import 'package:flutter_application_project/views/emp_menu.dart';
import 'package:flutter_application_project/views/employee/customer_data.dart';
import 'package:flutter_application_project/views/home.dart';

class Customerhome extends StatefulWidget {
  const Customerhome({Key? key}) : super(key: key);

  @override
  CustomerHome createState() => CustomerHome();
}

class CustomerHome extends State<Customerhome> {
  int _selectedIndex = 0;
  final screens = [
    EmplMenu(),
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
      appBar: AppBar(
        title: const Text('BottomNavigationBar Sample'),
      ),
      body: screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        // type: BottomNavigationBarType.fixed,
        backgroundColor: Color.fromARGB(255, 163, 50, 255),
        iconSize: 40,
        // selectedFontSize: 15,
        unselectedItemColor: Color.fromARGB(255, 233, 226, 217),
        selectedItemColor: Color.fromARGB(255, 233, 226, 217),
        showUnselectedLabels: true,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.add_shopping_cart),
            label: 'สั่งซื้อ',
            backgroundColor: Color.fromARGB(255, 194, 133, 2),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shop),
            label: 'รายการสั่งซื้อ',
            backgroundColor: Color.fromARGB(255, 60, 42, 217),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'ประวัติการสั่งซื้อ',
            backgroundColor: Color.fromARGB(255, 70, 194, 3),
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
      drawer: SideMenu(),
    );
  }
}
//   => DefaultTabController(
//         length: 4,
//         child: Scaffold(
//           appBar: AppBar(
//             // title: Text(MyApp.title),
//             //centerTitle: true,
//             // leading: IconButton(
//             //   icon: Icon(Icons.menu),
//             //   onPressed: () {},
//             // ),
//             actions: [
//               IconButton(
//                 icon: Icon(Icons.notifications_none),
//                 onPressed: () {},
//               ),
//               // IconButton(
//               //   icon: Icon(Icons.search),
//               //   onPressed: () {},
//               // )
//             ],
//             //backgroundColor: Colors.purple,
//             flexibleSpace: Container(
//               decoration: BoxDecoration(
//                 gradient: LinearGradient(
//                   colors: [Colors.purple, Colors.red],
//                   begin: Alignment.bottomRight,
//                   end: Alignment.topLeft,
//                 ),
//               ),
//             ),
//             bottom: TabBar(
//               isScrollable: true,
//               indicatorColor: Colors.white,
//               indicatorWeight: 5,
//               tabs: [
//                 Tab(icon: Icon(Icons.home), text: 'หน้าแรก'),
//                 Tab(icon: Icon(Icons.star), text: 'สถานะซื้อ'),
//                 Tab(icon: Icon(Icons.cancel), text: 'การยกเลิก'),
//                 Tab(icon: Icon(Icons.face), text: 'พนักงาน'),
//               ],
//             ),
//             elevation: 20,
//             titleSpacing: 20,
//           ),
//           body: TabBarView(
//             children: <Widget>[
//               Center(
//                 child: Text('hello'),
//               ),
//               Center(),
//               Center(),
//               CustomerDB(),
//             ],
//           ),
//           drawer: SideMenu(),
//         ),
//       );
// }


// class Customerhome extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text("หน้าแรก"),
//         ),
//         body: Padding(
//             padding: const EdgeInsets.fromLTRB(70, 200, 70, 50),
//             child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   SizedBox(
//                     height: 60,
//                     width: double.infinity,
//                     child: ElevatedButton.icon(
//                       icon: Icon(Icons.production_quantity_limits),
//                       label: Text(" สั่งซื้อสินค้า "),
//                       style: ButtonStyle(),
//                       onPressed: () {
//                         Navigator.push(context,
//                             MaterialPageRoute(builder: (context) {
//                           return C_Orders();
//                         }));
//                       },
//                     ),
//                   ),
//                   SizedBox(
//                     height: 60,
//                     width: double.infinity,
//                     child: ElevatedButton.icon(
//                       icon: Icon(Icons.attach_money),
//                       label: Text("ตรวจสอบยอดคงเหลือที่ต้องชำระ"),
//                       style: ButtonStyle(),
//                       onPressed: () {
//                         // Navigator.push(context,
//                         //     MaterialPageRoute(builder: (context) {
//                         //   return adertise();
//                         // }));
//                       },
//                     ),
//                   ),
//                   SizedBox(
//                     height: 60,
//                     width: double.infinity,
//                     child: ElevatedButton.icon(
//                       icon: Icon(Icons.not_listed_location),
//                       label: Text(" ตรวจสอบสถานะตนเอง "),
//                       style: ButtonStyle(),
//                       onPressed: () {
//                         // Navigator.push(context,
//                         //     MaterialPageRoute(builder: (context) {
//                         //   return adertise();
//                         // }));
//                       },
//                     ),
//                   ),
//                   SizedBox(
//                     height: 60,
//                     width: double.infinity,
//                     child: ElevatedButton.icon(
//                       icon: Icon(Icons.not_interested),
//                       label: Text(" ยกเลิกการสั่งซื้อ "),
//                       style: ButtonStyle(),
//                       onPressed: () {
//                         // Navigator.push(context,
//                         //     MaterialPageRoute(builder: (context) {
//                         //   return adertise();
//                         // }));
//                       },
//                     ),
//                   ),
//                   SizedBox(
//                     height: 60,
//                     width: double.infinity,
//                     child: ElevatedButton.icon(
//                       icon: Icon(Icons.not_interested),
//                       label: Text(" ยกเลิกการจัดส่ง "),
//                       style: ButtonStyle(),
//                       onPressed: () {
//                         // Navigator.push(context,
//                         //     MaterialPageRoute(builder: (context) {
//                         //   return adertise();
//                         // }));
//                       },
//                     ),
//                   ),
//                   SizedBox(
//                     height: 60,
//                     width: double.infinity,
//                     child: ElevatedButton.icon(
//                       icon: Icon(Icons.emoji_people),
//                       label: Text(" สำหรับพนักงาน "),
//                       style: ButtonStyle(),
//                       onPressed: () {
//                         Navigator.push(context,
//                             MaterialPageRoute(builder: (context) {
//                           return EmplMenu();
//                         }));
//                       },
//                     ),
//                   )
//                 ])));
//   }
// }