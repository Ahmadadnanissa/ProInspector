import 'package:flutter/material.dart';
import 'package:property_inspector/core/app_theme.dart';
import 'package:property_inspector/features/home_feature/presentation/widgets/custom_type_for_filter.dart';

class CustomSigleChildScrollView extends StatefulWidget {
  const CustomSigleChildScrollView({super.key});

  @override
  State<CustomSigleChildScrollView> createState() =>
      _CustomSigleChildScrollViewState();
}

class _CustomSigleChildScrollViewState
    extends State<CustomSigleChildScrollView> {
  String isSelected = 'new';

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          SizedBox(width: width * 0.02),
          InkWell(
            borderRadius: BorderRadius.circular(width * 0.05),
            onTap: () {
              isSelected = 'new';
              setState(() {});
            },
            child: CustomTypeForFilter(
              name: 'New',
              color: isSelected == 'new' ? blackColor : Color(0xffFFDDD2),
              colorFont: isSelected == 'new' ? Colors.white : blackColor,
            ),
          ),
          SizedBox(width: width * 0.02),
          InkWell(
            borderRadius: BorderRadius.circular(width * 0.05),
            onTap: () {
              isSelected = 'progress';
              setState(() {});
            },
            child: CustomTypeForFilter(
              name: 'In Progress',
              color: isSelected == 'progress' ? blackColor : greenColor,
              colorFont: isSelected == 'progress' ? Colors.white : blackColor,
            ),
          ),
          SizedBox(width: width * 0.02),
          InkWell(
            borderRadius: BorderRadius.circular(width * 0.05),
            onTap: () {
              isSelected = 'completed';
              setState(() {});
            },
            child: CustomTypeForFilter(
              name: 'Completed',
              color: isSelected == 'completed' ? blackColor : Colors.white,
              colorFont: isSelected == 'completed'
                  ? Colors.white
                  : Colors.green,
            ),
          ),
          SizedBox(width: width * 0.02),
          InkWell(
            borderRadius: BorderRadius.circular(width * 0.05),
            onTap: () {
              isSelected = 'Rejected';
              setState(() {});
            },
            child: CustomTypeForFilter(
              name: 'Rejected',
              color: isSelected == 'Rejected' ? blackColor : grayColor,
              colorFont: isSelected == 'Rejected' ? Colors.white : Colors.red,
            ),
          ),
          SizedBox(width: width * 0.02),
        ],
      ),
    );
  }
}
