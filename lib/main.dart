// ignore_for_file: prefer_const_constructors

import "package:flutter/material.dart";
import "package:todoapp/pages/home_page.dart";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.amber),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
