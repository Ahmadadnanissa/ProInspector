import 'package:flutter/material.dart';
import 'package:property_inspector/core/app_theme.dart';
import 'package:property_inspector/features/notification_and_live_chat_feature/presentation/widgets/custom_text_field_for_send_message.dart';

class BottomNavigationBarForLiveChatPage extends StatelessWidget {
  const BottomNavigationBarForLiveChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Icon(Icons.image, size: width * 0.075, color: secondaryColor),
          SizedBox(width: width * 0.02),
          Icon(Icons.mic, size: width * 0.075, color: secondaryColor),
          SizedBox(width: width * 0.02),
          CustomTextFieldForSendMessage(),
          SizedBox(width: width * 0.02),
          Icon(Icons.send, size: width * 0.075, color: secondaryColor),
        ],
      ),
    );
  }
}
