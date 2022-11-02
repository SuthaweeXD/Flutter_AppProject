import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_project/config/config.dart';
import 'package:flutter_application_project/model/ModelOrders.dart';
import 'package:flutter_application_project/views/employee/MainEmp.dart';
import 'package:flutter_application_project/views/Homepage.dart';
import 'package:flutter_application_project/views/owner/Main.dart';
import 'package:flutter_application_project/views/owner/UserDBOwn.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:http_parser/http_parser.dart';

Future checkRegister(
    fname, lname, phone, address, username, password, context) async {
  EasyLoading.show(status: 'loading...');

  Uri url = Uri.parse('http://206.189.145.138:3700/api/users');
  http
      .post(
    url,
    headers: headers,
    body: jsonEncode({
      "fname": fname,
      "lname": lname,
      "number": phone,
      "address": address,
      "username": username,
      "password": password,
    }),
  )
      .then((req) async {
    print(req.statusCode);
    if (req.statusCode == 201) {
      final prefs = await SharedPreferences.getInstance();
      var data = jsonDecode(req.body);
      prefs.setString('token', data['token']);
      prefs.setInt('idm', data['id']);
      prefs.setString('role', data['user_role']);
      headers?['Authorization'] = "bearer ${data['token']}";
      EasyLoading.showSuccess('ลงทะเบียนสำเร็จ');
      data['user_role'] == "C"
          ? Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => Customerhome(index: 0)),
              (Route<dynamic> route) => false)
          : data['user_role'] == "S"
              ? Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (context) => MainEmployee(
                            index: 0,
                          )),
                  (Route<dynamic> route) => false)
              : Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (context) => HomepageOwn(
                            index: 0,
                          )),
                  (Route<dynamic> route) => false);
    } else {
      print('error');
      EasyLoading.showError('เกิดข้อผิดพลาด!');
    }
  });
}

Future<dynamic> checkSuser(
  String username,
) async {
  Uri url =
      Uri.parse('http://206.189.145.138:3700/api/users/checkSame/$username');
  return await http
      .get(
    url,
  )
      .then((req) async {
    print(req.statusCode);
    if (req.statusCode == 200) {
      var data = jsonDecode(req.body);
      return data;
    } else {}
  });
}

Future checkLogin(String username, String password, context) async {
  EasyLoading.init();
  print(username);
  print(password);
  Uri url = Uri.parse('http://206.189.145.138:3700/api/users/login');
  http
      .post(
    url,
    headers: headers,
    body: jsonEncode({"username": username, "password": password}),
  )
      .then((req) async {
    print(req.statusCode);
    if (req.statusCode == 200) {
      final prefs = await SharedPreferences.getInstance();
      var data = jsonDecode(req.body);
      prefs.setString('token', data['token']);
      prefs.setInt('idm', data['user_id']);
      prefs.setString('role', data['user_role']);
      headers?['Authorization'] = "bearer ${data['token']}";
      EasyLoading.showSuccess('เข้าสู่ระบบสำเร็จ!');
      data['user_role'] == "C"
          ? Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => Customerhome(index: 0)),
              (Route<dynamic> route) => false)
          : data['user_role'] == "S"
              ? Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (context) => MainEmployee(
                            index: 0,
                          )),
                  (Route<dynamic> route) => false)
              : Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (context) => HomepageOwn(
                            index: 0,
                          )),
                  (Route<dynamic> route) => false);
    } else {
      EasyLoading.showError(
        'ชื่อผู้ใช้ไม่ถูกต้อง!',
        maskType: EasyLoadingMaskType.black,
      );
    }
  });
}

Future<dynamic> getdtprofile() async {
  final prefs =
      await SharedPreferences.getInstance(); //เพิ่มตัวแชร์จากหน้าlogin
  int? user_id = prefs.getInt('idm');
  Uri url = Uri.parse('http://206.189.145.138:3700/api/users/$user_id');

  return await http
      .get(
    url,
    headers: headers,
  )
      .then((req) async {
    if (req.statusCode == 200) {
      var data = jsonDecode(req.body);
      print(req.body);
      return data;
    } else {
      return null;
    }
  });
}

Future sendDataProfile1(fname, lname, phone, address, context) async {
  final prefs =
      await SharedPreferences.getInstance(); //เพิ่มตัวแชร์จากหน้าlogin
  int? user_id = prefs.getInt('idm');
  Uri url = Uri.parse('http://206.189.145.138:3700/api/users/$user_id');
  http
      .put(
    url,
    headers: headers,
    body: jsonEncode(
        {"fname": fname, "lname": lname, "number": phone, "address": address}),
  )
      .then((req) async {
    print(req.statusCode);
    if (req.statusCode == 204) {
      EasyLoading.showSuccess('สำเร็จ!');
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => Customerhome(index: 3)),
          (Route<dynamic> route) => false);
    } else {
      EasyLoading.showError('เกิดข้อผิดพลาด!');
    }
  });
}

Future sendDataProfile2(fname, lname, phone, address, userid, context) async {
  Uri url = Uri.parse('http://206.189.145.138:3700/api/users/$userid');
  http
      .put(
    url,
    headers: headers,
    body: jsonEncode(
        {"fname": fname, "lname": lname, "number": phone, "address": address}),
  )
      .then((req) async {
    print(req.statusCode);
    if (req.statusCode == 204) {
      EasyLoading.showSuccess('สำเร็จ!');
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => MainEmployee(index: 0)),
          (Route<dynamic> route) => false);
    } else {
      EasyLoading.showError('เกิดข้อผิดพลาด!');
    }
  });
}

Future sendDataProfile3(fname, lname, phone, address, userid, context) async {
  Uri url = Uri.parse('http://206.189.145.138:3700/api/users/$userid');
  http
      .put(
    url,
    headers: headers,
    body: jsonEncode(
        {"fname": fname, "lname": lname, "number": phone, "address": address}),
  )
      .then((req) async {
    print(req.statusCode);
    if (req.statusCode == 204) {
      EasyLoading.showSuccess('สำเร็จ!');
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => UserDBOwn()),
          (Route<dynamic> route) => false);
    } else {
      EasyLoading.showError('เกิดข้อผิดพลาด!');
    }
  });
}

Future<dynamic> getOrders() async {
  Uri url = Uri.parse('http://206.189.145.138:3700/api/orders/forder');
  return await http
      .get(
    url,
  )
      .then((req) async {
    print(req.statusCode);
    if (req.statusCode == 200) {
      var data = jsonDecode(req.body);
      return data;
    } else {
      return null;
    }
  });
}

Future<dynamic> getReportAllOrder(startDate, endDate) async {
  Uri url = Uri.parse(
      'http://206.189.145.138:3700/api/orders/reportAllOrder/$startDate/$endDate');
  return await http
      .get(
    url,
  )
      .then((req) async {
    print(req.statusCode);
    if (req.statusCode == 200) {
      var data = jsonDecode(req.body);
      return data;
    } else {
      return null;
    }
  });
}

Future<dynamic> getReportOrders(startdate, enddate) async {
  Uri url = Uri.parse(
      'http://206.189.145.138:3700/api/orders/reportOrder/$startdate/$enddate');
  return await http.get(url).then((req) async {
    print(req.statusCode);
    if (req.statusCode == 200) {
      var data = jsonDecode(req.body);

      return data;
    } else {
      return null;
    }
  });
}

Future<dynamic> getReportCancle(startdate, enddate) async {
  Uri url = Uri.parse(
      'http://206.189.145.138:3700/api/orders/reportCancle/$startdate/$enddate');
  return await http.get(url).then((req) async {
    print(req.statusCode);
    if (req.statusCode == 200) {
      var data = jsonDecode(req.body);

      return data;
    } else {
      return null;
    }
  });
}

Future<dynamic> getReportOrdersAccept(startdate, enddate) async {
  Uri url = Uri.parse(
      'http://206.189.145.138:3700/api/orders/reportOrderAccept/$startdate/$enddate');
  return await http.get(url).then((req) async {
    print(req.statusCode);
    if (req.statusCode == 200) {
      var data = jsonDecode(req.body);

      return data;
    } else {
      return null;
    }
  });
}

Future sendorders(
    small, big, roll, picdate, pictime, now, result, deposit, context) async {
  final prefs =
      await SharedPreferences.getInstance(); //เพิ่มตัวแชร์จากหน้าlogin
  int? userid = prefs.getInt('idm');
  Uri url = Uri.parse('http://206.189.145.138:3700/api/orders');
  http
      .post(
    url,
    headers: headers,
    body: jsonEncode({
      "userid": userid,
      "small": small,
      "big": big,
      "roll": roll,
      "ogetdate": picdate + ' ' + pictime,
      "odate": now,
      "total": result,
      "odep": deposit
    }),
  )
      .then((req) async {
    print(req.statusCode);
    print(picdate);
    print(pictime);
    print(small);
    if (req.statusCode == 201) {
      EasyLoading.showSuccess('สั่งซื้อสำเร็จ!');
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
              builder: (context) => Customerhome(
                    index: 2,
                  )),
          (Route<dynamic> route) => false);
    } else {
      normalDialog(context, ('มีช่องว่าง'));
    }
  });
}

Future<dynamic> gethistoryod() async {
  final prefs =
      await SharedPreferences.getInstance(); //เพิ่มตัวแชร์จากหน้าlogin
  int? user_id = prefs.getInt('idm');
  Uri url = Uri.parse('http://206.189.145.138:3700/api/orders/f1/$user_id');
  return await http
      .get(
    url,
  )
      .then((req) async {
    print(req.statusCode);
    if (req.statusCode == 200) {
      var data = jsonDecode(req.body);
      return data;
    } else {
      return null;
    }
  });
}

Future<dynamic> getPayment() async {
  final prefs =
      await SharedPreferences.getInstance(); //เพิ่มตัวแชร์จากหน้าlogin
  int? user_id = prefs.getInt('idm');
  Uri url = Uri.parse('http://206.189.145.138:3700/api/orders/findpayment');
  return await http
      .get(
    url,
  )
      .then((req) async {
    print(req.statusCode);
    if (req.statusCode == 200) {
      var data = jsonDecode(req.body);
      return data;
    } else {
      return null;
    }
  });
}

Future<dynamic> getUsers() async {
  Uri url = Uri.parse('http://206.189.145.138:3700/api/users');
  return await http
      .get(
    url,
  )
      .then((req) async {
    print(req.statusCode);
    if (req.statusCode == 200) {
      var data = jsonDecode(req.body);
      return data;
    } else {
      return null;
    }
  });
}

Future<dynamic> getaddress() async {
  final prefs =
      await SharedPreferences.getInstance(); //เพิ่มตัวแชร์จากหน้าlogin
  int? user_id = prefs.getInt('idm');
  Uri url = Uri.parse('http://206.189.145.138:3700/api/users/$user_id');

  return await http
      .get(
    url,
    headers: headers,
  )
      .then((req) async {
    if (req.statusCode == 200) {
      var data = jsonDecode(req.body);
      print(req.body);
      return data;
    } else {
      return null;
    }
  });
}

Future deleteorder(orderid, context) async {
  Uri url = Uri.parse('http://206.189.145.138:3700/api/orders/$orderid');
  http
      .delete(
    url,
    headers: headers,
    body: jsonEncode({}),
  )
      .then((req) async {
    print(req.statusCode);

    if (req.statusCode == 204) {
      EasyLoading.showSuccess('ลบข้อมูลสำเร็จ!');
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Customerhome(index: 0)),
      );
    } else {
      normalDialog(context, ('เกิดข้อผิดพลาด!'));
    }
  });
}

Future<dynamic> getdataprofile1() async {
  final prefs =
      await SharedPreferences.getInstance(); //เพิ่มตัวแชร์จากหน้าlogin
  int? user_id = prefs.getInt('idm');
  Uri url = Uri.parse('http://206.189.145.138:3700/api/users/$user_id');

  return await http
      .get(
    url,
    headers: headers,
  )
      .then((req) async {
    print(req.statusCode);
    if (req.statusCode == 200) {
      var data = jsonDecode(req.body);
      return data;
    } else {
      return null;
    }
  });
}

Future deleteprofile(userid, context) async {
  Uri url = Uri.parse('http://206.189.145.138:3700/api/users/$userid');
  http
      .delete(
    url,
    headers: headers,
    body: jsonEncode({}),
  )
      .then((req) async {
    print(req.statusCode);

    if (req.statusCode == 204) {
      EasyLoading.showSuccess('ลบข้อมูลสำเร็จ!');
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MainEmployee(
                  index: 1,
                )),
      );
    } else {
      normalDialog(context, ('เกิดข้อผิดพลาด!'));
    }
  });
}

Future deletePR(prid, context) async {
  Uri url = Uri.parse('http://206.189.145.138:3700/api/public_relations/$prid');
  http
      .delete(
    url,
    headers: headers,
    body: jsonEncode({}),
  )
      .then((req) async {
    print(req.statusCode);

    if (req.statusCode == 204) {
      EasyLoading.showSuccess('ลบข้อมูลสำเร็จ!');
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MainEmployee(
                  index: 2,
                )),
      );
    } else {
      normalDialog(context, ('เกิดข้อผิดพลาด!'));
    }
  });
}

Future deleteprofile1(userid, context) async {
  Uri url = Uri.parse('http://206.189.145.138:3700/api/users/$userid');
  http
      .delete(
    url,
    headers: headers,
    body: jsonEncode({}),
  )
      .then((req) async {
    print(req.statusCode);

    if (req.statusCode == 204) {
      EasyLoading.showSuccess('ลบข้อมูลสำเร็จ!!');
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => HomepageOwn(
                  index: 1,
                )),
      );
    } else {
      normalDialog(context, ('เกิดข้อผิดพลาด!'));
    }
  });
}

Future sendstatusOrder0(statusOrder, orderid, context) async {
  Uri url = Uri.parse('http://206.189.145.138:3700/api/orders/status/$orderid');
  http
      .put(
    url,
    headers: headers,
    body: jsonEncode({"statusOrder": statusOrder}),
  )
      .then((req) async {
    print(req.statusCode);
    if (req.statusCode == 204) {
      EasyLoading.showSuccess('สำเร็จ!');
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
              builder: (context) => Customerhome(
                    index: 2,
                  )),
          (Route<dynamic> route) => false);
    } else {
      EasyLoading.showError('เกิดข้อผิดพลาด!');
    }
  });
}

Future sendstatusOrder4(statusOrder, orderid, context) async {
  Uri url = Uri.parse('http://206.189.145.138:3700/api/orders/status/$orderid');
  http
      .put(
    url,
    headers: headers,
    body: jsonEncode({"statusOrder": statusOrder}),
  )
      .then((req) async {
    print(req.statusCode);
    if (req.statusCode == 204) {
    } else {
      EasyLoading.showError('เกิดข้อผิดพลาด!');
    }
  });
}

Future sendstatusOrder(statusOrder, orderid, context) async {
  Uri url = Uri.parse('http://206.189.145.138:3700/api/orders/status/$orderid');
  http
      .put(
    url,
    headers: headers,
    body: jsonEncode({"statusOrder": statusOrder}),
  )
      .then((req) async {
    print(req.statusCode);
    if (req.statusCode == 204) {
      EasyLoading.showSuccess('สำเร็จ!');
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
              builder: (context) => HomepageOwn(
                    index: 0,
                  )),
          (Route<dynamic> route) => false);
    } else {
      EasyLoading.showError('เกิดข้อผิดพลาด!');
    }
  });
}

Future sendstatusOrder1(statusOrder, orderid, context) async {
  Uri url = Uri.parse('http://206.189.145.138:3700/api/orders/status/$orderid');
  http
      .put(
    url,
    headers: headers,
    body: jsonEncode({"statusOrder": statusOrder}),
  )
      .then((req) async {
    print(req.statusCode);
    if (req.statusCode == 204) {
      EasyLoading.showSuccess('สำเร็จ!');
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
              builder: (context) => MainEmployee(
                    index: 0,
                  )),
          (Route<dynamic> route) => false);
    } else {
      EasyLoading.showError('เกิดข้อผิดพลาด!');
    }
  });
}

Future sendstatusOrder11(statusOrder, orderid, context) async {
  Uri url = Uri.parse('http://206.189.145.138:3700/api/orders/status/$orderid');
  http
      .put(
    url,
    headers: headers,
    body: jsonEncode({"statusOrder": statusOrder}),
  )
      .then((req) async {
    print(req.statusCode);
    if (req.statusCode == 204) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
              builder: (context) => MainEmployee(
                    index: 3,
                  )),
          (Route<dynamic> route) => false);
    } else {
      EasyLoading.showError('เกิดข้อผิดพลาด!');
    }
  });
}

Future CreateEmp(
    fname, lname, phone, address, username, password, context) async {
  EasyLoading.show(status: 'loading...');

  Uri url = Uri.parse('http://206.189.145.138:3700/api/users/emp1');
  http
      .post(
    url,
    headers: headers,
    body: jsonEncode({
      "fname": fname,
      "lname": lname,
      "number": phone,
      "address": address,
      "username": username,
      "password": password,
    }),
  )
      .then((req) async {
    print(req.statusCode);
    if (req.statusCode == 201) {
      final prefs = await SharedPreferences.getInstance();
      var data = jsonDecode(req.body);
      prefs.setString('token', data['token']);
      headers?['Authorization'] = "bearer ${data['token']}";
      EasyLoading.showSuccess('สำเร็จ!');
    } else {
      EasyLoading.showError('เกิดข้อผิดพลาด!');
    }
  });
}

Future sendlocation(lat, lng, usersid, context) async {
  Uri url =
      Uri.parse('http://206.189.145.138:3700/api/users/location/$usersid');
  http
      .put(
    url,
    headers: headers,
    body: jsonEncode({"lat": lat, "lng": lng}),
  )
      .then((req) async {
    print(req.statusCode);
    print(lat);
    print(lng);

    if (req.statusCode == 204) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
              builder: (context) => Customerhome(
                    index: 3,
                  )),
          (Route<dynamic> route) => false);
      EasyLoading.showSuccess('สำเร็จ!');
    } else {
      normalDialog(context, ('เกิดข้อผิดพลาด!'));
    }
  });
}

Future CreateCus(
    fname, lname, phone, address, username, password, context) async {
  EasyLoading.show(status: 'loading...');

  Uri url = Uri.parse('http://206.189.145.138:3700/api/users');
  http
      .post(
    url,
    headers: headers,
    body: jsonEncode({
      "fname": fname,
      "lname": lname,
      "number": phone,
      "address": address,
      "username": username,
      "password": password,
    }),
  )
      .then((req) async {
    print(req.statusCode);
    if (req.statusCode == 201) {
      final prefs = await SharedPreferences.getInstance();
      var data = jsonDecode(req.body);
      prefs.setString('token', data['token']);
      headers?['Authorization'] = "bearer ${data['token']}";
      EasyLoading.showSuccess('สำเร็จ!');
    } else {
      print('error');
      EasyLoading.showError('เกิดข้อผิดพลาด!');
    }
  });
}

Future uploadPayment(File _image, orderid, context) async {
  var stream = http.ByteStream(_image.openRead());
  Uri url =
      Uri.parse('http://206.189.145.138:3700/api/orders/payment/$orderid');
  var length = await _image.length();

  http.MultipartRequest request = http.MultipartRequest('PUT', url)
    ..headers.addAll(headers!)
    ..files.add(
      // replace file with your field name exampe: image
      http.MultipartFile('photo', stream, length,
          contentType: MediaType('image', 'jpeg'),
          filename: basename(_image.path)),
    );

  var respons = await http.Response.fromStream(await request.send());
  if (respons.statusCode == 204) {
    sendstatusOrder4("4", orderid, context);
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
            builder: (context) => Customerhome(
                  index: 2,
                )),
        (Route<dynamic> route) => false);
    EasyLoading.showSuccess('สำเร็จ!');
  } else {
    EasyLoading.showError('เกิดข้อผิดพลาด!');
  }
}

Future uploadPR(File _image, prid, description, prdate, context) async {
  var stream = http.ByteStream(_image.openRead());
  Uri url =
      Uri.parse('http://206.189.145.138:3700/api/public_relations/pr1/$prid');
  var length = await _image.length();

  http.MultipartRequest request = http.MultipartRequest('PUT', url);
  request.fields.addAll({"prdate": prdate, "descrip": description});
  request.headers.addAll(headers!);
  request.files.add(
    // replace file with your field name exampe: image
    http.MultipartFile('photo', stream, length,
        contentType: MediaType('image', 'jpeg'),
        filename: basename(_image.path)),
  );

  var respons = await http.Response.fromStream(await request.send());
  if (respons.statusCode == 204) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MainEmployee(index: 2)),
    );
    EasyLoading.showSuccess('สำเร็จ!');
  } else {
    EasyLoading.showError('เกิดข้อผิดพลาด!');
  }
}

Future createPR(File _image, description, prdate, context) async {
  final prefs =
      await SharedPreferences.getInstance(); //เพิ่มตัวแชร์จากหน้าlogin
  int? user_id = prefs.getInt('idm');
  var stream = http.ByteStream(_image.openRead());
  Uri url = Uri.parse('http://206.189.145.138:3700/api/public_relations/');
  var length = await _image.length();

  http.MultipartRequest request = http.MultipartRequest('POST', url);
  request.fields.addAll(
      {"prdate": prdate, "prdescription": description, "userid": "$user_id"});
  request.headers.addAll(headers!);
  request.files.add(
    // replace file with your field name exampe: image
    http.MultipartFile('photo', stream, length,
        contentType: MediaType('image', 'jpeg'),
        filename: basename(_image.path)),
  );

  var respons = await http.Response.fromStream(await request.send());
  print(respons.statusCode);
  if (respons.statusCode == 201) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MainEmployee(index: 2)),
    );
    EasyLoading.showSuccess('สำเร็จ!');
  } else {
    EasyLoading.showError('เกิดข้อผิดพลาด!');
  }
}

Future<dynamic> getPR() async {
  Uri url = Uri.parse('http://206.189.145.138:3700/api/public_relations');
  return await http
      .get(
    url,
  )
      .then((req) async {
    print(req.statusCode);
    if (req.statusCode == 200) {
      var data = jsonDecode(req.body);
      return data;
    } else {
      return null;
    }
  });
}
