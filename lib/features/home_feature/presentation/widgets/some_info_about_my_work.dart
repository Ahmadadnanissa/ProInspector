import 'package:flutter/material.dart';
import 'package:property_inspector/core/app_theme.dart';
import 'package:property_inspector/features/home_feature/presentation/state_management/request_stats_provider.dart';
import 'package:property_inspector/features/home_feature/presentation/widgets/custom_container_for_info.dart';
import 'package:provider/provider.dart';

class SomeInfoAboutMyWork extends StatelessWidget {
  const SomeInfoAboutMyWork({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<RequestStatsProvider>();
    double width = MediaQuery.of(context).size.width;

    if (provider.isLoading || provider.stats == null) {
      return Center(
        child: SizedBox(
          width: 20,
          height: 20,
          child: CircularProgressIndicator(strokeWidth: 2),
        ),
      );
    }
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomContainerForInfo(
              name: 'New Requests',
              number: provider.stats!.newCount.toString(),
              color: greenColor,
              colorFont: Colors.white,
            ),
            CustomContainerForInfo(
              name: 'In Progress',
              number: provider.stats!.progressCount.toString(),
              color: Colors.white,
              colorFont: blackColor,
            ),
          ],
        ),
        SizedBox(height: width * 0.03),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomContainerForInfo(
              name: 'Completed',
              number: provider.stats!.completedCount.toString(),
              color: Colors.white,
              colorFont: Colors.green,
            ),
            CustomContainerForInfo(
              name: 'Rejected',
              number: provider.stats!.rejectedCount.toString(),
              color: Colors.white,
              colorFont: Colors.red,
            ),
          ],
        ),
      ],
    );
  }
}
