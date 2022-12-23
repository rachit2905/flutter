// ignore_for_file: unused_import, camel_case_types, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project1/screens/homepage.dart';

class loginPage extends StatelessWidget {
  const loginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Text(
          "Login Page",
          style: TextStyle(
              fontSize: 200, color: Colors.green, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
