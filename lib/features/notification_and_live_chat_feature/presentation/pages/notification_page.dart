import 'package:flutter/material.dart';
import 'package:property_inspector/core/app_theme.dart';
import 'package:property_inspector/features/home_feature/presentation/widgets/custom_app_bar.dart';
import 'package:property_inspector/features/notification_and_live_chat_feature/presentation/widgets/body_notification_page.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});
  static String id = 'NotificationPage';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: primaryColor,
        appBar: CustomAppBar(),
        body: BodyNotificationPage(),
      ),
    );
  }
}
