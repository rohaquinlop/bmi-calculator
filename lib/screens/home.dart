import 'package:bmicalculator/constants/colors.dart';
import 'package:bmicalculator/screens/height_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Welcome',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                  color: accentColor),
            ),
            const SizedBox(height: 80),
            Column(
              children: [
                Text('BMI Calculator',
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: accentColor)),
                Text('(Body Mass Index)',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: accentColor)),
              ],
            ),
            const SizedBox(height: 60),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => HeightScreen()),
                );
              },
              child: const Text(
                'Get Started',
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.w400),
              ),
              style: ElevatedButton.styleFrom(
                primary: btnColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                minimumSize: const Size(250, 60),
                elevation: 0,
              ),
            )
          ],
        ),
      ),
    );
  }
}
