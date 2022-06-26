// import 'dart:convert';
// import 'package:flutter_application_project/config/config.dart';
// import 'package:flutter_easyloading/flutter_easyloading.dart';
// import 'package:http/http.dart' as http;

// Future<dynamic> removeBooking(dynamic idbook) async {
//   Uri url = Uri.parse(
//       'http://206.189.92.71:3200/api/booking/$idbook'); //รับค่ามาจากiduser หรือตัวที่แชร์มาจากหน้าlogin ส่งไปยังurlเพื่อเช็คว่าคนนี้มีนัดหมายใครบ้าง รับค่ามาจากiduser หรือตัวที่แชร์มาจากหน้าlogin ส่งไปยังurlเพื่อเช็คว่าคนนี้มีนัดหมายใครบ้าง
//   return await http
//       .post(url,
//           body: jsonEncode({
//             "bstatus": 74,
//           }))
//       .then((req) async {
//     print(idbook);
//     print(req.statusCode);
//     if (req.statusCode == 201) {
//       var data = jsonDecode(req.body);
//       EasyLoading.showSuccess('Great Success!');
//       return data;
//     } else {
//       print('error');
//       EasyLoading.showError('Failed with Error');
//     }
//   });
// }
