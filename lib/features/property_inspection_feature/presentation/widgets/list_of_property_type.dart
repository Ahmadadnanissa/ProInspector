import 'package:flutter/material.dart';
import 'package:property_inspector/core/app_theme.dart';
import 'package:property_inspector/core/widgets/custom_font.dart';
import 'package:property_inspector/features/property_inspection_feature/presentation/widgets/propery_type_check_in_filter.dart';

// ignore: must_be_immutable
class ListOfPropertyType extends StatefulWidget {
  ListOfPropertyType({super.key, required this.selectedType});
  String selectedType;
  @override
  State<ListOfPropertyType> createState() => _ListOfPropertyTypeState();
}

class _ListOfPropertyTypeState extends State<ListOfPropertyType> {
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
            widget.selectedType = 'APARTMENT';
            setState(() {});
          },
          child: ProperyTypeCheckInFilter(
            icon: Icons.apartment,
            type: 'Apartment',
            isSelected: widget.selectedType == 'APARTMENT',
          ),
        ),

        SizedBox(height: width * 0.02),

        InkWell(
          borderRadius: BorderRadius.circular(width * 0.03),
          onTap: () {
            widget.selectedType = 'VILLA';
            setState(() {});
          },
          child: ProperyTypeCheckInFilter(
            icon: Icons.villa,
            type: 'Villa',
            isSelected: widget.selectedType == 'VILLA',
          ),
        ),

        SizedBox(height: width * 0.02),

        InkWell(
          borderRadius: BorderRadius.circular(width * 0.03),
          onTap: () {
            widget.selectedType = 'HOUSE';
            setState(() {});
          },
          child: ProperyTypeCheckInFilter(
            icon: Icons.home_outlined,
            type: 'House',
            isSelected: widget.selectedType == 'HOUSE',
          ),
        ),

        SizedBox(height: width * 0.02),

        InkWell(
          borderRadius: BorderRadius.circular(width * 0.03),
          onTap: () {
            widget.selectedType = 'HALL';
            setState(() {});
          },
          child: ProperyTypeCheckInFilter(
            icon: Icons.business_center_outlined,
            type: 'Hall',
            isSelected: widget.selectedType == 'HALL',
          ),
        ),

        SizedBox(height: width * 0.02),

        InkWell(
          borderRadius: BorderRadius.circular(width * 0.03),
          onTap: () {
            widget.selectedType = 'STORE';
            setState(() {});
          },
          child: ProperyTypeCheckInFilter(
            icon: Icons.storefront_outlined,
            type: 'Store',
            isSelected: widget.selectedType == 'STORE',
          ),
        ),
      ],
    );
  }
}
