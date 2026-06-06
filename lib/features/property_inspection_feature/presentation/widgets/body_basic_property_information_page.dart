import 'package:flutter/material.dart';
import 'package:property_inspector/core/app_theme.dart';
import 'package:property_inspector/core/widgets/navigation_route.dart';
import 'package:property_inspector/features/property_inspection_feature/presentation/pages/basic_property_information_page2.dart';
import 'package:property_inspector/features/property_inspection_feature/presentation/widgets/custom_text_form_field.dart';
import 'package:property_inspector/features/property_inspection_feature/presentation/widgets/custom_title.dart';
import 'package:property_inspector/features/property_inspection_feature/presentation/widgets/custom_widget_for_fill_location_info.dart';
import 'package:property_inspector/features/property_inspection_feature/presentation/widgets/row_rent_or_buy.dart';
import 'package:property_inspector/features/property_inspection_feature/presentation/widgets/secondary_button.dart';

class BodyBasicPropertyInformationPage extends StatefulWidget {
  const BodyBasicPropertyInformationPage({
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

  @override
  State<BodyBasicPropertyInformationPage> createState() =>
      _BodyBasicPropertyInformationPageState();
}

class _BodyBasicPropertyInformationPageState
    extends State<BodyBasicPropertyInformationPage> {
  final TextEditingController askingPrice = TextEditingController();
  final TextEditingController location = TextEditingController();
  final TextEditingController cityName = TextEditingController();
  final TextEditingController listingType = TextEditingController(text: "SALE");

  final TextEditingController lat = TextEditingController();
  final TextEditingController lon = TextEditingController();

  List<String> nearByPlaces = [];

  @override
  void dispose() {
    askingPrice.dispose();
    listingType.dispose();
    location.dispose();
    cityName.dispose();
    lat.dispose();
    lon.dispose();
    super.dispose();
  }

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
              number: 2,
            ),
            RowRentOrBuy(listingType: listingType),

            CustomTextFormField(
              hintText: 'Asking Price',
              maxLines: 1,
              controller: askingPrice,
            ),

            Padding(
              padding: const EdgeInsets.all(15),
              child: Divider(height: 20, thickness: 0.5, color: grayColor),
            ),

            CustomWidgetForFillLocationInformation(
              nearbyPlaces: nearByPlaces,
              location: location,
              cityName: cityName,
              lat: lat,
              lon: lon,
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
                          page: BasicPropertyInformationPage2(
                            fullDescription: widget.fullDescription,
                            shortDescription: widget.shortDescription,
                            zipCode: widget.zipCode,
                            propertyType: widget.propertyType,
                            galleryPhoto: widget.galleryPhoto,
                            askingPrice: askingPrice.text,
                            listingType: listingType.text,
                            cityName: cityName.text,
                            location: location.text,
                            lat: double.tryParse(lat.text) ?? 0.0,
                            lon: double.tryParse(lon.text) ?? 0.0,
                            nearByPlaces: nearByPlaces,
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
