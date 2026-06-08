import 'dart:convert';
import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:property_inspector/core/app_theme.dart';
import 'package:property_inspector/core/widgets/custom_font.dart';

class AddPrimaryImageWidget extends StatefulWidget {
  const AddPrimaryImageWidget({super.key, required this.onImageSelected});

  final Function(String imageBase64) onImageSelected;

  @override
  State<AddPrimaryImageWidget> createState() => _AddPrimaryImageWidgetState();
}

class _AddPrimaryImageWidgetState extends State<AddPrimaryImageWidget> {
  final ImagePicker picker = ImagePicker();

  File? selectedImage;

  Future<void> pickImage() async {
    final image = await picker.pickImage(source: ImageSource.gallery);

    if (image == null) return;

    selectedImage = File(image.path);

    final imageBase64 = base64Encode(await selectedImage!.readAsBytes());

    widget.onImageSelected(imageBase64);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 48),
      child: GestureDetector(
        onTap: pickImage,
        child: DottedBorder(
          color: blackColor,
          strokeWidth: 1,
          dashPattern: const [6, 3],
          borderType: BorderType.RRect,
          radius: const Radius.circular(5),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: selectedImage == null
                  ? Column(
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
                    )
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.file(
                        selectedImage!,
                        height: 220,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
