import 'package:flutter/material.dart';
import 'package:property_inspector/core/app_theme.dart';
import 'package:property_inspector/core/widgets/custom_font.dart';
import 'package:property_inspector/features/property_inspection_feature/presentation/widgets/propery_type_check_in_filter.dart';

class ListOfPropertyType extends StatefulWidget {
  const ListOfPropertyType({super.key});

  @override
  State<ListOfPropertyType> createState() => _ListOfPropertyTypeState();
}

class _ListOfPropertyTypeState extends State<ListOfPropertyType> {
  String selectedType = 'Apartment';
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: width * 0.08, bottom: width * 0.04),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomFont(
                name: 'Select Property Type',
                fontColor: blackColor,
                fontSize: width * 0.05,
                fontWeight: FontWeight.w600,
              ),
            ],
          ),
        ),
        InkWell(
          borderRadius: BorderRadius.circular(width * 0.03),
          onTap: () {
            selectedType = 'Apartment';
            setState(() {});
          },
          child: ProperyTypeCheckInFilter(
            image: 'assets/images/Building.png',
            type: 'Apartment',
            isSelected: selectedType == 'Apartment' ? true : false,
          ),
        ),
        SizedBox(height: width * 0.02),
        InkWell(
          borderRadius: BorderRadius.circular(width * 0.03),
          onTap: () {
            selectedType = 'Villa';
            setState(() {});
          },
          child: ProperyTypeCheckInFilter(
            image: 'assets/images/House With a Garden.png',
            type: 'Villa',
            isSelected: selectedType == 'Villa' ? true : false,
          ),
        ),
        SizedBox(height: width * 0.02),
        InkWell(
          borderRadius: BorderRadius.circular(width * 0.03),
          onTap: () {
            selectedType = 'House';
            setState(() {});
          },
          child: ProperyTypeCheckInFilter(
            image: 'assets/images/Home.png',
            type: 'House',
            isSelected: selectedType == 'House' ? true : false,
          ),
        ),
        SizedBox(height: width * 0.02),
        InkWell(
          borderRadius: BorderRadius.circular(width * 0.03),
          onTap: () {
            selectedType = 'office';
            setState(() {});
          },
          child: ProperyTypeCheckInFilter(
            image: 'assets/images/Office.png',
            type: 'office',
            isSelected: selectedType == 'office' ? true : false,
          ),
        ),
        SizedBox(height: width * 0.02),
      ],
    );
  }
}
