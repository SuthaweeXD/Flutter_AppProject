import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_project/config/config.dart';
import 'package:flutter_application_project/model/ModelOrders.dart';
import 'package:flutter_application_project/views/employee/MainEmp.dart';
import 'package:flutter_application_project/views/Homepage.dart';
import 'package:flutter_application_project/views/employee/OrderDBEmp.dart';
import 'package:flutter_application_project/views/employee/UsersDB.dart';
import 'package:flutter_application_project/views/order/ConfirmOrders.dart';
import 'package:flutter_application_project/views/order/OrdersDB.dart';
import 'package:flutter_application_project/views/owner/Main.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

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

      headers?['Authorization'] = "bearer ${data['token']}";
      EasyLoading.showSuccess('Great Success!');
      data['user_role'] == "C"
          ? Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => Customerhome(index: 0)),
              (Route<dynamic> route) => false)
          : Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                  builder: (context) => MainEmployee(
                        index: 0,
                      )),
              (Route<dynamic> route) => false);
    } else {
      print('error');
      EasyLoading.showError('Failed with Error');
    }
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
      EasyLoading.showSuccess('Great Success!');
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
      EasyLoading.showError('Failed with Error');
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
      EasyLoading.showSuccess('Great Success!');
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => Customerhome(index: 0)),
          (Route<dynamic> route) => false);
    } else {
      EasyLoading.showError('Failed with Error');
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
      EasyLoading.showSuccess('Great Success!');
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => MainEmployee(index: 0)),
          (Route<dynamic> route) => false);
    } else {
      EasyLoading.showError('Failed with Error');
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
      EasyLoading.showSuccess('Great Success!');
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => HomepageOwn(index: 0)),
          (Route<dynamic> route) => false);
    } else {
      EasyLoading.showError('Failed with Error');
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

Future sendorders(small, big, roll, picdate, pictime, now, context) async {
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
      "odate": now
    }),
  )
      .then((req) async {
    print(req.statusCode);
    print(picdate);
    print(pictime);
    print(small);
    if (req.statusCode == 201) {
      EasyLoading.showSuccess('Great Success!');
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
  Uri url = Uri.parse('http://206.189.145.138:3700/api/orders/f/$user_id');
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
      EasyLoading.showSuccess('Great Success!');
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Customerhome(index: 0)),
      );
    } else {
      normalDialog(context, ('มีช่องว่าง'));
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
      EasyLoading.showSuccess('Great Success!');
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => usersDB()),
      );
    } else {
      normalDialog(context, ('มีช่องว่าง'));
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
      EasyLoading.showSuccess('Great Success!');
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
              builder: (context) => Customerhome(
                    index: 2,
                  )),
          (Route<dynamic> route) => false);
    } else {
      EasyLoading.showError('Failed with Error');
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
      EasyLoading.showSuccess('Great Success!');
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
              builder: (context) => HomepageOwn(
                    index: 0,
                  )),
          (Route<dynamic> route) => false);
    } else {
      EasyLoading.showError('Failed with Error');
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
      EasyLoading.showSuccess('Great Success!');
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
              builder: (context) => MainEmployee(
                    index: 0,
                  )),
          (Route<dynamic> route) => false);
    } else {
      EasyLoading.showError('Failed with Error');
    }
  });
}

Future CreateUser(
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
      EasyLoading.showSuccess('Great Success!');
      // data['user_role'] == "C"
      //     ? Navigator.of(context).pushAndRemoveUntil(
      //         MaterialPageRoute(builder: (context) => Customerhome(index: 0)),
      //         (Route<dynamic> route) => false)
      //     : Navigator.of(context).pushAndRemoveUntil(
      //         MaterialPageRoute(
      //             builder: (context) => MainEmployee(
      //                   index: 0,
      //                 )),
      //         (Route<dynamic> route) => false);
    } else {
      print('error');
      EasyLoading.showError('Failed with Error');
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
      EasyLoading.showSuccess('Great Success!');
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
              builder: (context) => Customerhome(
                    index: 3,
                  )),
          (Route<dynamic> route) => false);
    } else {
      normalDialog(context, ('มีช่องว่าง'));
    }
  });
}
