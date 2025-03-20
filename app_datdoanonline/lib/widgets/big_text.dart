import 'package:flutter/material.dart';

class BigText extends StatelessWidget {
  Color? color;
  final String text;
  final bool isBold;
  double size;
  TextOverflow overflow;
 BigText({Key? key, this.color = const Color(0xFF332d2b), 
  required this.text,
  this.size= 16,
  this.isBold = false,
  this.overflow = TextOverflow.ellipsis
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: overflow,
      style: TextStyle(
        fontFamily: 'Arial',
        color: color,

        fontSize: size,
        fontWeight: isBold? FontWeight.bold: FontWeight.w400,
        
      ),
    );
  }
}