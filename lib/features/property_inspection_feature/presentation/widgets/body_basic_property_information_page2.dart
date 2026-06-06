import 'package:flutter/material.dart';
import 'package:property_inspector/core/app_theme.dart';
import 'package:property_inspector/core/widgets/navigation_route.dart';
import 'package:property_inspector/features/property_inspection_feature/presentation/pages/room_setup_page.dart';
import 'package:property_inspector/features/property_inspection_feature/presentation/widgets/custom_text_form_field.dart';
import 'package:property_inspector/features/property_inspection_feature/presentation/widgets/custom_title.dart';
import 'package:property_inspector/features/property_inspection_feature/presentation/widgets/custom_widget_for_add_near_by.dart';
import 'package:property_inspector/features/property_inspection_feature/presentation/widgets/custom_widget_for_fill_information.dart';
import 'package:property_inspector/features/property_inspection_feature/presentation/widgets/secondary_button.dart';

class BodyBasicPropertyInformationPage2 extends StatelessWidget {
  const BodyBasicPropertyInformationPage2({
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

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.03),
        child: Column(
          children: [
            CustomTitle(
              title: 'Basic Property Information',
              subTitle: 'Enter the main details of the Property',
              number: 3,
            ),

            Padding(
              padding: EdgeInsets.only(top: width * 0.1, bottom: width * 0.05),
              child: CustomWidgetForFillInformation(
                title: 'Area(SQFT)',
                description: 'Description',
                hintText1: '200',
                galleryPhoto: [],
              ),
            ),

            CustomTextFormField(hintText: 'Construction Year', maxLines: 1),

            Padding(
              padding: EdgeInsets.symmetric(vertical: width * 0.05),
              child: Divider(height: 20, thickness: 0.5, color: grayColor),
            ),

            CustomWidetForAddOutDoorPlaces(),

            Padding(
              padding: EdgeInsets.symmetric(vertical: width * 0.05),
              child: Divider(height: 20, thickness: 0.5, color: grayColor),
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
                        SlideRight(page: RoomSetupPage()),
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
