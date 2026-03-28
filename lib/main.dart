import 'package:flutter/material.dart';
import 'package:property_inspector/features/home_feature/presentation/pages/details_of_request.dart';
import 'package:property_inspector/features/home_feature/presentation/pages/home_page.dart';
import 'package:property_inspector/features/notification_and_live_chat_feature/presentation/pages/live_chat_page.dart';
import 'package:property_inspector/features/notification_and_live_chat_feature/presentation/pages/notification_page.dart';
import 'package:property_inspector/features/property_inspection_feature/presentation/pages/start_page.dart';
import 'package:property_inspector/splash__page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        HomePage.id: (context) => HomePage(),
        SplashPage.id: (context) => SplashPage(),
        DetailsOfRequest.id: (context) => DetailsOfRequest(),
        NotificationPage.id: (context) => NotificationPage(),
        LiveChatPage.id: (context) => LiveChatPage(),
        StartPage.id: (context) => StartPage(),
      },
      debugShowCheckedModeBanner: false,
      initialRoute: HomePage.id,
    );
  }
}
