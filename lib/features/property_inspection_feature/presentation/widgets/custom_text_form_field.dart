import 'package:flutter/material.dart';
import 'package:property_inspector/core/app_theme.dart';

const BorderRadius kBorderRadius = BorderRadius.all(Radius.circular(24));

// ignore: must_be_immutable
class CustomTextFormField extends StatefulWidget {
  CustomTextFormField({
    super.key,
    required this.hintText,
    required this.maxLines,
    this.validator,
    this.onChanged,
    this.controller,
  });
  final String hintText;
  void Function(String)? onChanged;
  final int maxLines;
  TextEditingController? controller;

  String? Function(String?)? validator;
  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  String? value;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.only(
        top: width * 0.03,
        left: width * 0.05,
        right: width * 0.05,
        bottom: width * 0.03,
      ),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: blackColor.withValues(alpha: 0.2),
              offset: Offset(0, 3),
              blurRadius: 10,
            ),
          ],
        ),
        child: TextFormField(
          controller: widget.controller,
          // minLines: 3,
          maxLines: widget.maxLines,
          obscureText: false,
          validator: widget.validator,
          onChanged: widget.onChanged,
          textAlign: TextAlign.start,
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
              vertical: width * 0.035,
              horizontal: width * 0.05,
            ),
            fillColor: Color(0xffEDF6F9),
            filled: true,
            hintText: widget.hintText,
            hintStyle: TextStyle(
              color: Color(0xff5F6264),
              fontFamily: fontFamily,
              fontSize: width * 0.045,
            ),

            enabledBorder: OutlineInputBorder(
              borderRadius: kBorderRadius,
              borderSide: BorderSide(color: Color(0xffE5F0F4), width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: kBorderRadius,
              borderSide: BorderSide(color: Color(0xffE5F0F4), width: 1),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: kBorderRadius,
              borderSide: BorderSide(color: Color(0xffE5F0F4), width: 1),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: kBorderRadius,
              borderSide: BorderSide(color: Color(0xffE5F0F4), width: 1),
            ),
          ),
        ),
      ),
    );
  }
}
