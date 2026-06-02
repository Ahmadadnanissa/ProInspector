import 'package:flutter/material.dart';
import 'package:property_inspector/core/app_theme.dart';
import 'package:property_inspector/features/home_feature/presentation/state_management/request_provider.dart';
import 'package:property_inspector/features/home_feature/presentation/widgets/custom_type_for_filter.dart';
import 'package:provider/provider.dart';

class CustomSigleChildScrollView extends StatelessWidget {
  const CustomSigleChildScrollView({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final provider = context.watch<RequestProvider>();

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          SizedBox(width: width * 0.02),

          // PENDING
          InkWell(
            borderRadius: BorderRadius.circular(width * 0.05),
            onTap: () {
              context.read<RequestProvider>().fetchRequests('PENDING');
            },
            child: CustomTypeForFilter(
              name: 'New',
              color: provider.currentFilter == 'PENDING'
                  ? blackColor
                  : const Color(0xffFFDDD2),
              colorFont: provider.currentFilter == 'PENDING'
                  ? Colors.white
                  : blackColor,
            ),
          ),

          SizedBox(width: width * 0.02),

          // IN_PROGRESS
          InkWell(
            borderRadius: BorderRadius.circular(width * 0.05),
            onTap: () {
              context.read<RequestProvider>().fetchRequests('IN_PROGRESS');
            },
            child: CustomTypeForFilter(
              name: 'In Progress',
              color: provider.currentFilter == 'IN_PROGRESS'
                  ? blackColor
                  : greenColor,
              colorFont: provider.currentFilter == 'IN_PROGRESS'
                  ? Colors.white
                  : blackColor,
            ),
          ),

          SizedBox(width: width * 0.02),

          // COMPLETED
          InkWell(
            borderRadius: BorderRadius.circular(width * 0.05),
            onTap: () {
              context.read<RequestProvider>().fetchRequests('COMPLETED');
            },
            child: CustomTypeForFilter(
              name: 'Completed',
              color: provider.currentFilter == 'COMPLETED'
                  ? blackColor
                  : Colors.white,
              colorFont: provider.currentFilter == 'COMPLETED'
                  ? Colors.white
                  : Colors.green,
            ),
          ),

          SizedBox(width: width * 0.02),

          // REJECTED
          InkWell(
            borderRadius: BorderRadius.circular(width * 0.05),
            onTap: () {
              context.read<RequestProvider>().fetchRequests('REJECTED');
            },
            child: CustomTypeForFilter(
              name: 'Rejected',
              color: provider.currentFilter == 'REJECTED'
                  ? blackColor
                  : grayColor,
              colorFont: provider.currentFilter == 'REJECTED'
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
