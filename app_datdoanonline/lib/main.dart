import 'package:app_datdoanonline/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


void main() {
  runApp(FoodOrderApp());
}

class FoodOrderApp extends StatelessWidget {
  const FoodOrderApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food Online',
      home: LoginPage(), 
    );
  }
}
