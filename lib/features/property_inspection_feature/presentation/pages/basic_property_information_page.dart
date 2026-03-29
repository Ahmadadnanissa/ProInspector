import 'package:flutter/material.dart';
import 'package:property_inspector/core/app_theme.dart';
import 'package:property_inspector/features/home_feature/presentation/widgets/custom_app_bar.dart';
import 'package:property_inspector/features/property_inspection_feature/presentation/widgets/body_basic_property_information_page.dart';

class BasicPropertyInformationPage extends StatelessWidget {
  const BasicPropertyInformationPage({super.key});

  static String id = 'BasicPropertyInformationPage';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: primaryColor,
        appBar: CustomAppBar(),
        body: BodyBasicPropertyInformationPage(),
      ),
    );
  }
}
