import 'package:flutter/material.dart';
import 'package:property_inspector/core/widgets/navigation_route.dart';
import 'package:property_inspector/features/property_inspection_feature/presentation/pages/final_inspection_page.dart';
import 'package:property_inspector/features/property_inspection_feature/presentation/widgets/custom_title.dart';
import 'package:property_inspector/features/property_inspection_feature/presentation/widgets/custom_widget_for_add_room.dart';
import 'package:property_inspector/features/property_inspection_feature/presentation/widgets/secondary_button.dart';

class BodyRoomSetUp extends StatelessWidget {
  const BodyRoomSetUp({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.03),
        child: Column(
          children: [
            CustomTitle(
              title: 'Room Setup',
              subTitle:
                  'Select Room Type and enter details for the inspection report',
              number: 4,
            ),

            CustomWidgetForAddRoom(),

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
                        SlideRight(page: FinalInspectionPage()),
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
