import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:property_inspector/features/property_inspection_feature/data/models/balcony_data.dart';
import 'package:property_inspector/features/property_inspection_feature/data/models/room_item.dart';
import 'package:property_inspector/features/property_inspection_feature/presentation/widgets/custom_near_by_place.dart';
import 'package:property_inspector/features/property_inspection_feature/presentation/widgets/custom_new_button.dart';
import 'package:property_inspector/features/property_inspection_feature/presentation/widgets/custom_text_form_field.dart';
import 'package:property_inspector/features/property_inspection_feature/presentation/widgets/custom_widget_for_add_image.dart';
import 'package:property_inspector/features/property_inspection_feature/presentation/widgets/room_type_dropdown.dart';
import 'package:property_inspector/features/property_inspection_feature/presentation/widgets/room_type_option.dart';

class RoomSetupSection extends StatefulWidget {
  const RoomSetupSection({super.key, required this.roomItems});

  final List<RoomItem> roomItems;

  @override
  State<RoomSetupSection> createState() => _RoomSetupSectionState();
}

class _RoomSetupSectionState extends State<RoomSetupSection> {
  RoomTypeOption? selectedType;

  final TextEditingController sizeController = TextEditingController();

  final TextEditingController descriptionController = TextEditingController();

  final TextEditingController paintDescriptionController =
      TextEditingController();

  final TextEditingController balconySizeController = TextEditingController();

  final ImagePicker picker = ImagePicker();

  List<File> selectedImages = [];

  List<String> galleryPhoto = [];

  bool hasBalcony = false;

  @override
  void dispose() {
    sizeController.dispose();
    descriptionController.dispose();
    paintDescriptionController.dispose();
    balconySizeController.dispose();
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

  void addRoom() {
    if (selectedType == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Select room type')));
      return;
    }

    if (sizeController.text.trim().isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Enter room size')));
      return;
    }

    if (descriptionController.text.trim().isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Enter description')));
      return;
    }

    if (paintDescriptionController.text.trim().isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Enter paint description')));
      return;
    }

    if (galleryPhoto.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Add room photos')));
      return;
    }

    if (hasBalcony && balconySizeController.text.trim().isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Enter balcony size')));
      return;
    }

    widget.roomItems.add(
      RoomItem(
        type: selectedType!.apiValue,
        size: double.parse(sizeController.text),
        description: descriptionController.text.trim(),
        paintDescription: paintDescriptionController.text.trim(),
        photos: List<String>.from(galleryPhoto),
        hasBalcony: hasBalcony,
        balconyData: hasBalcony
            ? BalconyData(sizeSqft: double.parse(balconySizeController.text))
            : null,
      ),
    );

    selectedType = null;

    sizeController.clear();

    descriptionController.clear();

    paintDescriptionController.clear();

    balconySizeController.clear();

    selectedImages.clear();

    galleryPhoto.clear();

    hasBalcony = false;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RoomTypeDropdown(
          selectedValue: selectedType,
          onChanged: (value) {
            setState(() {
              selectedType = value;
            });
          },
        ),

        const SizedBox(height: 16),

        CustomTextFormField(
          controller: sizeController,
          hintText: 'Room Size (SQFT)',
          maxLines: 1,
        ),

        const SizedBox(height: 16),

        CustomTextFormField(
          controller: descriptionController,
          hintText: 'Description',
          maxLines: 3,
        ),

        const SizedBox(height: 16),

        CustomTextFormField(
          controller: paintDescriptionController,
          hintText: 'Paint Description',
          maxLines: 1,
        ),

        const SizedBox(height: 12),

        CheckboxListTile(
          value: hasBalcony,
          title: const Text('Has Balcony'),
          onChanged: (value) {
            setState(() {
              hasBalcony = value ?? false;
            });
          },
        ),

        if (hasBalcony) ...[
          const SizedBox(height: 12),

          CustomTextFormField(
            controller: balconySizeController,
            hintText: 'Balcony Size (SQFT)',
            maxLines: 1,
          ),
        ],

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

        const SizedBox(height: 20),

        CustomNewButton(name: 'New', pushing: addRoom),

        const SizedBox(height: 20),

        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            for (final room in widget.roomItems)
              CustomNearByPlace(name: room.type),
          ],
        ),
      ],
    );
  }
}
