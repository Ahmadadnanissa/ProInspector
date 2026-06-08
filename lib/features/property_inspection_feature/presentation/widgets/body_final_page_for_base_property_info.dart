import 'package:flutter/material.dart';
import 'package:property_inspector/core/widgets/navigation_route.dart';
import 'package:property_inspector/features/property_inspection_feature/data/models/out_door_model.dart';
import 'package:property_inspector/features/property_inspection_feature/data/models/room_item.dart';
import 'package:property_inspector/features/property_inspection_feature/presentation/pages/propert_type_page.dart';
import 'package:property_inspector/features/property_inspection_feature/presentation/widgets/custom_text_form_field.dart';
import 'package:property_inspector/features/property_inspection_feature/presentation/widgets/furnidhing_drop_down.dart';
import 'package:property_inspector/features/property_inspection_feature/presentation/widgets/furnishing_option.dart';
import 'package:property_inspector/features/property_inspection_feature/presentation/widgets/heating_drop_down.dart';
import 'package:property_inspector/features/property_inspection_feature/presentation/widgets/hetating_option.dart';
import 'package:property_inspector/features/property_inspection_feature/presentation/widgets/secondary_button.dart';

class BodyFinalPageForBasePropertyInfo extends StatefulWidget {
  const BodyFinalPageForBasePropertyInfo({
    super.key,
    required this.fullDescription,
    required this.shortDescription,
    required this.zipCode,
    required this.propertyType,
    required this.galleryPhoto,
    required this.askingPrice,
    required this.listingType,
    required this.cityName,
    required this.location,
    required this.lat,
    required this.lon,
    required this.nearByPlaces,
    required this.outDoors,
    required this.sqftArea,
    required this.constructionYear,
    required this.roomItems,
  });
  final String fullDescription;
  final String shortDescription;
  final String zipCode;
  final String propertyType;
  final List<String> galleryPhoto;
  final String askingPrice;
  final String listingType;
  final String cityName;
  final String location;
  final double lat;
  final double lon;
  final List<String> nearByPlaces;

  final List<OutdoorItem> outDoors;

  final String sqftArea;
  final String constructionYear;

  final List<RoomItem> roomItems;

  @override
  State<BodyFinalPageForBasePropertyInfo> createState() =>
      _BodyFinalPageForBasePropertyInfoState();
}

class _BodyFinalPageForBasePropertyInfoState
    extends State<BodyFinalPageForBasePropertyInfo> {
  final TextEditingController heatingController = TextEditingController();

  final TextEditingController furnishingController = TextEditingController();

  final TextEditingController rentalPeriodController = TextEditingController();

  final TextEditingController basementAreaController = TextEditingController();

  final TextEditingController internalGarageAreaController =
      TextEditingController();

  final TextEditingController finishingQualityController =
      TextEditingController();

  final TextEditingController maintenanceLevelController =
      TextEditingController();

  final TextEditingController neighborhoodScoreController =
      TextEditingController();

  final TextEditingController exteriorFinishController =
      TextEditingController();
  FurnishingOption? selectedFurnishing;

  HeatingOption? selectedHeating;

  bool fireplace = false;

  bool hasBasement = false;

  @override
  void dispose() {
    heatingController.dispose();
    furnishingController.dispose();
    rentalPeriodController.dispose();
    basementAreaController.dispose();
    internalGarageAreaController.dispose();
    finishingQualityController.dispose();
    maintenanceLevelController.dispose();
    neighborhoodScoreController.dispose();
    exteriorFinishController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 12),

          HeatingDropdown(
            selectedValue: selectedHeating,
            onChanged: (value) {
              setState(() {
                selectedHeating = value;
              });
            },
          ),

          const SizedBox(height: 12),

          FurnishingDropdown(
            selectedValue: selectedFurnishing,
            onChanged: (value) {
              setState(() {
                selectedFurnishing = value;
              });
            },
          ),

          if (widget.listingType.toUpperCase() == 'RENT') ...[
            const SizedBox(height: 12),

            CustomTextFormField(
              hintText: 'Rental Period (Months)',
              maxLines: 1,
              controller: rentalPeriodController,
            ),
          ],

          const SizedBox(height: 12),

          CheckboxListTile(
            title: const Text('Has Fireplace'),
            value: fireplace,
            onChanged: (value) {
              setState(() {
                fireplace = value ?? false;
              });
            },
          ),

          CheckboxListTile(
            title: const Text('Has Basement'),
            value: hasBasement,
            onChanged: (value) {
              setState(() {
                hasBasement = value ?? false;
              });
            },
          ),

          if (hasBasement) ...[
            const SizedBox(height: 12),

            CustomTextFormField(
              hintText: 'Basement Area',
              maxLines: 1,
              controller: basementAreaController,
            ),
          ],

          const SizedBox(height: 12),

          CustomTextFormField(
            hintText: 'Internal Garage Area',
            maxLines: 1,
            controller: internalGarageAreaController,
          ),

          const SizedBox(height: 12),

          CustomTextFormField(
            hintText: 'Finishing Quality',
            maxLines: 1,
            controller: finishingQualityController,
          ),

          const SizedBox(height: 12),

          CustomTextFormField(
            hintText: 'Maintenance Level',
            maxLines: 1,
            controller: maintenanceLevelController,
          ),

          const SizedBox(height: 12),

          CustomTextFormField(
            hintText: 'Neighborhood Score',
            maxLines: 1,
            controller: neighborhoodScoreController,
          ),

          const SizedBox(height: 12),

          CustomTextFormField(
            hintText: 'Exterior Finish',
            maxLines: 1,
            controller: exteriorFinishController,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SecondaryButton(
                  name: 'Back',
                  pushing: () {
                    Navigator.pop(context);
                  },
                  color: Color(0xffE29578),
                  isBack: true,
                ),
                SecondaryButton(
                  name: 'Continue',
                  pushing: () {
                    Navigator.push(
                      context,
                      SlideRight(
                        page: PropertTypePage(
                          fullDescription: widget.fullDescription,
                          shortDescription: widget.shortDescription,
                          zipCode: widget.zipCode,
                          propertyType: widget.propertyType,
                          galleryPhoto: widget.galleryPhoto,
                          askingPrice: widget.askingPrice,
                          listingType: widget.listingType,
                          cityName: widget.cityName,
                          location: widget.location,
                          lat: widget.lat,
                          lon: widget.lon,
                          nearByPlaces: widget.nearByPlaces,
                          outDoors: widget.outDoors,
                          sqftArea: widget.sqftArea,
                          constructionYear: widget.constructionYear,
                          roomItems: widget.roomItems,

                          heating: selectedHeating?.apiValue ?? '',
                          furnishing: selectedFurnishing?.apiValue ?? '',

                          rentalPeriod:
                              widget.listingType.toUpperCase() == 'RENT'
                              ? rentalPeriodController.text
                              : null,

                          fireplace: fireplace,

                          hasBasement: hasBasement,

                          basementArea: hasBasement
                              ? basementAreaController.text
                              : null,

                          internalGarageArea: internalGarageAreaController.text,

                          finishingQuality: finishingQualityController.text,

                          maintenanceLevel: maintenanceLevelController.text,

                          neighborhoodScore: neighborhoodScoreController.text,

                          exteriorFinish: exteriorFinishController.text,
                        ),
                      ),
                    );
                  },
                  isBack: false,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
