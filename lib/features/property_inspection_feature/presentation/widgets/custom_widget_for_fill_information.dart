import 'package:flutter/material.dart';
import 'package:property_inspector/core/app_theme.dart';
import 'package:property_inspector/core/widgets/custom_font.dart';
import 'package:property_inspector/features/property_inspection_feature/presentation/widgets/custom_text_form_field.dart';
import 'package:property_inspector/features/property_inspection_feature/presentation/widgets/custom_widget_for_add_image.dart';

// ignore: must_be_immutable
class CustomWidgetForFillInformation extends StatelessWidget {
  CustomWidgetForFillInformation({
    super.key,
    required this.title,
    required this.description,
    required this.hintText1,
    this.validator1,
    this.validator2,
    this.controller1,
    this.controller2,
    this.onChanged1,
    this.onChanged2,
  });
  final String title;
  final String description;
  final String hintText1;
  String? Function(String?)? validator1;
  String? Function(String?)? validator2;
  TextEditingController? controller1;
  TextEditingController? controller2;
  void Function(String)? onChanged1;
  void Function(String)? onChanged2;

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
                name: title,
                fontColor: secondaryColor,
                fontSize: width * 0.05,
                fontWeight: FontWeight.w600,
              ),
            ),
            CustomTextFormField(
              controller: controller1,
              onChanged: onChanged1,
              hintText: hintText1,
              maxLines: 1,
              validator: validator1,
            ),
            CustomTextFormField(
              controller: controller2,
              onChanged: onChanged2,
              hintText: description,
              maxLines: 5,
              validator: validator2,
            ),

            CustomWidgetForAddImage(),
          ],
        ),
      ),
    );
  }
}
