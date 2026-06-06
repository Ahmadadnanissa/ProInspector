import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:property_inspector/features/property_inspection_feature/data/models/out_door_model.dart';
import 'package:property_inspector/features/property_inspection_feature/presentation/widgets/custom_near_by_place.dart';
import 'package:property_inspector/features/property_inspection_feature/presentation/widgets/custom_new_button.dart';
import 'package:property_inspector/features/property_inspection_feature/presentation/widgets/custom_widget_for_fill_information.dart';

class CustomWidetForAddOutDoorPlaces extends StatefulWidget {
  const CustomWidetForAddOutDoorPlaces({super.key, required this.outDoors});
  final List<OutdoorItem> outDoors;
  @override
  State<CustomWidetForAddOutDoorPlaces> createState() =>
      _CustomWidetForAddOutDoorPlacesState();
}

class _CustomWidetForAddOutDoorPlacesState
    extends State<CustomWidetForAddOutDoorPlaces> {
  final TextEditingController controller1 = TextEditingController();
  final TextEditingController controller2 = TextEditingController();
  String? value1;
  String? value2;

  @override
  void dispose() {
    controller1.dispose();
    controller2.dispose();
    super.dispose();
  }

  List<File> selectedImages = [];
  List<String> galleryPhoto = [];
  final ImagePicker _picker = ImagePicker();
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

    galleryPhoto.clear();

    galleryPhoto.addAll(await convertImagesToBase64List());

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
    return Column(
      children: [
        CustomWidgetForFillInformation(
          onChanged1: (data) {
            value1 = data.trim();
          },
          onChanged2: (data) {
            value2 = data.trim();
          },
          controller1: controller1,
          controller2: controller2,
          validator1: (data) {
            RegExp xRegex = RegExp(r'^[A-Za-z][A-Za-z ]$');
            if (data!.isEmpty || !xRegex.hasMatch(data.trim())) {
              return 'field required';
            }
            return null;
          },
          validator2: (data) {
            RegExp xRegex = RegExp(r'^[A-Za-z][A-Za-z ]*$');
            if (data!.isEmpty || !xRegex.hasMatch(data.trim())) {
              return 'field required';
            }
            return null;
          },
          title: 'Outdoor Area',
          description: 'Description',
          hintText1: 'Swimming Pool',
          galleryPhoto: [],
        ),
        Padding(
          padding: const EdgeInsets.all(15),
          child: CustomNewButton(
            name: 'Add',
            pushing: () async {
              if (controller1.text.trim().isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Please enter outdoor type')),
                );
                return;
              }

              if (controller2.text.trim().isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Please enter description')),
                );
                return;
              }

              if (galleryPhoto.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Please add photos first')),
                );
                return;
              }

              widget.outDoors.add(
                OutdoorItem(
                  type: controller1.text.trim(),
                  desc: controller2.text.trim(),
                  photos: List<String>.from(galleryPhoto),
                ),
              );

              controller1.clear();
              controller2.clear();

              selectedImages.clear();
              galleryPhoto.clear();

              setState(() {});
            },
          ),
        ),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            for (var item in widget.outDoors)
              CustomNearByPlace(name: item.type),
          ],
        ),
      ],
    );
  }
}
