import 'package:flutter/material.dart';

class CustomSmallContainer extends StatelessWidget {
  const CustomSmallContainer({super.key, required this.color});
  final Color color;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width * 0.13,
      height: width * 0.013,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}
