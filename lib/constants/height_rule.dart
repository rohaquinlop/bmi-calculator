import 'package:bmicalculator/constants/rule.dart';
import 'package:bmicalculator/constants/rule_numbers.dart';
import 'package:flutter/material.dart';

class HeightRule extends StatelessWidget {
  //Constructor
  final String hType;

  const HeightRule({Key? key, required this.hType}) : super(key: key);

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
        children: <Widget>[
          const Rule(),
          const SizedBox(width: 20),
          RuleNumbers(hType: hType),
          const SizedBox(width: 20)
        ],
      ),
    );
  }
}
