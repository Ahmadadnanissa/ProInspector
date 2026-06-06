import 'package:flutter/material.dart';
import 'package:property_inspector/core/app_theme.dart';
import 'package:property_inspector/features/home_feature/presentation/widgets/custom_app_bar.dart';
import 'package:property_inspector/features/property_inspection_feature/presentation/widgets/body_basic_property_information_page2.dart';

class BasicPropertyInformationPage2 extends StatelessWidget {
  const BasicPropertyInformationPage2({
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
  static String id = 'BasicPropertyInformationPage2';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: primaryColor,
        appBar: CustomAppBar(),
        body: BodyBasicPropertyInformationPage2(
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
        ),
      ),
    );
  }
}
