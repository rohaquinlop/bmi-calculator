import 'package:bmicalculator/constants/colors.dart';
import 'package:bmicalculator/constants/results_arc.dart';
import 'package:flutter/material.dart';

class ResultsScreen extends StatefulWidget {
  double height, weight;

  ResultsScreen({Key? key, required this.height, required this.weight})
      : super(key: key);

  @override
  _ResultsScreenState createState() => _ResultsScreenState();
}

class _ResultsScreenState extends State<ResultsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          color: txtColor,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'BMI Result',
          style: TextStyle(fontSize: 20, color: txtColor),
        ),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ResultsArc(result: 20),
        ],
      ),
    );
  }
}
