import 'package:flutter/material.dart';
import 'package:property_inspector/core/app_theme.dart';
import 'package:property_inspector/features/home_feature/presentation/widgets/custom_app_bar.dart';
import 'package:property_inspector/features/property_inspection_feature/presentation/widgets/body_basic_property_information_page.dart';

class BasicPropertyInformationPage extends StatelessWidget {
  const BasicPropertyInformationPage({
    super.key,
    required this.shortDescription,
    required this.fullDescription,
    required this.propertyType,
    required this.galleryPhoto,
    required this.zipCode,
  });
  final String shortDescription;
  final String fullDescription;
  final String zipCode;
  final String propertyType;
  final List<String> galleryPhoto;

  static String id = 'BasicPropertyInformationPage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: CustomAppBar(),
      body: BodyBasicPropertyInformationPage(
        shortDescription: shortDescription,
        fullDescription: fullDescription,
        propertyType: propertyType,
        galleryPhoto: galleryPhoto,
        zipCode: zipCode,
      ),
    );
  }
}
