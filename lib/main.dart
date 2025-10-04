import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'input_screen.dart';

void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primaryColor: Color.fromARGB(255, 11, 99, 126),
      scaffoldBackgroundColor: Colors.grey[100],
      appBarTheme: AppBarTheme(
        backgroundColor: Color.fromARGB(255, 11, 99, 126),
        foregroundColor: Colors.white,
        elevation: 4, 
      ),
    ),
    home: NICInputScreen(), //Navigation to the NIC input screen
  ));
}
