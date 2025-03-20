import 'package:app_datdoanonline/pages/home/food_page_body.dart';
import 'package:app_datdoanonline/widgets/big_text.dart';
import 'package:app_datdoanonline/widgets/small_text.dart';
import 'package:flutter/material.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({super.key});
  
  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Header
          Container(
            margin: EdgeInsets.only(top: 45, bottom: 15),
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    BigText(text: "Vietnam", color: Colors.pink[200]),
                    Row(
                      children: [
                        SmallText(text: "Huế", color: Colors.black54),
                        Icon(Icons.arrow_drop_down_rounded),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(width: 10),
                    Container(
                      width: 45,
                      height: 45,
                      child: Icon(Icons.search, color: Colors.white),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.pink[200],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: FoodPageBody(),
            ),
          ),
        ],
      ),
    );
  }
}
