import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:property_inspector/features/property_inspection_feature/data/models/out_door_model.dart';
import 'package:property_inspector/features/property_inspection_feature/presentation/widgets/custom_near_by_place.dart';
import 'package:property_inspector/features/property_inspection_feature/presentation/widgets/custom_new_button.dart';
import 'package:property_inspector/features/property_inspection_feature/presentation/widgets/custom_text_form_field.dart';
import 'package:property_inspector/features/property_inspection_feature/presentation/widgets/custom_widget_for_add_image.dart';
import 'package:property_inspector/features/property_inspection_feature/presentation/widgets/outdoor_type_dropdown.dart';
import 'package:property_inspector/features/property_inspection_feature/presentation/widgets/outdoor_type_option.dart';

class OutdoorAreasSection extends StatefulWidget {
  const OutdoorAreasSection({super.key, required this.outDoors});

  final List<OutdoorItem> outDoors;

  @override
  State<OutdoorAreasSection> createState() => _OutdoorAreasSectionState();
}

class _OutdoorAreasSectionState extends State<OutdoorAreasSection> {
  final TextEditingController descriptionController = TextEditingController();

  OutdoorTypeOption? selectedType;

  final ImagePicker picker = ImagePicker();

  List<File> selectedImages = [];

  List<String> galleryPhoto = [];

  @override
  void dispose() {
    descriptionController.dispose();
    super.dispose();
  }

  Future<void> pickImages() async {
    final images = await picker.pickMultiImage();

    if (images.isEmpty) return;

    if (images.length > 5) {
      if (!mounted) return;

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Maximum 5 images')));
      return;
    }

    selectedImages = images.map((e) => File(e.path)).toList();

    galleryPhoto.clear();

    for (final image in selectedImages) {
      galleryPhoto.add(base64Encode(await image.readAsBytes()));
    }

    setState(() {});
  }

  void addOutdoorItem() {
    if (selectedType == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Select outdoor type')));
      return;
    }

    if (descriptionController.text.trim().isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Enter description')));
      return;
    }

    if (galleryPhoto.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Add images')));
      return;
    }

    widget.outDoors.add(
      OutdoorItem(
        type: selectedType!.apiValue,
        desc: descriptionController.text.trim(),
        photos: List<String>.from(galleryPhoto),
      ),
    );

    selectedType = null;

    descriptionController.clear();

    selectedImages.clear();

    galleryPhoto.clear();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        OutdoorTypeDropdown(
          selectedValue: selectedType,
          onChanged: (value) {
            setState(() {
              selectedType = value;
            });
          },
        ),

        const SizedBox(height: 16),

        CustomTextFormField(
          controller: descriptionController,
          hintText: 'Description',
          maxLines: 5,
        ),

        const SizedBox(height: 16),

        GestureDetector(onTap: pickImages, child: CustomWidgetForAddImage()),

        const SizedBox(height: 16),

        if (selectedImages.isNotEmpty)
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
              return ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.file(selectedImages[index], fit: BoxFit.cover),
              );
            },
          ),

        const SizedBox(height: 16),

        CustomNewButton(name: 'Add', pushing: addOutdoorItem),

        const SizedBox(height: 20),

        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            for (final item in widget.outDoors)
              CustomNearByPlace(name: item.type),
          ],
        ),
      ],
    );
  }
}
