import 'package:flutter/material.dart';

class Status extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("ปรับปรุงสถานะการดำเนินการลูกค้า"),
        ),
        body: Padding(
            padding: const EdgeInsets.fromLTRB(70, 80, 70, 80),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    height: 60,
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      icon: Icon(Icons.confirmation_num),
                      label: Text(" ยืนยันรับคำสั่งซื้อ "),
                      style: ButtonStyle(),
                      onPressed: () {
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (context) {
                        //   return adertise();
                        // }));
                      },
                    ),
                  ),
        
        SizedBox(
                    height: 60,
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      icon: Icon(Icons.no_accounts),
                      label: Text(" ปฏิเสธรับคำสั่งซื้อ "),
                      style: ButtonStyle(),
                      onPressed: () {
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (context) {
                        //   return adertise();
                        // }));
                      },
                    ),
                  ),
        
        SizedBox(
                    height: 60,
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      icon: Icon(Icons.attach_money),
                      label: Text(" ยืนยันการโอนชำระเงิน "),
                      style: ButtonStyle(),
                      onPressed: () {
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (context) {
                        //   return adertise();
                        // }));
                      },
                    ),
                  ),
        
        SizedBox(
                    height: 60,
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      icon: Icon(Icons.delivery_dining),
                      label: Text(" กำลังจัดส่ง "),
                      style: ButtonStyle(),
                      onPressed: () {
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (context) {
                        //   return adertise();
                        // }));
                      },
                    ),
                  ),
        
        SizedBox(
                    height: 60,
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      icon: Icon(Icons.check),
                      label: Text(" จัดส่งสำเร็จ "),
                      style: ButtonStyle(),
                      onPressed: () {
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (context) {
                        //   return adertise();
                        // }));
                      },
                    ),
                  ),
        
        ])),
        );
  }
}