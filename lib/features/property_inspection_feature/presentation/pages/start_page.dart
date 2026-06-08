import 'package:flutter/material.dart';
import 'package:property_inspector/core/app_theme.dart';
import 'package:property_inspector/features/home_feature/presentation/widgets/custom_app_bar.dart';
import 'package:property_inspector/features/property_inspection_feature/presentation/widgets/body_start_page.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key, required this.requestId});
  final String requestId;

  static String id = 'StartPage';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: primaryColor,
        appBar: CustomAppBar(),
        body: BodyStartPage(requestId: requestId),
      ),
    );
  }
}
