import 'package:flutter/material.dart';
import 'package:property_inspector/features/home_feature/presentation/widgets/body_schedule_page.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key});

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BodySchedulePage());
  }
}
