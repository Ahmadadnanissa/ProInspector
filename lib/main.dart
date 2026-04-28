import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:property_inspector/features/home_feature/data/datasources/request_reomte_data_source.dart';
import 'package:property_inspector/features/home_feature/data/datasources/request_stats_reomte_data_source.dart';
import 'package:property_inspector/features/home_feature/data/models/request_model.dart';
import 'package:property_inspector/features/home_feature/domain/repository/request_repository_impl.dart';
import 'package:property_inspector/features/home_feature/domain/repository/request_stats_repository_impl.dart';
import 'package:property_inspector/features/home_feature/presentation/pages/details_of_request.dart';
import 'package:property_inspector/features/home_feature/presentation/pages/home_page.dart';
import 'package:property_inspector/features/home_feature/presentation/state_management/request_provider.dart';
import 'package:property_inspector/features/home_feature/presentation/state_management/request_stats_provider.dart';
import 'package:property_inspector/features/notification_and_live_chat_feature/data/datasources/notification_remote.dart';
import 'package:property_inspector/features/notification_and_live_chat_feature/data/repositories/notification_impl.dart';
import 'package:property_inspector/features/notification_and_live_chat_feature/presentation/pages/notification_page.dart';
import 'package:property_inspector/features/notification_and_live_chat_feature/presentation/provider_state_managment/notification_provider.dart';
import 'package:property_inspector/features/property_inspection_feature/presentation/pages/basic_property_information_page.dart';
import 'package:property_inspector/features/property_inspection_feature/presentation/pages/basic_property_information_page2.dart';
import 'package:property_inspector/features/property_inspection_feature/presentation/pages/final_inspection_page.dart';
import 'package:property_inspector/features/property_inspection_feature/presentation/pages/room_setup_page.dart';
import 'package:property_inspector/features/property_inspection_feature/presentation/pages/start_page.dart';
import 'package:property_inspector/splash__page.dart';
import 'package:provider/provider.dart';

void main() {
  final remote = RequestRemoteDataSource(http.Client());
  final repo = RequestRepositoryImpl(remote);
  final remote2 = RequestStatsRemoteDataSource(http.Client());
  final repo2 = RequestStatsRepositoryImpl(remote2);
  final remoteN = NotificationRemoteDataSource(http.Client());
  final repoN = NotificationRepositoryImpl(remoteN);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => RequestProvider(repo)),
        ChangeNotifierProvider(create: (_) => NotificationProvider(repoN)),
        ChangeNotifierProvider(
          create: (_) => RequestStatsProvider(repo2)..fetchStats(),
        ),
      ],
      child: const MyApp(),
    ),
  );
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
        StartPage.id: (context) => StartPage(),
        RoomSetupPage.id: (context) => RoomSetupPage(),
        FinalInspectionPage.id: (context) => FinalInspectionPage(),
        BasicPropertyInformationPage.id: (context) =>
            BasicPropertyInformationPage(),
        BasicPropertyInformationPage2.id: (context) =>
            BasicPropertyInformationPage2(),
      },
      debugShowCheckedModeBanner: false,
      initialRoute: HomePage.id,
    );
  }
}
