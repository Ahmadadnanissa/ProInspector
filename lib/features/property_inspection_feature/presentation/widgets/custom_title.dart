import 'package:flutter/material.dart';
import 'package:property_inspector/core/app_theme.dart';
import 'package:property_inspector/core/widgets/custom_font.dart';
import 'package:property_inspector/features/property_inspection_feature/presentation/widgets/custom_small_container.dart';

class CustomTitle extends StatelessWidget {
  const CustomTitle({
    super.key,
    required this.title,
    required this.subTitle,
    required this.number,
  });
  final String title;
  final String subTitle;
  final int number;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: width * 0.06),
                  child: CustomFont(
                    name: title,
                    fontColor: secondaryColor,
                    fontSize: width * 0.055,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                SizedBox(
                  width: width * 0.8,
                  child: Text(
                    subTitle,
                    style: TextStyle(
                      color: grayColor,
                      fontSize: width * 0.04,
                      fontFamily: fontFamily,
                    ),
                  ),
                ),
              ],
            ),

            Image.asset(
              'assets/images/Test Passed.png',
              width: width * 0.11,
              height: width * 0.15,
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(top: width * 0.05),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomSmallContainer(
                color: number >= 1 ? Color(0xffE29578) : Colors.white,
              ),
              CustomSmallContainer(
                color: number >= 2 ? Color(0xffE29578) : Colors.white,
              ),
              CustomSmallContainer(
                color: number >= 3 ? Color(0xffE29578) : Colors.white,
              ),
              CustomSmallContainer(
                color: number >= 4 ? Color(0xffE29578) : Colors.white,
              ),
              CustomSmallContainer(
                color: number >= 5 ? Color(0xffE29578) : Colors.white,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
