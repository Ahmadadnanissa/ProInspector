import 'package:flutter/material.dart';
import 'package:property_inspector/core/app_theme.dart';
import 'package:property_inspector/core/widgets/button.dart';
import 'package:property_inspector/core/widgets/custom_font.dart';
import 'package:property_inspector/core/widgets/navigation_route.dart';
import 'package:property_inspector/features/home_feature/data/models/request_model.dart';
import 'package:property_inspector/features/home_feature/presentation/pages/details_of_request.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key, required this.request});
  final RequestModel request;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.03),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.2),
              blurRadius: 10,
              offset: Offset(0, 3),
            ),
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(width * 0.05),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: width * 0.03,
                horizontal: width * 0.04,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(width * 0.03),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        request.clientImage,
                        // 'assets/images/person (1).png'
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      CustomFont(
                        name: request.clientName,
                        fontColor: blackColor,
                        fontSize: width * 0.05,
                        fontWeight: FontWeight.w600,
                      ),
                      CustomFont(
                        name: request.propertyType,
                        fontColor: grayColor,
                        fontSize: width * 0.035,
                      ),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xffE29578),
                      borderRadius: BorderRadius.circular(width * 0.01),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: CustomFont(
                        name: request.status,
                        fontColor: blackColor,
                        fontSize: width * 0.04,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.04),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      CustomFont(
                        name: 'Expected Price',
                        fontColor: grayColor,
                        fontSize: width * 0.04,
                      ),
                      CustomFont(
                        name: '${request.expectedPrice}\$',
                        fontColor: blackColor,
                        fontSize: width * 0.05,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      CustomFont(
                        name: 'Date',
                        fontColor: grayColor,
                        fontSize: width * 0.04,
                      ),
                      CustomFont(
                        name: request.date,
                        fontColor: grayColor,
                        fontSize: width * 0.04,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: width * 0.06),
            PrimaryButton(
              name: 'See Details',
              pushing: () {
                Navigator.push(context, SlideRight(page: DetailsOfRequest()));
              },
            ),
            SizedBox(height: width * 0.03),
          ],
        ),
      ),
    );
  }
}
