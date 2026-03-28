import 'package:flutter/material.dart';
import 'package:property_inspector/core/widgets/custom_font.dart';

class CustomContainerForInfo extends StatelessWidget {
  const CustomContainerForInfo({
    super.key,
    required this.name,
    required this.number,
    required this.color,
    required this.colorFont,
  });
  final String name;
  final String number;
  final Color color;
  final Color colorFont;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width * 0.45,
      height: width * 0.25,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            offset: Offset(0, 3),
            blurRadius: 10,
          ),
        ],
        color: color,
        borderRadius: BorderRadius.circular(width * 0.05),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomFont(name: name, fontColor: colorFont, fontSize: width * 0.05),
          SizedBox(height: width * 0.02),
          CustomFont(
            name: number,
            fontColor: colorFont,
            fontSize: width * 0.07,
            fontWeight: FontWeight.w600,
          ),
        ],
      ),
    );
  }
}
