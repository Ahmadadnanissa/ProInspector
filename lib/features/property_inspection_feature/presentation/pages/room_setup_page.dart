import 'package:flutter/material.dart';
import 'package:property_inspector/core/app_theme.dart';
import 'package:property_inspector/features/home_feature/presentation/widgets/custom_app_bar.dart';
import 'package:property_inspector/features/property_inspection_feature/presentation/widgets/body_room_set_up.dart';

class RoomSetupPage extends StatelessWidget {
  const RoomSetupPage({super.key});
  static String id = 'RoomSetUp';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: primaryColor,
        appBar: CustomAppBar(),
        body: BodyRoomSetUp(),
      ),
    );
  }
}
