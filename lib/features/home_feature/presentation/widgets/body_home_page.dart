import 'package:flutter/material.dart';
import 'package:property_inspector/core/app_theme.dart';
import 'package:property_inspector/core/widgets/custom_font.dart';
import 'package:property_inspector/features/home_feature/presentation/state_management/request_provider.dart';
import 'package:property_inspector/features/home_feature/presentation/widgets/custom_card.dart';
import 'package:property_inspector/features/home_feature/presentation/widgets/custom_sigle_child_scroll_view.dart';
import 'package:property_inspector/features/home_feature/presentation/widgets/some_info_about_my_work.dart';
import 'package:provider/provider.dart';

class BodyHomePage extends StatelessWidget {
  const BodyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: width * 0.1),

              Padding(
                padding: EdgeInsets.only(left: width * 0.03),
                child: CustomFont(
                  name: 'Monday, March 23',
                  fontColor: grayColor,
                  fontSize: width * 0.035,
                ),
              ),

              Padding(
                padding: EdgeInsets.only(left: width * 0.03),
                child: CustomFont(
                  name: 'Good Morning, Ahmad',
                  fontColor: blackColor,
                  fontSize: width * 0.07,
                  fontWeight: FontWeight.w600,
                ),
              ),

              SizedBox(height: width * 0.08),

              SomeInfoAboutMyWork(),

              SizedBox(height: width * 0.02),

              Divider(height: 20, color: Colors.grey.shade400, thickness: 1),
            ],
          ),
        ),

        SliverPersistentHeader(
          pinned: true,
          delegate: _StickyHeader(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: width * 0.02),
              child: CustomSigleChildScrollView(),
            ),
          ),
        ),

        Consumer<RequestProvider>(
          builder: (context, provider, child) {
            // 🟢 Loading
            if (provider.isLoading) {
              return SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: width * 0.1),
                  child: Center(
                    child: SizedBox(
                      width: 25,
                      height: 25,
                      child: CircularProgressIndicator(
                        strokeWidth: 2.5,
                        color: secondaryColor,
                      ),
                    ),
                  ),
                ),
              );
            }

            // 🔴 Empty state
            if (provider.requests.isEmpty) {
              return SliverToBoxAdapter(
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.all(width * 0.1),
                    child: CustomFont(
                      name: "No requests found",
                      fontColor: grayColor,
                      fontSize: width * 0.045,
                    ),
                  ),
                ),
              );
            }

            // 🟢 Data
            return SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                final request = provider.requests[index];

                return Padding(
                  padding: EdgeInsets.symmetric(vertical: width * 0.02),
                  child: CustomCard(request: request),
                );
              }, childCount: provider.requests.length),
            );
          },
        ),
      ],
    );
  }
}

class _StickyHeader extends SliverPersistentHeaderDelegate {
  final Widget child;

  _StickyHeader({required this.child});

  @override
  double get minExtent => 62;
  @override
  double get maxExtent => 62;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return child;
  }

  @override
  bool shouldRebuild(covariant _StickyHeader oldDelegate) {
    return false;
  }
}
