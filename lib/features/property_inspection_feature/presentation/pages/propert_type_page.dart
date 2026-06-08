import 'package:flutter/material.dart';
import 'package:property_inspector/core/app_theme.dart';
import 'package:property_inspector/features/home_feature/presentation/widgets/custom_app_bar.dart';
import 'package:property_inspector/features/property_inspection_feature/data/models/out_door_model.dart';
import 'package:property_inspector/features/property_inspection_feature/data/models/room_item.dart';
import 'package:property_inspector/features/property_inspection_feature/presentation/widgets/body_property_type.dart';

class PropertTypePage extends StatelessWidget {
  const PropertTypePage({
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
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: primaryColor,
        appBar: CustomAppBar(),
        body: BodyPropertyType(
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
          heating: heating,
          furnishing: furnishing,
          rentalPeriod: rentalPeriod,
          fireplace: fireplace,
          hasBasement: hasBasement,
          basementArea: basementArea,
          internalGarageArea: internalGarageArea,
          finishingQuality: finishingQuality,
          maintenanceLevel: maintenanceLevel,
          neighborhoodScore: neighborhoodScore,
          exteriorFinish: exteriorFinish,
        ),
      ),
    );
  }
}
