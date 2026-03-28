import 'package:flutter/material.dart';
import 'package:property_inspector/core/app_theme.dart';
import 'package:property_inspector/core/widgets/custom_font.dart';
import 'package:property_inspector/features/notification_and_live_chat_feature/presentation/widgets/body_of_notification.dart';
import 'package:property_inspector/features/notification_and_live_chat_feature/presentation/widgets/custom_botton_for_notification_page.dart';
import 'package:property_inspector/features/notification_and_live_chat_feature/presentation/widgets/filter_icon.dart';

class BodyNotificationPage extends StatelessWidget {
  const BodyNotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: width * 0.04,
              bottom: width * 0.04,
              left: width * 0.04,
              right: width * 0.04,
            ),
            child: Row(
              children: [
                CustomBottonForNotificationPage(name: 'All'),
                SizedBox(width: width * 0.03),
                CustomBottonForNotificationPage(name: 'Unread'),
                Spacer(),
                FilterIcon(),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: width * 0.04, bottom: width * 0.02),
            child: CustomFont(
              name: 'Today',
              fontColor: blackColor,
              fontSize: width * 0.05,
              fontWeight: FontWeight.w600,
            ),
          ),
          BodyOfNotification(
            title: 'New Property Added',
            subTitle:
                ' A new property matching your preferences is now available',
            image: 'assets/images/don-kaveen-NFbwes_e-jI-unsplash.jpg',
          ),

          BodyOfNotification(
            title: 'Property Near You',
            subTitle: 'A new listing was added in your area',
            image: 'assets/images/jay-solomon-8lU54uEl8Ok-unsplash.jpg',
          ),
          SizedBox(height: width * 0.06),
          Padding(
            padding: EdgeInsets.only(left: width * 0.04, bottom: width * 0.02),
            child: CustomFont(
              name: 'Yesterday',
              fontColor: blackColor,
              fontSize: width * 0.05,
              fontWeight: FontWeight.w600,
            ),
          ),
          BodyOfNotification(
            title: ' Price Drop',
            subTitle: 'The price of a property you saved has been reduced',
            image:
                'assets/images/lotus-design-n-print-0sDzRgrN_pI-unsplash.jpg',
          ),

          BodyOfNotification(
            title: 'New Offer Available',
            subTitle: 'A special discount is now available on this property',
            image: 'assets/images/spacejoy-KJUGhE9ojro-unsplash.jpg',
          ),
        ],
      ),
    );
  }
}
