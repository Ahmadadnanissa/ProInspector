import 'package:flutter/material.dart';
import 'package:property_inspector/core/app_theme.dart';
import 'package:property_inspector/core/widgets/button.dart';
import 'package:property_inspector/core/widgets/custom_font.dart';
import 'package:property_inspector/core/widgets/navigation_route.dart';
import 'package:property_inspector/features/home_feature/presentation/pages/Schedule_page.dart';
import 'package:property_inspector/features/home_feature/presentation/pages/property_on_map_page.dart';
import 'package:property_inspector/features/home_feature/presentation/state_management/request_details_provider.dart';
import 'package:property_inspector/features/home_feature/presentation/widgets/custom_image.dart';
import 'package:property_inspector/features/home_feature/presentation/widgets/custom_widget_for_more_details.dart';
import 'package:property_inspector/features/home_feature/presentation/widgets/list_of_more_details.dart';
import 'package:property_inspector/features/property_inspection_feature/presentation/pages/start_page.dart';
import 'package:provider/provider.dart';

class BodyDetailsOfRequest extends StatefulWidget {
  const BodyDetailsOfRequest({super.key, required this.requestId});
  final String requestId;

  @override
  State<BodyDetailsOfRequest> createState() => _BodyDetailsOfRequestState();
}

class _BodyDetailsOfRequestState extends State<BodyDetailsOfRequest> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      context.read<RequestDetailsProvider>().fetchDetails(widget.requestId);
    });
  }

  String getFeatureName(String key) {
    switch (key) {
      case 'heating':
        return 'Heating';

      case 'parking':
        return 'Parking';

      case 'furnished':
        return 'Furnished';

      case 'swimming_pool':
        return 'Swimming Pool';

      default:
        return key;
    }
  }

  String getRequestType(String type) {
    switch (type) {
      case 'SELL':
        return 'For Sale';

      case 'RENT':
        return 'For Rent';

      default:
        return type;
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Consumer<RequestDetailsProvider>(
      builder: (context, provider, child) {
        if (provider.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (provider.error != null) {
          return Center(child: Text("Error: ${provider.error}"));
        }

        final data = provider.data;

        if (data == null) {
          return const SizedBox();
        }

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

                /// 🔥 Images
                if (data.images.isNotEmpty)
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: data.images
                          .map((img) => CustomImage(image: img))
                          .toList(),
                    ),
                  ),

                SizedBox(height: width * 0.03),

                /// 🔥 Title + Price
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomFont(
                          name: data.title,
                          fontColor: blackColor,
                          fontSize: width * 0.05,
                          fontWeight: FontWeight.bold,
                        ),
                        CustomFont(
                          name: data.type,
                          fontColor: Color(0xff5F6264),
                          fontSize: width * 0.035,
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomFont(
                          name: "\$${data.price.toInt()}",
                          fontColor: blackColor,
                          fontSize: width * 0.05,
                          fontWeight: FontWeight.bold,
                        ),
                        CustomFont(
                          name: getRequestType(data.status),
                          fontColor: Color(0xff5F6264),
                          fontSize: width * 0.035,
                        ),
                      ],
                    ),
                  ],
                ),

                ListOfMoreDetails(
                  numberOfPath: data.baths,
                  numberOfRoom: data.rooms,
                  sqft: data.sqft,
                ),

                SizedBox(height: width * 0.05),

                CustomFont(
                  name: 'More Details',
                  fontColor: blackColor,
                  fontSize: width * 0.05,
                  fontWeight: FontWeight.w600,
                ),

                SizedBox(height: width * 0.03),

                /// 🔥 Features dynamic
                ...data.features.entries.map(
                  (e) => CustomWidgetForMoreDetails(
                    detail: getFeatureName(e.key),
                    info: e.value ? "Available" : "Not Available",
                  ),
                ),

                SizedBox(height: width * 0.04),

                /// 🔥 Location
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          SlideRight(
                            page: PropertyOnMap(
                              propertyLat: data.latitude,
                              propertyLng: data.longitude,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        width: width * 0.4,
                        height: width * 0.25,
                        child: Image.asset(
                          'assets/images/map_Image.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(width: width * 0.02),
                    Expanded(
                      child: Text(
                        data.location,
                        style: TextStyle(fontSize: width * 0.04),
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
                      name: 'Set a date',
                      pushing: () {
                        Navigator.push(
                          context,
                          SlideRight(page: SchedulePage()),
                        );
                      },
                    ),
                  ],
                ),

                SizedBox(height: width * 0.04),
              ],
            ),
          ),
        );
      },
    );
  }
}
