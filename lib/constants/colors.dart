import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

final Color primaryColor = HexColor('#FFFFFF');
final Color accentColor = HexColor('#FC6D21');
final Color txtColor = HexColor('#040A2C');
final Color btnColor = HexColor('#5631FB');
final Color weigthColor = HexColor('#20B9FC');
final Color ruleSeparatorColor = HexColor('#E0E0E0');

final Gradient gradient = LinearGradient(
  colors: <Color>[
    Colors.greenAccent.withOpacity(1.0),
    Colors.yellowAccent.withOpacity(1.0),
    Colors.redAccent.withOpacity(1.0),
  ],
  stops: const [0.0, 0.5, 1.0],
);
