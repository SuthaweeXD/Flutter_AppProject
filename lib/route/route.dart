import 'package:flutter/material.dart';
import 'package:flutter_application_project/views/ProflieUpdate.dart';
import 'package:flutter_application_project/views/register.dart';

Map<String, Widget Function(BuildContext)> routes = {
  '/PageOne': (context) => RegisterScreen(),
  '/PageFour': (context) => const ProfileUpdate(),
};
