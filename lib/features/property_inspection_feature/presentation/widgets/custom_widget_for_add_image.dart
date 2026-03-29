import 'package:flutter/material.dart';
import 'package:property_inspector/core/app_theme.dart';
import 'package:property_inspector/core/widgets/custom_font.dart';

class CustomWidgetForAddImage extends StatelessWidget {
  const CustomWidgetForAddImage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: primaryColor,
          radius: width * 0.07,
          child: Icon(Icons.add, color: secondaryColor, size: width * 0.12),
        ),
        CustomFont(
          name: 'Add Photos',
          fontColor: blackColor,
          fontSize: width * 0.035,
        ),
      ],
    );
  }
}
