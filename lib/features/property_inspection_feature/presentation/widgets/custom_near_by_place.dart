import 'package:flutter/material.dart';
import 'package:property_inspector/core/app_theme.dart';
import 'package:property_inspector/core/widgets/custom_font.dart';

class CustomNearByPlace extends StatelessWidget {
  const CustomNearByPlace({super.key, required this.name});
  final String name;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xffFFDDD2),
          borderRadius: BorderRadius.circular(width * 0.04),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: CustomFont(
            name: name,
            fontColor: blackColor,
            fontSize: width * 0.04,
          ),
        ),
      ),
    );
  }
}
