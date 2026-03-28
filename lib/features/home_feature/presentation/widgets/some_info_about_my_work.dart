import 'package:flutter/material.dart';
import 'package:property_inspector/core/app_theme.dart';
import 'package:property_inspector/features/home_feature/presentation/widgets/custom_container_for_info.dart';

class SomeInfoAboutMyWork extends StatefulWidget {
  const SomeInfoAboutMyWork({super.key});

  @override
  State<SomeInfoAboutMyWork> createState() => _SomeInfoAboutMyWorkState();
}

class _SomeInfoAboutMyWorkState extends State<SomeInfoAboutMyWork> {
  String isSelected = 'new';
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              borderRadius: BorderRadius.circular(width * 0.05),
              onTap: () {
                isSelected = 'new';
                setState(() {});
              },
              child: CustomContainerForInfo(
                name: 'New Requests',
                number: '10',
                color: isSelected == 'new' ? greenColor : Colors.white,
                colorFont: isSelected == 'new' ? Colors.white : blackColor,
              ),
            ),
            InkWell(
              borderRadius: BorderRadius.circular(width * 0.05),
              onTap: () {
                isSelected = 'progress';
                setState(() {});
              },
              child: CustomContainerForInfo(
                name: 'In Progress',
                number: '12',
                color: isSelected == 'progress' ? greenColor : Colors.white,
                colorFont: isSelected == 'progress' ? Colors.white : blackColor,
              ),
            ),
          ],
        ),
        SizedBox(height: width * 0.03),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              borderRadius: BorderRadius.circular(width * 0.05),
              onTap: () {
                isSelected = 'completed';
                setState(() {});
              },
              child: CustomContainerForInfo(
                name: 'Completed',
                number: '17',
                color: isSelected == 'completed' ? greenColor : Colors.white,
                colorFont: isSelected == 'completed'
                    ? Colors.white
                    : Colors.green,
              ),
            ),
            InkWell(
              borderRadius: BorderRadius.circular(width * 0.05),
              onTap: () {
                isSelected = 'Rejected';
                setState(() {});
              },
              child: CustomContainerForInfo(
                name: 'Rejected',
                number: '3',
                color: isSelected == 'Rejected' ? greenColor : Colors.white,
                colorFont: isSelected == 'Rejected' ? Colors.white : Colors.red,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
