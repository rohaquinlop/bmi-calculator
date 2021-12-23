import 'package:bmicalculator/constants/colors.dart';
import 'package:flutter/material.dart';

class RuleNumbers extends StatelessWidget {
  RuleNumbers({Key? key}) : super(key: key);

  TextStyle ruleNumberStyle = TextStyle(
      color: ruleSeparatorColor, fontSize: 20, fontWeight: FontWeight.w600);

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Text('220', style: ruleNumberStyle),
          const SizedBox(height: 25),
          Text('200', style: ruleNumberStyle),
          const SizedBox(height: 25),
          Text('180', style: ruleNumberStyle),
          const SizedBox(height: 25),
          Text('160', style: ruleNumberStyle),
          const SizedBox(height: 25),
          Text('140', style: ruleNumberStyle),
          const SizedBox(height: 25),
          Text('120', style: ruleNumberStyle),
          const SizedBox(height: 25),
          Text('100', style: ruleNumberStyle),
          const SizedBox(height: 25),
          Text('80', style: ruleNumberStyle),
          const SizedBox(height: 25),
          Text('60', style: ruleNumberStyle),
          const SizedBox(height: 25),
          Text('40', style: ruleNumberStyle),
        ]);
  }
}
