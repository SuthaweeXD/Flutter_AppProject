import 'package:flutter/material.dart';
import 'package:flutter_application_project/model/sidemenu.dart';
import 'package:flutter_application_project/views/customer_orders.dart';
import 'package:flutter_application_project/views/emp_menu.dart';

class Customerhome extends StatefulWidget {
  @override
  CustomerHome createState() => CustomerHome();
}

class CustomerHome extends State<Customerhome> {
  @override
  Widget build(BuildContext context) => DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            // title: Text(MyApp.title),
            //centerTitle: true,
            // leading: IconButton(
            //   icon: Icon(Icons.menu),
            //   onPressed: () {},
            // ),
            actions: [
              IconButton(
                icon: Icon(Icons.notifications_none),
                onPressed: () {},
              ),
              // IconButton(
              //   icon: Icon(Icons.search),
              //   onPressed: () {},
              // )
            ],
            //backgroundColor: Colors.purple,
            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.purple, Colors.red],
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft,
                ),
              ),
            ),
            bottom: TabBar(
              isScrollable: true,
              indicatorColor: Colors.white,
              indicatorWeight: 5,
              tabs: [
                Tab(icon: Icon(Icons.home), text: 'หน้าแรก'),
                Tab(icon: Icon(Icons.star), text: 'สถานะซื้อ'),
                Tab(icon: Icon(Icons.cancel), text: 'การยกเลิก'),
                Tab(icon: Icon(Icons.face), text: 'พนักงาน'),
              ],
            ),
            elevation: 20,
            titleSpacing: 20,
          ),
          body: TabBarView(
            children: [
              buildPage('สถานะสั่งซื้อ'),
              buildPage('ยกเลิก'),
              // LoginScreen(),
              EmplMenu(),
            ],
          ),
          drawer: SideMenu(),
        ),
      );

  Widget buildPage(String text) => Center(
        child: Text(
          text,
          style: TextStyle(fontSize: 28),
        ),
      );
}

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
