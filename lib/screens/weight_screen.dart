import 'package:bmicalculator/constants/colors.dart';
import 'package:bmicalculator/constants/weight_arc.dart';
import 'package:bmicalculator/screens/results_screen.dart';
import 'package:flutter/material.dart';

class WeightScreen extends StatefulWidget {
  double height;

  WeightScreen({Key? key, required this.height});

  @override
  _WeightScreenState createState() => _WeightScreenState();
}

class _WeightScreenState extends State<WeightScreen> {
  //widget.height.toString()
  Color _btnColorC = accentColor;
  Color _btnColorF = primaryColor;
  Color _btnColorI = primaryColor;

  Color _txtColorC = primaryColor;
  Color _txtColorF = txtColor;
  Color _txtColorI = txtColor;

  String wType = 'kg';

  double _weight = 0.0;
  final TextEditingController _weightController = TextEditingController();

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
          'Weight',
          style: TextStyle(fontSize: 20, color: txtColor),
        ),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
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
                        wType = 'kg';
                      });
                    },
                    child: Text(
                      'Kilogram',
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
                        wType = 'pn';
                      });
                    },
                    child: Text(
                      'Pound',
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
                        wType = 'gr';
                      });
                    },
                    child: Text(
                      'Gram',
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
          //Here comes the scale animated
          WeightArc(weight: _weight, wType: wType),
          Center(
            child: SizedBox(
              width: 200,
              child: TextField(
                onChanged: (text) {
                  setState(() {
                    if (text.isNotEmpty) {
                      _weight = double.parse(text);
                    } else {
                      _weight = 0.0;
                    }
                  });
                },
                controller: _weightController,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(
                  hintText: 'Weight',
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
            ),
          ),
          SizedBox(
            width: 300,
            child: ElevatedButton(
              onPressed: () {
                if (_weightController.text.isNotEmpty) {
                  if (wType == 'pn') {
                    _weight = _weight / 2.205;
                  } else if (wType == 'gr') {
                    _weight = _weight / 1000;
                  }
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ResultsScreen(
                          height: widget.height, weight: _weight)));
                }
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
