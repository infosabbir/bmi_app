import 'package:flutter/material.dart';

const textStyle1 = TextStyle(color: Color(0xFFffffff), fontSize: 20.0);

// height icon
const textStyle2 = TextStyle(
    color: Color(0xFFffffff), fontSize: 40.0, fontWeight: FontWeight.w900);
// calculate button
const textStyle3 = TextStyle(
    color: Color(0xFFffffff), fontSize: 30.0, fontWeight: FontWeight.w900);

class DataContainer extends StatelessWidget {
  const DataContainer({super.key, required this.icon, required this.title});

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 75.0,
          color: Colors.white,
        ),
        const SizedBox(
          height: 12.0,
        ),
        Text(title, style: textStyle1),
      ],
    );
  }
}
