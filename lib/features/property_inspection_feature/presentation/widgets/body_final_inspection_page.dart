import 'package:flutter/material.dart';
import 'package:property_inspector/core/app_theme.dart';
import 'package:property_inspector/core/widgets/custom_font.dart';
import 'package:property_inspector/features/property_inspection_feature/data/models/out_door_model.dart';
import 'package:property_inspector/features/property_inspection_feature/data/models/room_item.dart';
import 'package:property_inspector/features/property_inspection_feature/presentation/widgets/add_primary_image_widget.dart';
import 'package:property_inspector/features/property_inspection_feature/presentation/widgets/custom_title.dart';
import 'package:property_inspector/features/property_inspection_feature/presentation/widgets/row_for_evaluated_widget.dart';
import 'package:property_inspector/features/property_inspection_feature/presentation/widgets/secondary_button.dart';

class BodyFinalInspectionPage extends StatefulWidget {
  const BodyFinalInspectionPage({
    super.key,
    required this.fullDescription,
    required this.shortDescription,
    required this.zipCode,
    required this.propertyType,
    required this.galleryPhoto,
    required this.askingPrice,
    required this.listingType,
    required this.cityName,
    required this.location,
    required this.lat,
    required this.lon,
    required this.nearByPlaces,
    required this.outDoors,
    required this.sqftArea,
    required this.constructionYear,
    required this.roomItems,
    required this.heating,
    required this.furnishing,
    this.rentalPeriod,
    required this.fireplace,
    required this.hasBasement,
    this.basementArea,
    required this.internalGarageArea,
    required this.finishingQuality,
    required this.maintenanceLevel,
    required this.neighborhoodScore,
    required this.exteriorFinish,
    this.floorNumber,
    this.numberOfFloors,
    required this.elevator,
  });
  final String fullDescription;
  final String shortDescription;
  final String zipCode;
  final String propertyType;
  final List<String> galleryPhoto;
  final String askingPrice;
  final String listingType;
  final String cityName;
  final String location;
  final double lat;
  final double lon;
  final List<String> nearByPlaces;

  final List<OutdoorItem> outDoors;

  final String sqftArea;
  final String constructionYear;

  final List<RoomItem> roomItems;

  final String heating;
  final String furnishing;

  final String? rentalPeriod;

  final bool fireplace;

  final bool hasBasement;

  final String? basementArea;

  final String internalGarageArea;

  final String finishingQuality;

  final String maintenanceLevel;

  final String neighborhoodScore;

  final String exteriorFinish;

  final String? floorNumber;

  final String? numberOfFloors;

  final bool elevator;

  @override
  State<BodyFinalInspectionPage> createState() =>
      _BodyFinalInspectionPageState();
}

class _BodyFinalInspectionPageState extends State<BodyFinalInspectionPage> {
  String primaryImage = '';
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.03),
        child: Column(
          children: [
            CustomTitle(
              title: 'Finalize Inspection',
              subTitle:
                  'Youre almost done! Add a main photo and tell us your final thoughts',
              number: 5,
            ),
            AddPrimaryImageWidget(
              onImageSelected: (image) {
                primaryImage = image;
              },
            ),
            CustomFont(
              name: 'How would you evaluate this property?',
              fontColor: blackColor,
              fontSize: width * 0.05,
              fontWeight: FontWeight.w600,
            ),

            RowForEvaluatedWidget(),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SecondaryButton(
                    name: 'Back',
                    pushing: () {
                      Navigator.pop(context);
                    },
                    color: Color(0xffE29578),
                    isBack: true,
                  ),
                  SecondaryButton(
                    name: 'Send Form',
                    pushing: () {},
                    isBack: false,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
