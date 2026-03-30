import 'package:flutter/material.dart';
import 'package:property_inspector/features/property_inspection_feature/presentation/widgets/custom_title.dart';
import 'package:property_inspector/features/property_inspection_feature/presentation/widgets/secondary_button.dart';

class BodyFinalInspectionPage extends StatelessWidget {
  const BodyFinalInspectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.03),
        child: Column(
          children: [
            CustomTitle(
              title: 'Finalize Inspection',
              subTitle:
                  'Youre almost done! Add a main photo and tell us your final thoughts',
              number: 5,
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
                    name: 'Send Form',
                    pushing: () {},
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
