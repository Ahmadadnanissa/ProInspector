import 'package:flutter/material.dart';
import 'package:property_inspector/features/property_inspection_feature/presentation/widgets/buy_or_rent_custom_container.dart';

class RowRentOrBuy extends StatefulWidget {
  const RowRentOrBuy({super.key});

  @override
  State<RowRentOrBuy> createState() => _RowRentOrBuyState();
}

class _RowRentOrBuyState extends State<RowRentOrBuy> {
  bool isSelectedBuy = true;
  bool isSelectedRent = false;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.02,
        vertical: width * 0.06,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(width * 0.03),
            onTap: () {
              isSelectedBuy = true;
              isSelectedRent = false;
              setState(() {});
            },
            child: BuyOrRentCustomContainer(
              image: 'assets/images/buy.png',
              forWhat: 'For Buy',
              isSelected: isSelectedBuy,
            ),
          ),

          InkWell(
            borderRadius: BorderRadius.circular(width * 0.03),
            onTap: () {
              isSelectedBuy = false;
              isSelectedRent = true;
              setState(() {});
            },
            child: BuyOrRentCustomContainer(
              image: 'assets/images/rent.png',
              forWhat: 'For Rent',
              isSelected: isSelectedRent,
            ),
          ),
        ],
      ),
    );
  }
}
