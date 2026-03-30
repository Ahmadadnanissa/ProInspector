import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:property_inspector/core/app_theme.dart';
import 'package:property_inspector/core/widgets/custom_font.dart';

class AddPrimaryImageWidget extends StatelessWidget {
  const AddPrimaryImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 48),
      child: DottedBorder(
        color: blackColor,
        strokeWidth: 1,
        dashPattern: [6, 3],
        borderType: BorderType.RRect,
        radius: Radius.circular(5),
        child: Container(
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                CustomFont(
                  name: 'Add Primary Image',
                  fontColor: blackColor,
                  fontSize: width * 0.06,
                ),
                CustomFont(
                  name: 'for this Property',
                  fontColor: blackColor,
                  fontSize: width * 0.06,
                ),
                Image.asset(
                  'assets/images/Add Image.png',
                  width: width * 0.2,
                  height: width * 0.2,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
