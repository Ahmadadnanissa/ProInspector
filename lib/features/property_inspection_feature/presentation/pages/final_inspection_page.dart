import 'package:flutter/material.dart';
import 'package:property_inspector/core/app_theme.dart';
import 'package:property_inspector/features/home_feature/presentation/widgets/custom_app_bar.dart';
import 'package:property_inspector/features/property_inspection_feature/presentation/widgets/body_final_inspection_page.dart';

class FinalInspectionPage extends StatelessWidget {
  const FinalInspectionPage({super.key});
  static String id = 'FinalInspectionPage';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: primaryColor,
        appBar: CustomAppBar(),
        body: BodyFinalInspectionPage(),
      ),
    );
  }
}
