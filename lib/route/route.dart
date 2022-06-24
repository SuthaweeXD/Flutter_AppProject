import 'package:flutter/material.dart';
import 'package:flutter_application_project/views/register.dart';

Map<String, Widget Function(BuildContext)> routes = {
  '/PageOne': (context) => const RegisterScreen(),
  // '/Page1': (context) => const InputMentor(),
  // '/Map': (context) => GoogleMaps(),
  // '/book': (context) => const Booking(),
  // '/Backup': (context) => const BackUp(),
};
