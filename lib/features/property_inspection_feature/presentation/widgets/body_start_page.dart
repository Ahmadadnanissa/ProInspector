import 'package:flutter/material.dart';
import 'package:property_inspector/core/app_theme.dart';
import 'package:property_inspector/core/widgets/navigation_route.dart';
import 'package:property_inspector/features/property_inspection_feature/presentation/pages/basic_property_information_page.dart';
import 'package:property_inspector/features/property_inspection_feature/presentation/widgets/custom_text_form_field.dart';
import 'package:property_inspector/features/property_inspection_feature/presentation/widgets/custom_title.dart';
import 'package:property_inspector/features/property_inspection_feature/presentation/widgets/custom_widget_for_fill_information.dart';
import 'package:property_inspector/features/property_inspection_feature/presentation/widgets/list_of_property_type.dart';
import 'package:property_inspector/features/property_inspection_feature/presentation/widgets/secondary_button.dart';

class BodyStartPage extends StatefulWidget {
  const BodyStartPage({super.key});

  @override
  State<BodyStartPage> createState() => _BodyStartPageState();
}

class _BodyStartPageState extends State<BodyStartPage> {
  final TextEditingController shortDesc = TextEditingController();
  final TextEditingController fullDesc = TextEditingController();
  final TextEditingController zipCode = TextEditingController();
  String type = 'APARTMENT';
  List<String> galleryPhoto = [];
  @override
  void dispose() {
    shortDesc.dispose();
    fullDesc.dispose();
    zipCode.dispose();
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
              title: 'Start Property Inspection',
              subTitle:
                  'Fill in property details and capture all necessary information',
              number: 1,
            ),

            ListOfPropertyType(selectedType: type),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Divider(height: 20, thickness: 0.5, color: grayColor),
            ),
            CustomTextFormField(
              hintText: 'ZipCode',
              maxLines: 1,
              controller: zipCode,
            ),

            Padding(
              padding: const EdgeInsets.all(15),
              child: Divider(height: 20, thickness: 0.5, color: grayColor),
            ),
            CustomWidgetForFillInformation(
              galleryPhoto: galleryPhoto,
              controller1: shortDesc,
              controller2: fullDesc,
              title: 'Description',
              hintText1: 'Short Description(name)',
              description: 'Full Description',
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: SecondaryButton(
                name: 'Continue',
                pushing: () {
                  Navigator.push(
                    context,
                    SlideRight(
                      page: BasicPropertyInformationPage(
                        shortDescription: shortDesc.text,
                        fullDescription: fullDesc.text,
                        propertyType: type,
                        galleryPhoto: galleryPhoto,
                        zipCode: zipCode.text,
                      ),
                    ),
                  );
                },
                isBack: false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
