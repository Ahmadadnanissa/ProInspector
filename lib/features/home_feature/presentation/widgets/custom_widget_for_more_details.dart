import 'package:flutter/material.dart';
import 'package:property_inspector/core/app_theme.dart';
import 'package:property_inspector/core/widgets/custom_font.dart';

class CustomWidgetForMoreDetails extends StatelessWidget {
  const CustomWidgetForMoreDetails({
    super.key,
    required this.detail,
    required this.info,
  });
  final String detail;
  final String info;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.04,
        vertical: width * 0.015,
      ),
      child: Row(
        children: [
          CustomFont(
            name: detail,
            fontColor: grayColor,
            fontSize: width * 0.045,
          ),
          Spacer(),
          CustomFont(name: info, fontColor: grayColor, fontSize: width * 0.045),
        ],
      ),
    );
  }
}
