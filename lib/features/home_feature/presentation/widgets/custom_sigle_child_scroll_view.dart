import 'package:flutter/material.dart';
import 'package:property_inspector/core/app_theme.dart';
import 'package:property_inspector/features/home_feature/presentation/state_management/request_provider.dart';
import 'package:property_inspector/features/home_feature/presentation/widgets/custom_type_for_filter.dart';
import 'package:provider/provider.dart';

class CustomSigleChildScrollView extends StatelessWidget {
  const CustomSigleChildScrollView({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    final provider = context.watch<RequestProvider>();
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          SizedBox(width: width * 0.02),
          InkWell(
            borderRadius: BorderRadius.circular(width * 0.05),
            onTap: () {
              context.read<RequestProvider>().fetchRequests('new');
            },
            child: CustomTypeForFilter(
              name: 'New',
              color: provider.currentFilter == 'new'
                  ? blackColor
                  : Color(0xffFFDDD2),
              colorFont: provider.currentFilter == 'new'
                  ? Colors.white
                  : blackColor,
            ),
          ),
          SizedBox(width: width * 0.02),
          InkWell(
            borderRadius: BorderRadius.circular(width * 0.05),
            onTap: () {
              context.read<RequestProvider>().fetchRequests('progress');
            },
            child: CustomTypeForFilter(
              name: 'In Progress',
              color: provider.currentFilter == 'progress'
                  ? blackColor
                  : greenColor,
              colorFont: provider.currentFilter == 'progress'
                  ? Colors.white
                  : blackColor,
            ),
          ),
          SizedBox(width: width * 0.02),
          InkWell(
            borderRadius: BorderRadius.circular(width * 0.05),
            onTap: () {
              context.read<RequestProvider>().fetchRequests('completed');
            },
            child: CustomTypeForFilter(
              name: 'Completed',
              color: provider.currentFilter == 'completed'
                  ? blackColor
                  : Colors.white,
              colorFont: provider.currentFilter == 'completed'
                  ? Colors.white
                  : Colors.green,
            ),
          ),
          SizedBox(width: width * 0.02),
          InkWell(
            borderRadius: BorderRadius.circular(width * 0.05),
            onTap: () {
              context.read<RequestProvider>().fetchRequests('rejected');
            },
            child: CustomTypeForFilter(
              name: 'Rejected',
              color: provider.currentFilter == 'Rejected'
                  ? blackColor
                  : grayColor,
              colorFont: provider.currentFilter == 'Rejected'
                  ? Colors.white
                  : Colors.red,
            ),
          ),
          SizedBox(width: width * 0.02),
        ],
      ),
    );
  }
}
