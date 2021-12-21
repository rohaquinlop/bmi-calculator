import 'package:bmicalculator/constants/colors.dart';
import 'package:bmicalculator/constants/height_bar.dart';
import 'package:flutter/material.dart';

class HeightScreen extends StatefulWidget {
  @override
  _HeightScreenState createState() => _HeightScreenState();
}

class _HeightScreenState extends State<HeightScreen> {
  Color _btnColorC = accentColor;
  Color _btnColorF = primaryColor;
  Color _btnColorI = primaryColor;

  Color _txtColorC = primaryColor;
  Color _txtColorF = txtColor;
  Color _txtColorI = txtColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          color: txtColor,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Height',
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
          Center(
            child: Container(
              width: 300,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade100, width: 1.5),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _btnColorC = accentColor;
                        _btnColorF = primaryColor;
                        _btnColorI = primaryColor;

                        _txtColorC = primaryColor;
                        _txtColorF = txtColor;
                        _txtColorI = txtColor;
                      });
                    },
                    child: Text(
                      'Centimeter',
                      style: TextStyle(color: _txtColorC),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: _btnColorC,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 0,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _btnColorC = primaryColor;
                        _btnColorF = accentColor;
                        _btnColorI = primaryColor;

                        _txtColorF = primaryColor;
                        _txtColorC = txtColor;
                        _txtColorI = txtColor;
                      });
                    },
                    child: Text(
                      'Feet',
                      style: TextStyle(color: _txtColorF),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: _btnColorF,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 0,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _btnColorC = primaryColor;
                        _btnColorF = primaryColor;
                        _btnColorI = accentColor;

                        _txtColorI = primaryColor;
                        _txtColorC = txtColor;
                        _txtColorF = txtColor;
                      });
                    },
                    child: Text(
                      'Inches',
                      style: TextStyle(color: _txtColorI),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: _btnColorI,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 0,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Row(
            //Will contain the height bar and the input field for height
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //Rule that shows the height in cm
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade100, width: 1.5),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const SizedBox(height: 10),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          HeightBar(barWidth: 30),
                          SizedBox(width: 20),
                        ]),
                    const SizedBox(height: 5),
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                      const HeightBar(barWidth: 30),
                      const SizedBox(width: 20),
                      Text('220',
                          style: TextStyle(
                              fontSize: 20, color: ruleSeparatorColor)),
                    ]),
                    const SizedBox(height: 10),
                    Text('200'),
                    Text('180'),
                    Text('160'),
                    Text('140'),
                    Text('120'),
                    Text('100'),
                    Text('80'),
                    Text('60'),
                    Text('40'),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
