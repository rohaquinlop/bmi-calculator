import 'package:bmicalculator/constants/colors.dart';
import 'package:bmicalculator/constants/results_arc.dart';
import 'package:flutter/material.dart';

class ResultsScreen extends StatefulWidget {
  double height, weight;
  String hType, wType;

  ResultsScreen(
      {Key? key,
      required this.height,
      required this.weight,
      required this.hType,
      required this.wType})
      : super(key: key);

  @override
  _ResultsScreenState createState() => _ResultsScreenState();
}

class _ResultsScreenState extends State<ResultsScreen> {
  @override
  Widget build(BuildContext context) {
    double _weight = widget.weight;
    double _height = widget.height;
    double results;
    String outputText = '';

    if (widget.wType == 'pn') {
      _weight = widget.weight / 2.205;
    } else if (widget.wType == 'gr') {
      _weight = widget.weight / 1000;
    }
    if (widget.hType == 'ft') {
      _height = widget.height * 30.48;
    } else if (widget.hType == 'in') {
      _height = widget.height * 2.54;
    }

    _height = _height / 100;

    results = _weight / (_height * _height);

    if (results < 18.5) {
      outputText = 'You are underweight!';
    } else if (results >= 18.5 && results <= 24.9) {
      outputText = 'You have normal body weight!';
    } else if (results >= 25 && results <= 29.9) {
      outputText = 'You are overweight!';
    } else if (results >= 30) {
      outputText = 'You are obese!';
    }

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
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Center(
            child: ResultsArc(result: results),
          ),
          const SizedBox(height: 80),
          Container(
            width: 200,
            height: 70,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.grey,
                )),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(widget.height.toStringAsFixed(0),
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            color: txtColor)),
                    const Text('Height',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey)),
                  ],
                ),
                Container(
                  height: 30,
                  width: 1,
                  color: Colors.grey,
                  margin: const EdgeInsets.only(left: 20, right: 20),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(widget.weight.toStringAsFixed(0),
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            color: txtColor)),
                    const Text('Weight',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey)),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),
          Center(
            child: Text(outputText,
                style: TextStyle(
                    fontSize: 20,
                    color: txtColor,
                    fontWeight: FontWeight.w600)),
          )
        ],
      ),
    );
  }
}
