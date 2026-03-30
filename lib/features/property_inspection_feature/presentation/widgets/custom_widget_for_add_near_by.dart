import 'package:flutter/material.dart';
import 'package:property_inspector/features/property_inspection_feature/presentation/widgets/custom_near_by_place.dart';
import 'package:property_inspector/features/property_inspection_feature/presentation/widgets/custom_new_button.dart';
import 'package:property_inspector/features/property_inspection_feature/presentation/widgets/custom_widget_for_fill_information.dart';

class CustomWidetForAddOutDoorPlaces extends StatefulWidget {
  const CustomWidetForAddOutDoorPlaces({super.key});

  @override
  State<CustomWidetForAddOutDoorPlaces> createState() =>
      _CustomWidetForAddOutDoorPlacesState();
}

class _CustomWidetForAddOutDoorPlacesState
    extends State<CustomWidetForAddOutDoorPlaces> {
  final TextEditingController controller1 = TextEditingController();
  final TextEditingController controller2 = TextEditingController();
  List<String> outDoors = [];
  String? value1;
  String? value2;

  @override
  void dispose() {
    controller1.dispose();
    controller2.dispose();
    super.dispose();
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
            RegExp xRegex = RegExp(r'^[A-Za-z ]+$');
            if (data!.isEmpty || !xRegex.hasMatch(data.trim())) {
              return 'field required';
            }
            return null;
          },
          title: 'Outdoor Area',
          description: 'Description',
          hintText1: 'Swimming Pool',
        ),
        Padding(
          padding: const EdgeInsets.all(15),
          child: CustomNewButton(
            name: 'Add',
            pushing: () {
              if (value1 != null && value2 != null) {
                setState(() {
                  outDoors.add(controller1.text.trim());
                  controller1.clear();
                  controller2.clear();
                });
              }
            },
          ),
        ),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            for (var place in outDoors) CustomNearByPlace(name: place),
          ],
        ),
      ],
    );
  }
}
