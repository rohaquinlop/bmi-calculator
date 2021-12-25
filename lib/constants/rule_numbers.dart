import 'package:bmicalculator/constants/colors.dart';
import 'package:flutter/material.dart';

class RuleNumbers extends StatefulWidget {
  final String hType;

  const RuleNumbers({Key? key, required this.hType}) : super(key: key);

  @override
  _RuleNumbersState createState() => _RuleNumbersState();
}

class _RuleNumbersState extends State<RuleNumbers> {
  TextStyle ruleNumberStyle = TextStyle(
      color: ruleSeparatorColor, fontSize: 20, fontWeight: FontWeight.w600);

  List<String> hNumbersCm = [
    "220",
    "200",
    "180",
    "160",
    "140",
    "120",
    "100",
    "80",
    "60",
    "40"
  ];

  List<String> hNumberFt = [
    "7.217",
    "6.561",
    "5.905",
    "5.249",
    "4.593",
    "3.937",
    "3.281",
    "2.625",
    "1.969",
    "1.312"
  ];

  List<String> hNumberIn = [
    "86.61",
    "78.74",
    "70.87",
    "63.00",
    "55.13",
    "47.24",
    "39.37",
    "31.49",
    "23.62",
    "15.74"
  ];

  @override
  Widget build(BuildContext context) {
    List<String> hNumbers = [];
    if (widget.hType == 'cm') {
      hNumbers = [...hNumbersCm];
    } else if (widget.hType == 'ft') {
      hNumbers = [...hNumberFt];
    } else if (widget.hType == 'in') {
      hNumbers = [...hNumberIn];
    }
    return SizedBox(
      width: 60,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: hNumbers.length,
        shrinkWrap: true,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 15, left: 7),
          child: Text(hNumbers[index], style: ruleNumberStyle),
        ),
      ),
    );
  }
}
