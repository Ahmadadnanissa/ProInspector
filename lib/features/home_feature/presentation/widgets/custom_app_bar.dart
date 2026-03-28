import 'package:flutter/material.dart';
import 'package:property_inspector/core/app_theme.dart';
import 'package:property_inspector/core/widgets/custom_font.dart';
import 'package:property_inspector/core/widgets/navigation_route.dart';
import 'package:property_inspector/features/notification_and_live_chat_feature/presentation/pages/live_chat_page.dart';
import 'package:property_inspector/features/notification_and_live_chat_feature/presentation/pages/notification_page.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return AppBar(
      backgroundColor: primaryColor,
      title: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            CustomFont(
              name: 'Ahmad Issa',
              fontColor: blackColor,
              fontSize: width * 0.045,
              fontWeight: FontWeight.w600,
            ),
            CustomFont(
              name: 'Property Inspector',
              fontColor: blackColor,
              fontSize: width * 0.03,
            ),
          ],
        ),
      ),

      leading: Padding(
        padding: const EdgeInsets.all(4),
        child: CircleAvatar(
          radius: width * 0.05,
          backgroundImage: AssetImage(
            'assets/images/drew-agGIKYs4mYs-unsplash.jpg',
          ),
        ),
      ),

      actions: [
        InkWell(
          focusColor: primaryColor,
          hoverColor: primaryColor,
          splashColor: primaryColor,
          highlightColor: primaryColor,
          onTap: () {
            Navigator.push(context, SlideRight(page: LiveChatPage()));
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Icon(
              Icons.chat_outlined,
              color: secondaryColor,
              size: width * 0.07,
            ),
          ),
        ),
        InkWell(
          focusColor: primaryColor,
          hoverColor: primaryColor,
          splashColor: primaryColor,
          highlightColor: primaryColor,
          onTap: () {
            Navigator.push(context, SlideRight(page: NotificationPage()));
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Icon(
              Icons.notifications_outlined,
              color: secondaryColor,
              size: width * 0.07,
            ),
          ),
        ),
      ],

      bottom: PreferredSize(
        preferredSize: Size.fromHeight(1),
        child: Container(height: 1, color: Colors.grey.shade400),
      ),
    );
  }
}
