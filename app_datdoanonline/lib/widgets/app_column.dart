import 'package:app_datdoanonline/widgets/Icon_and_text_widget.dart';
import 'package:app_datdoanonline/widgets/big_text.dart';
import 'package:app_datdoanonline/widgets/small_text.dart';
import 'package:flutter/material.dart';

class AppColumn extends StatelessWidget {
  final String text;
  const AppColumn({Key? key,required this.text}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigText(text: text, size: 26,),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Wrap(
                          children: List.generate(
                            5,
                            (index) => const Icon(Icons.star,
                                color: Colors.yellow, size: 15),
                          ),
                        ),
                        const SizedBox(width: 10),
                        SmallText(text: "4.8"),
                        const SizedBox(width: 10),
                        SmallText(text: "(999+ Bình luận)"),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        IconAndTextWidget(
                          icon: Icons.location_on,
                          text: "3.3km ",
                          iconColor: Color(0xFF89dad0),
                        ),
                        IconAndTextWidget(
                          icon: Icons.access_time_rounded,
                          text: "27 phút",
                          iconColor: Colors.black,
                        ),
                      ],
                    ),
                  ],
                );
  }
}