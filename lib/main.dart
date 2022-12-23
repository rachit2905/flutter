// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project1/screens/homepage.dart';
import 'package:project1/screens/loginpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: ThemeData(primarySwatch: Colors.indigo),
      darkTheme: ThemeData(brightness: Brightness.dark),
      routes: {
        "/": (context) => loginPage(),
        "/login": (context) => loginPage()
      },
    );
  }
}
