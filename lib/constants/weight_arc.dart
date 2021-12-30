import 'package:bmicalculator/constants/colors.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class WeightArc extends StatefulWidget {
  final double weight;
  final String wType;
  const WeightArc({Key? key, required this.weight, required this.wType})
      : super(key: key);

  @override
  _WeightArcState createState() => _WeightArcState();
}

class _WeightArcState extends State<WeightArc>
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

    double endV = 3.14;

    if (widget.wType == 'kg') {
      endV = (widget.weight * 3.14) / 100.0;
    } else if (widget.wType == 'pn') {
      endV = (widget.weight * 3.14) / 220.5;
    } else {
      endV = (widget.weight * 3.14) / 100000;
    }

    _animation = Tween<double>(begin: 0.0, end: endV).animate(curvedAnimation)
      ..addListener(() {
        setState(() {});
      });
    _controller.forward();
    //_controller.repeat(period: const Duration(seconds: 2));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final curvedAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOutCubic,
    );

    double endV = 3.14;

    if (widget.wType == 'kg') {
      endV = (widget.weight * 3.14) / 100.0;
    } else if (widget.wType == 'pn') {
      endV = (widget.weight * 3.14) / 220.5;
    } else {
      endV = (widget.weight * 3.14) / 100000;
    }

    _animation = Tween<double>(begin: 0.0, end: endV).animate(curvedAnimation)
      ..addListener(() {
        setState(() {});
      });

    String type = 'Kg';

    if (widget.wType == 'kg') {
      type = 'Kg';
    } else if (widget.wType == 'pn') {
      type = 'Pounds';
    } else {
      type = 'Grams';
    }

    return SizedBox(
      height: 300,
      width: 300,
      child: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Stack(
            children: [
              CustomPaint(
                size: const Size(300, 300),
                painter: ProgressArc(-10000, Colors.black54, true),
              ),
              CustomPaint(
                size: const Size(300, 300),
                painter: ProgressArc(_animation.value, Colors.redAccent, false),
              ),
              //Custom Text
              Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: Center(
                    child: Text(
                      "${widget.weight} $type",
                      style:
                          const TextStyle(color: Colors.black54, fontSize: 30),
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
    final rect = Rect.fromLTRB(0, 0, 300, 300);
    final startAngle = -math.pi;
    final sweepAngle = arc != -10000 ? arc : math.pi;
    final userCenter = false;
    final paint = Paint()
      ..strokeCap = StrokeCap.round
      ..color = progressColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 30;

    if (!isBackground) {
      paint.shader = gradient.createShader(rect);
    }
    canvas.drawArc(rect, startAngle, sweepAngle, userCenter, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
