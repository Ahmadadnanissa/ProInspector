import 'package:flutter/material.dart';
import 'package:property_inspector/core/app_theme.dart';
import 'package:property_inspector/features/property_inspection_feature/presentation/widgets/custom_container_for_evaluate.dart';

class RowForEvaluatedWidget extends StatefulWidget {
  const RowForEvaluatedWidget({super.key});

  @override
  State<RowForEvaluatedWidget> createState() => _RowForEvaluatedWidgetState();
}

class _RowForEvaluatedWidgetState extends State<RowForEvaluatedWidget> {
  String isSelected = 'avg';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 48),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(5),
            onTap: () {
              isSelected = 'avg';
              setState(() {});
            },
            child: CustomContainerForEvaluate(
              name: 'Average',
              color: isSelected == 'avg' ? blackColor : greenColor,
              colorFont: isSelected == 'avg' ? Colors.white : blackColor,
            ),
          ),
          InkWell(
            borderRadius: BorderRadius.circular(5),
            onTap: () {
              isSelected = 'exc';
              setState(() {});
            },
            child: CustomContainerForEvaluate(
              name: 'Excellent',
              color: isSelected == 'exc' ? blackColor : greenColor,
              colorFont: isSelected == 'exc' ? Colors.white : blackColor,
            ),
          ),
          InkWell(
            borderRadius: BorderRadius.circular(5),
            onTap: () {
              isSelected = 'good';
              setState(() {});
            },
            child: CustomContainerForEvaluate(
              name: 'Good',
              color: isSelected == 'good' ? blackColor : greenColor,
              colorFont: isSelected == 'good' ? Colors.white : blackColor,
            ),
          ),
        ],
      ),
    );
  }
}
