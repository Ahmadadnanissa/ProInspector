import 'package:flutter/material.dart';
import 'package:property_inspector/core/widgets/custom_font.dart';

class CustomTypeForFilter extends StatelessWidget {
  const CustomTypeForFilter({
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
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(width * 0.05),
      ),
      child: Center(
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(
            horizontal: width * 0.04,
            vertical: width * 0.01,
          ),
          child: CustomFont(
            name: name,
            fontColor: colorFont,
            fontSize: width * 0.045,
          ),
        ),
      ),
    );
  }
}
