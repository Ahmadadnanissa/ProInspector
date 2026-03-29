import 'package:flutter/material.dart';
import 'package:property_inspector/core/app_theme.dart';
import 'package:property_inspector/core/widgets/custom_font.dart';
import 'package:property_inspector/features/property_inspection_feature/presentation/widgets/custom_text_form_field.dart';
import 'package:property_inspector/features/property_inspection_feature/presentation/widgets/custom_widget_for_add_image.dart';

class CustomWidgetForFillInformation extends StatelessWidget {
  const CustomWidgetForFillInformation({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width * 0.9,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(width * 0.04),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(width * 0.02),
              child: CustomFont(
                name: 'Description',
                fontColor: secondaryColor,
                fontSize: width * 0.05,
                fontWeight: FontWeight.w600,
              ),
            ),
            CustomTextFormField(
              hintText: 'Short Description(name)',
              maxLines: 1,
            ),
            CustomTextFormField(hintText: 'Full Description', maxLines: 5),

            CustomWidgetForAddImage(),
          ],
        ),
      ),
    );
  }
}
