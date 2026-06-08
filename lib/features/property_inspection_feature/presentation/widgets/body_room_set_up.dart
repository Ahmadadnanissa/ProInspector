import 'package:flutter/material.dart';
import 'package:property_inspector/core/widgets/navigation_route.dart';
import 'package:property_inspector/features/property_inspection_feature/data/models/out_door_model.dart';
import 'package:property_inspector/features/property_inspection_feature/data/models/room_item.dart';
import 'package:property_inspector/features/property_inspection_feature/presentation/pages/final_page_for_base_property_info.dart';
import 'package:property_inspector/features/property_inspection_feature/presentation/widgets/custom_title.dart';

import 'package:property_inspector/features/property_inspection_feature/presentation/widgets/room_set_up_section.dart';
import 'package:property_inspector/features/property_inspection_feature/presentation/widgets/secondary_button.dart';

class BodyRoomSetUp extends StatefulWidget {
  const BodyRoomSetUp({
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

  @override
  State<BodyRoomSetUp> createState() => _BodyRoomSetUpState();
}

class _BodyRoomSetUpState extends State<BodyRoomSetUp> {
  final List<RoomItem> roomItems = [];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.03),
        child: Column(
          children: [
            CustomTitle(
              title: 'Room Setup',
              subTitle:
                  'Select Room Type and enter details for the inspection report',
              number: 4,
            ),
            SizedBox(height: 20),
            RoomSetupSection(roomItems: roomItems),

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
                          page: FinalPageForBasePropertyInfo(
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
                            roomItems: roomItems,
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
      ),
    );
  }
}
