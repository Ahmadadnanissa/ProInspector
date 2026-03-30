import 'package:flutter/material.dart';
import 'package:property_inspector/core/widgets/custom_font.dart';

class CustomContainerForEvaluate extends StatelessWidget {
  const CustomContainerForEvaluate({
    super.key,
    required this.name,
    required this.color,
    required this.colorFont,
  });
  final String name;
  final Color color;
  final Color colorFont;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width * 0.25,
      height: width * 0.15,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Center(
        child: CustomFont(
          name: name,
          fontColor: colorFont,
          fontSize: width * 0.04,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
