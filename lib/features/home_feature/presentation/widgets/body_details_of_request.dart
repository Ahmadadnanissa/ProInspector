import 'package:flutter/material.dart';
import 'package:property_inspector/core/app_theme.dart';
import 'package:property_inspector/core/widgets/button.dart';
import 'package:property_inspector/core/widgets/custom_font.dart';
import 'package:property_inspector/core/widgets/navigation_route.dart';
import 'package:property_inspector/features/home_feature/presentation/state_management/request_details_provider.dart';
import 'package:property_inspector/features/home_feature/presentation/widgets/custom_image.dart';
import 'package:property_inspector/features/home_feature/presentation/widgets/custom_widget_for_more_details.dart';
import 'package:property_inspector/features/home_feature/presentation/widgets/list_of_more_details.dart';
import 'package:property_inspector/features/property_inspection_feature/presentation/pages/start_page.dart';
import 'package:provider/provider.dart';

class BodyDetailsOfRequest extends StatefulWidget {
  const BodyDetailsOfRequest({super.key});

  @override
  State<BodyDetailsOfRequest> createState() => _BodyDetailsOfRequestState();
}

class _BodyDetailsOfRequestState extends State<BodyDetailsOfRequest> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      if (context.mounted) {
        context.read<RequestDetailsProvider>().fetchDetails(1);
      }
    });
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
                          name: "\$${data.price}",
                          fontColor: blackColor,
                          fontSize: width * 0.05,
                          fontWeight: FontWeight.bold,
                        ),
                        CustomFont(
                          name: data.status,
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
                    detail: e.key,
                    info: e.value ? "Available" : "Not Available",
                  ),
                ),

                SizedBox(height: width * 0.04),

                /// 🔥 Location
                Row(
                  children: [
                    Container(
                      width: width * 0.4,
                      height: width * 0.25,
                      child: Image.asset(
                        'assets/images/map_Image.png',
                        fit: BoxFit.cover,
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

                PrimaryButton(
                  name: 'New Form',
                  pushing: () {
                    Navigator.push(context, SlideRight(page: StartPage()));
                  },
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
