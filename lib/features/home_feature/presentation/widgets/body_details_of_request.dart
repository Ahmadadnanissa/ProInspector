import 'package:flutter/material.dart';
import 'package:property_inspector/core/app_theme.dart';
import 'package:property_inspector/core/widgets/button.dart';
import 'package:property_inspector/core/widgets/custom_font.dart';
import 'package:property_inspector/core/widgets/navigation_route.dart';
import 'package:property_inspector/features/home_feature/presentation/widgets/custom_image.dart';
import 'package:property_inspector/features/home_feature/presentation/widgets/custom_widget_for_more_details.dart';
import 'package:property_inspector/features/home_feature/presentation/widgets/list_of_more_details.dart';
import 'package:property_inspector/features/property_inspection_feature/presentation/pages/start_page.dart';

class BodyDetailsOfRequest extends StatelessWidget {
  const BodyDetailsOfRequest({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.03),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: width * 0.05),
            CustomFont(
              name: 'Review Details',
              fontColor: secondaryColor,
              fontSize: width * 0.07,
              fontWeight: FontWeight.w600,
            ),
            SizedBox(height: width * 0.06),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  CustomImage(
                    image:
                        'assets/images/john-fornander-y3_AHHrxUBY-unsplash.jpg',
                  ),
                  CustomImage(
                    image: 'assets/images/jay-solomon-8lU54uEl8Ok-unsplash.jpg',
                  ),
                  CustomImage(
                    image: 'assets/images/don-kaveen-NFbwes_e-jI-unsplash.jpg',
                  ),
                  CustomImage(
                    image:
                        'assets/images/lotus-design-n-print-0sDzRgrN_pI-unsplash.jpg',
                  ),
                  CustomImage(
                    image: 'assets/images/spacejoy-KJUGhE9ojro-unsplash.jpg',
                  ),
                ],
              ),
            ),
            SizedBox(height: width * 0.03),

            Padding(
              padding: EdgeInsets.symmetric(vertical: width * 0.03),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomFont(
                        name: 'Mountain View Villa',
                        fontColor: blackColor,
                        fontSize: width * 0.05,
                        fontWeight: FontWeight.bold,
                      ),
                      CustomFont(
                        name: 'Villa',
                        fontColor: Color(0xff5F6264),
                        fontSize: width * 0.035,
                      ),
                    ],
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomFont(
                        name: '\$120.000',
                        fontColor: blackColor,
                        fontSize: width * 0.05,
                        fontWeight: FontWeight.bold,
                      ),
                      CustomFont(
                        name: 'For Sale',
                        // widget.type
                        fontColor: Color(0xff5F6264),
                        fontSize: width * 0.035,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            ListOfMoreDetails(numberOfPath: 4, numberOfRoom: 5, sqft: 300),
            SizedBox(height: width * 0.05),
            CustomFont(
              name: 'Mor Details',
              fontColor: blackColor,
              fontSize: width * 0.05,
              fontWeight: FontWeight.w600,
            ),
            SizedBox(height: width * 0.03),
            CustomWidgetForMoreDetails(detail: 'Parking', info: 'Available'),
            CustomWidgetForMoreDetails(
              detail: 'Outdoor',
              info: 'Yes(Garden,Terrace)',
            ),
            CustomWidgetForMoreDetails(
              detail: 'Furnishing',
              info: 'fully Furnished',
            ),
            CustomWidgetForMoreDetails(detail: 'Heating', info: 'Available'),
            CustomWidgetForMoreDetails(
              detail: 'swimming pool',
              info: 'Available',
            ),

            SizedBox(height: width * 0.04),
            CustomFont(
              name: 'Location',
              fontColor: blackColor,
              fontSize: width * 0.05,
              fontWeight: FontWeight.w600,
            ),
            SizedBox(height: width * 0.04),
            Row(
              children: [
                Container(
                  width: width * 0.4,
                  height: width * 0.25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(width * 0.04),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(width * 0.04),
                    child: Image.asset(
                      'assets/images/map_Image.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: width * 0.02),
                SizedBox(
                  width: width * 0.45,
                  child: Text(
                    'Al-Qadmous, Tartous, Syria',
                    style: TextStyle(
                      color: Color(0xff5F6264),
                      fontSize: width * 0.04,
                      fontFamily: fontFamily,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: width * 0.08),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                PrimaryButton(
                  name: 'New Form',
                  pushing: () {
                    Navigator.push(context, SlideRight(page: StartPage()));
                  },
                ),
                PrimaryButton(
                  name: 'chat with Client',
                  color: Color(0xffE29578),
                  pushing: () {},
                ),
              ],
            ),
            SizedBox(height: width * 0.04),
          ],
        ),
      ),
    );
  }
}
