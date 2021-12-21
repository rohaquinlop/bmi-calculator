import 'package:bmicalculator/constants/colors.dart';
import 'package:flutter/material.dart';

class HeightBar extends StatelessWidget {
  final double barWidth;

  //Constructor
  const HeightBar({Key? key, required this.barWidth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: barWidth,
          height: 3,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              color: ruleSeparatorColor),
        ),
      ],
    );
  }
}
