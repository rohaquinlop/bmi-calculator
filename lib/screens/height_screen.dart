import 'package:bmicalculator/constants/colors.dart';
import 'package:bmicalculator/constants/height_rule.dart';
import 'package:bmicalculator/screens/weight_screen.dart';
import 'package:flutter/material.dart';

class HeightScreen extends StatefulWidget {
  @override
  _HeightScreenState createState() => _HeightScreenState();
}

class _HeightScreenState extends State<HeightScreen> {
  final TextEditingController _heightController = TextEditingController();

  double _height = 0.0;

  Color _btnColorC = accentColor;
  Color _btnColorF = primaryColor;
  Color _btnColorI = primaryColor;

  Color _txtColorC = primaryColor;
  Color _txtColorF = txtColor;
  Color _txtColorI = txtColor;
  String hType = 'cm';

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
                        hType = 'cm';
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
                        hType = 'ft';
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
                        hType = 'in';
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
          const SizedBox(height: 10),
          Row(
            //Will contain the height bar and the input field for height
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //SizedBox(width: 20),
              //Rule that shows the height in cm
              HeightRule(hType: hType),
              const SizedBox(width: 60),
              //Input field for height
              SizedBox(
                width: 130,
                child: TextField(
                  controller: _heightController,
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  decoration: InputDecoration(
                    hintText: 'Height',
                    hintStyle: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w600,
                        color: Colors.orange.withOpacity(.8)),
                    border: InputBorder.none,
                  ),
                  style: TextStyle(
                    fontSize: 42,
                    fontWeight: FontWeight.w300,
                    color: txtColor,
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            width: 300,
            child: ElevatedButton(
              onPressed: () {
                if (_heightController.text.isNotEmpty) {
                  _height = double.parse(_heightController.text);
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          WeightScreen(height: _height, hType: hType)));
                  //Navigator.pushNamed(context, '/weight', arguments: _height);
                }
                //Navigator.pop(context);
              },
              child: const Text(
                'Next',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w600),
              ),
              style: ElevatedButton.styleFrom(
                primary: btnColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 0,
              ),
            ),
          )
        ],
      ),
    );
  }
}
