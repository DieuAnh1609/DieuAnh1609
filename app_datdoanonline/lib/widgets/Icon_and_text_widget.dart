import 'package:app_datdoanonline/widgets/small_text.dart';
import 'package:flutter/material.dart';

class IconAndTextWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color iconColor;
  const IconAndTextWidget({Key? key, 
    required this.icon,
    required this.text, 
    required this.iconColor }):super(key :key);
    

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: iconColor,),
        SizedBox(width: 5,),
        SmallText(text: text,),
      ],
    );
  }
}