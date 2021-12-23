import 'package:bmicalculator/constants/rule.dart';
import 'package:bmicalculator/constants/rule_numbers.dart';
import 'package:flutter/material.dart';

class HeightRule extends StatelessWidget {
  //Constructor
  const HeightRule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade100, width: 1.5),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Rule(),
          const SizedBox(width: 10),
          RuleNumbers(),
          const SizedBox(width: 10)
        ],
      ),
    );
  }
}
