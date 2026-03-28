import 'package:flutter/material.dart';
import 'package:property_inspector/core/app_theme.dart';
import 'package:property_inspector/features/home_feature/presentation/widgets/custom_app_bar.dart';
import 'package:property_inspector/features/notification_and_live_chat_feature/presentation/widgets/body_live_chat_page.dart';
import 'package:property_inspector/features/notification_and_live_chat_feature/presentation/widgets/bottom_navigation_bar_for_live_chat_page.dart';

class LiveChatPage extends StatelessWidget {
  const LiveChatPage({super.key});
  static String id = 'LiveChatPage';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: primaryColor,
        appBar: CustomAppBar(),
        body: BodyLiveChatPage(),
        bottomNavigationBar: BottomNavigationBarForLiveChatPage(),
      ),
    );
  }
}
