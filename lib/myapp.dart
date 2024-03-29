import 'package:flutter/material.dart';
import 'package:flutter_application_project/route/route.dart';
import 'package:flutter_application_project/views/Login.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoginScreen(),
      routes: routes,
      builder: EasyLoading.init(),
    );
  }
}
