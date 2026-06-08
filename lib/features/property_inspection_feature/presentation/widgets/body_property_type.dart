import 'package:flutter/material.dart';
import 'package:property_inspector/core/widgets/navigation_route.dart';
import 'package:property_inspector/features/property_inspection_feature/data/models/out_door_model.dart';
import 'package:property_inspector/features/property_inspection_feature/data/models/room_item.dart';
import 'package:property_inspector/features/property_inspection_feature/presentation/pages/final_inspection_page.dart';
import 'package:property_inspector/features/property_inspection_feature/presentation/widgets/custom_text_form_field.dart';
import 'package:property_inspector/features/property_inspection_feature/presentation/widgets/secondary_button.dart';

class BodyPropertyType extends StatefulWidget {
  const BodyPropertyType({
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
    required this.heating,
    required this.furnishing,
    this.rentalPeriod,
    required this.fireplace,
    required this.hasBasement,
    this.basementArea,
    required this.internalGarageArea,
    required this.finishingQuality,
    required this.maintenanceLevel,
    required this.neighborhoodScore,
    required this.exteriorFinish,
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

  final String heating;
  final String furnishing;

  final String? rentalPeriod;

  final bool fireplace;

  final bool hasBasement;

  final String? basementArea;

  final String internalGarageArea;

  final String finishingQuality;

  final String maintenanceLevel;

  final String neighborhoodScore;

  final String exteriorFinish;

  @override
  State<BodyPropertyType> createState() => _BodyPropertyTypeState();
}

class _BodyPropertyTypeState extends State<BodyPropertyType> {
  final TextEditingController floorNumberController = TextEditingController();

  final TextEditingController numberOfFloorsController =
      TextEditingController();

  bool elevator = false;

  @override
  void dispose() {
    floorNumberController.dispose();
    numberOfFloorsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          if (widget.propertyType.toUpperCase() == 'APARTMENT' ||
              widget.propertyType.toUpperCase() == 'HALL') ...[
            CustomTextFormField(
              hintText: 'Floor Number',
              maxLines: 1,
              controller: floorNumberController,
            ),

            const SizedBox(height: 12),

            CheckboxListTile(
              title: const Text('Has Elevator'),
              value: elevator,
              onChanged: (value) {
                setState(() {
                  elevator = value ?? false;
                });
              },
            ),
          ] else if (widget.propertyType.toUpperCase() == 'STORE') ...[
            CustomTextFormField(
              hintText: 'Floor Number',
              maxLines: 1,
              controller: floorNumberController,
            ),
          ] else if (widget.propertyType.toUpperCase() == 'VILLA' ||
              widget.propertyType.toUpperCase() == 'HOUSE') ...[
            CustomTextFormField(
              hintText: 'Number Of Floors',
              maxLines: 1,
              controller: numberOfFloorsController,
            ),
          ],
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
                        page: FinalInspectionPage(
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

                          heating: widget.heating,
                          furnishing: widget.furnishing,
                          rentalPeriod: widget.rentalPeriod,

                          fireplace: widget.fireplace,
                          hasBasement: widget.hasBasement,
                          basementArea: widget.basementArea,

                          internalGarageArea: widget.internalGarageArea,
                          finishingQuality: widget.finishingQuality,
                          maintenanceLevel: widget.maintenanceLevel,
                          neighborhoodScore: widget.neighborhoodScore,
                          exteriorFinish: widget.exteriorFinish,

                          floorNumber: floorNumberController.text.isEmpty
                              ? null
                              : floorNumberController.text,

                          numberOfFloors: numberOfFloorsController.text.isEmpty
                              ? null
                              : numberOfFloorsController.text,

                          elevator: elevator,
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
