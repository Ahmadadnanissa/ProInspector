import 'package:flutter/material.dart';
import 'package:property_inspector/core/app_theme.dart';
import 'package:property_inspector/features/home_feature/presentation/widgets/body_details_of_request.dart';
import 'package:property_inspector/features/home_feature/presentation/widgets/custom_app_bar.dart';

class DetailsOfRequest extends StatelessWidget {
  const DetailsOfRequest({super.key, required this.requestId});
  static String id = 'DetailsOfRequest';
  final String requestId;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: primaryColor,
        appBar: CustomAppBar(),
        body: BodyDetailsOfRequest(requestId: requestId),
      ),
    );
  }
}
