import 'package:flutter/material.dart';
import 'package:flutter_application_project/views/Homepage.dart';
import 'package:flutter_application_project/views/customer/ProflieUpdate.dart';
import 'package:flutter_application_project/views/register.dart';

Map<String, Widget Function(BuildContext)> routes = {
  '/PageOne': (context) => RegisterScreen(),
  '/PageFour': (context) => const ProfileUpdate(),
  '/Page1': (context) => Customerhome(index: 0),
  '/DataUser': (context) => Customerhome(index: 1),
};
