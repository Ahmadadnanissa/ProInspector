import 'package:flutter/material.dart';
import 'package:property_inspector/features/property_inspection_feature/presentation/widgets/buy_or_rent_custom_container.dart';

// ignore: must_be_immutable
class RowRentOrBuy extends StatefulWidget {
  RowRentOrBuy({super.key, this.isSelectedSall});
  bool? isSelectedSall;

  @override
  State<RowRentOrBuy> createState() => _RowRentOrBuyState();
}

class _RowRentOrBuyState extends State<RowRentOrBuy> {
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
              widget.isSelectedSall = true;
              isSelectedRent = false;
              setState(() {});
            },
            child: BuyOrRentCustomContainer(
              icon: Icons.shopping_cart_outlined,
              forWhat: 'For Sall',
              isSelected: widget.isSelectedSall!,
            ),
          ),

          InkWell(
            borderRadius: BorderRadius.circular(width * 0.03),
            onTap: () {
              widget.isSelectedSall = false;
              isSelectedRent = true;
              setState(() {});
            },
            child: BuyOrRentCustomContainer(
              icon: Icons.key_outlined,
              forWhat: 'For Rent',
              isSelected: isSelectedRent,
            ),
          ),
        ],
      ),
    );
  }
}
