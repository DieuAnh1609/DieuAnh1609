import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  double height;
 SmallText({Key? key, this.color = const Color.fromARGB(255, 10, 10, 10), 
  required this.text,
  this.size= 12,
  this.height = 1.2
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'Arial',
        color: color,
        fontSize: size,
        height: height
      ),
    );
  }
}