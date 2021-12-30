import 'package:bmicalculator/constants/colors.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class ResultsArc extends StatefulWidget {
  double result;
  ResultsArc({Key? key, required this.result}) : super(key: key);

  @override
  _ResultsArcState createState() => _ResultsArcState();
}

class _ResultsArcState extends State<ResultsArc>
    with SingleTickerProviderStateMixin {
  late Animation<double> _animation;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    final curvedAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOutCubic,
    );

    double endV = (widget.result * 6.28) / 40;

    _animation = Tween<double>(begin: 0.0, end: endV).animate(curvedAnimation)
      ..addListener(() {
        setState(() {});
      });
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double sizeW = 250;
    return SizedBox(
      height: sizeW,
      width: sizeW,
      child: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Stack(
            children: [
              CustomPaint(
                size: Size(sizeW, sizeW),
                painter: ProgressArc(-10000, Colors.grey.shade400, true),
              ),
              CustomPaint(
                size: Size(sizeW, sizeW),
                painter: ProgressArc(_animation.value, accentColor, false),
              ),
              //Custom Text
              Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Center(
                    child: Text(
                      widget.result.toStringAsFixed(1),
                      style: TextStyle(
                          color: txtColor,
                          fontSize: 50,
                          fontWeight: FontWeight.w900),
                    ),
                  )),
            ],
          )),
    );
  }
}

class ProgressArc extends CustomPainter {
  bool isBackground;
  double arc;
  Color progressColor;
  ProgressArc(this.arc, this.progressColor, this.isBackground);

  @override
  void paint(Canvas canvas, Size size) {
    const rect = Rect.fromLTRB(0, 0, 250, 250);
    const startAngle = -math.pi;
    final sweepAngle = arc != -10000 ? arc : 2 * math.pi;
    const userCenter = false;
    final paint = Paint()
      ..strokeCap = StrokeCap.round
      ..color = progressColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 35;

    if (!isBackground) {
      //paint.shader = gradient.createShader(rect);
    }
    canvas.drawArc(rect, startAngle, sweepAngle, userCenter, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
