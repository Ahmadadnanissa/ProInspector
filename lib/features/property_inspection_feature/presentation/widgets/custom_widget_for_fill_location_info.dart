import 'package:flutter/material.dart';
import 'package:property_inspector/core/app_theme.dart';
import 'package:property_inspector/core/widgets/custom_font.dart';
import 'package:property_inspector/features/property_inspection_feature/presentation/pages/map_pagr_for_request_page.dart';
import 'package:property_inspector/features/property_inspection_feature/presentation/widgets/custom_near_by_place.dart';
import 'package:property_inspector/features/property_inspection_feature/presentation/widgets/custom_new_button.dart';
import 'package:property_inspector/features/property_inspection_feature/presentation/widgets/custom_text_form_field.dart';

// ignore: must_be_immutable
class CustomWidgetForFillLocationInformation extends StatefulWidget {
  const CustomWidgetForFillLocationInformation({
    super.key,
    required this.location,
    required this.cityName,
    required this.lat,
    required this.lon,
    required this.nearbyPlaces,
  });
  final TextEditingController location;
  final TextEditingController cityName;
  final TextEditingController lat;
  final TextEditingController lon;
  final List<String> nearbyPlaces;
  @override
  State<CustomWidgetForFillLocationInformation> createState() =>
      _CustomWidgetForFillLocationInformationState();
}

class _CustomWidgetForFillLocationInformationState
    extends State<CustomWidgetForFillLocationInformation> {
  final TextEditingController nearbyController = TextEditingController();
  String? value;

  @override
  void dispose() {
    nearbyController.dispose();
    super.dispose();
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
                name: 'Location',
                fontColor: secondaryColor,
                fontSize: width * 0.05,
                fontWeight: FontWeight.w600,
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: CustomTextFormField(
                    hintText: 'City',
                    maxLines: 1,
                    controller: widget.cityName,
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    final result = await Navigator.pushNamed(
                      context,
                      MapPageForRequestPage.id,
                    );

                    if (result is Map<String, dynamic>) {
                      setState(() {
                        widget.lat.text = (result["lat"] ?? '').toString();
                        widget.lon.text = (result["lng"] ?? '').toString();
                        widget.cityName.text = result["city"]?.toString() ?? '';
                        widget.location.text =
                            result["address"]?.toString() ?? '';
                      });
                    }
                  },
                  child: Container(
                    width: width * 0.15,
                    height: width * 0.12,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(width * 0.04),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(width * 0.04),
                      child: Image.asset(
                        'assets/images/map_Image.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            CustomTextFormField(
              hintText: 'Property Location',
              maxLines: 1,
              controller: widget.location,
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(width * 0.02),
                  child: CustomFont(
                    name: 'Add Nearby Places',
                    fontColor: secondaryColor,
                    fontSize: width * 0.05,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Spacer(),
                CustomNewButton(
                  name: 'New',
                  pushing: () {
                    final place = nearbyController.text.trim();

                    if (place.isEmpty) return;

                    if (widget.nearbyPlaces.contains(place)) return;

                    setState(() {
                      widget.nearbyPlaces.add(place);
                      nearbyController.clear();
                    });
                  },
                ),
              ],
            ),
            CustomTextFormField(
              hintText: 'Nearby Place',
              maxLines: 1,
              validator: (data) {
                RegExp xRegex = RegExp(r'^[a-zA-Z\u0600-\u06FF ]+$');
                if (data!.isEmpty || !xRegex.hasMatch(data.trim())) {
                  return 'field required';
                }
                return null;
              },
              onChanged: (data) {
                value = data.trim();
              },
              controller: nearbyController,
            ),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                for (var place in widget.nearbyPlaces)
                  CustomNearByPlace(name: place),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
