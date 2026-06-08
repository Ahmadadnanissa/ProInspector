import 'package:flutter/material.dart';
import 'package:property_inspector/features/home_feature/presentation/widgets/custom_app_bar.dart';
import 'package:property_inspector/features/property_inspection_feature/data/models/out_door_model.dart';
import 'package:property_inspector/features/property_inspection_feature/data/models/room_item.dart';
import 'package:property_inspector/features/property_inspection_feature/presentation/widgets/body_final_page_for_base_property_info.dart';

class FinalPageForBasePropertyInfo extends StatelessWidget {
  const FinalPageForBasePropertyInfo({
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: BodyFinalPageForBasePropertyInfo(
        fullDescription: fullDescription,
        shortDescription: shortDescription,
        zipCode: zipCode,
        propertyType: propertyType,
        galleryPhoto: galleryPhoto,
        askingPrice: askingPrice,
        listingType: listingType,
        cityName: cityName,
        location: location,
        lat: lat,
        lon: lon,
        nearByPlaces: nearByPlaces,
        outDoors: outDoors,
        sqftArea: sqftArea,
        constructionYear: constructionYear,
        roomItems: roomItems,
      ),
    );
  }
}
