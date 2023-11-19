import 'package:flutter/material.dart';

class ContainerBox extends StatelessWidget {
  const ContainerBox(
      {super.key, required this.boxColor, required this.childwidget});

  final Color boxColor;
  final Widget childwidget;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: boxColor,
      ),
      child: childwidget,
    );
  }
}
