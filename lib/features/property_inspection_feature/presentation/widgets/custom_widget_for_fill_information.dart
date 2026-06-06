import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:property_inspector/core/app_theme.dart';
import 'package:property_inspector/core/widgets/custom_font.dart';
import 'package:property_inspector/features/property_inspection_feature/presentation/widgets/custom_text_form_field.dart';
import 'package:property_inspector/features/property_inspection_feature/presentation/widgets/custom_widget_for_add_image.dart';

// ignore: must_be_immutable
class CustomWidgetForFillInformation extends StatefulWidget {
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
    required this.galleryPhoto,
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
  final List<String> galleryPhoto;

  @override
  State<CustomWidgetForFillInformation> createState() =>
      _CustomWidgetForFillInformationState();
}

class _CustomWidgetForFillInformationState
    extends State<CustomWidgetForFillInformation> {
  final ImagePicker _picker = ImagePicker();

  List<File> selectedImages = [];

  Future<void> pickImages() async {
    final images = await _picker.pickMultiImage();

    if (images.isEmpty) return;

    if (images.length > 5) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('You can select up to 5 images only')),
      );
      return;
    }

    selectedImages = images.map((e) => File(e.path)).toList();

    widget.galleryPhoto.clear();

    widget.galleryPhoto.addAll(await convertImagesToBase64List());

    setState(() {});
  }

  Future<String> convertImageToBase64(File image) async {
    return base64Encode(await image.readAsBytes());
  }

  Future<List<String>> convertImagesToBase64List() async {
    return Future.wait(selectedImages.map((img) => convertImageToBase64(img)));
  }

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
                name: widget.title,
                fontColor: secondaryColor,
                fontSize: width * 0.05,
                fontWeight: FontWeight.w600,
              ),
            ),
            CustomTextFormField(
              controller: widget.controller1,
              onChanged: widget.onChanged1,
              hintText: widget.hintText1,
              maxLines: 1,
              validator: widget.validator1,
            ),
            CustomTextFormField(
              controller: widget.controller2,
              onChanged: widget.onChanged2,
              hintText: widget.description,
              maxLines: 5,
              validator: widget.validator2,
            ),

            GestureDetector(
              onTap: pickImages,
              child: CustomWidgetForAddImage(),
            ),
            if (selectedImages.isNotEmpty) ...[
              const SizedBox(height: 16),

              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: selectedImages.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemBuilder: (context, index) {
                  return Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.file(
                          selectedImages[index],
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),

                      Positioned(
                        top: 4,
                        right: 4,
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.black54,
                            shape: BoxShape.circle,
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(4),
                            child: Icon(
                              Icons.check,
                              color: Colors.white,
                              size: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ],
        ),
      ),
    );
  }
}
