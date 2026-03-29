import 'package:flutter/material.dart';
import 'package:property_inspector/core/app_theme.dart';

// ignore: must_be_immutable
class SecondaryButton extends StatefulWidget {
  SecondaryButton({
    super.key,
    required this.name,
    required this.pushing,
    this.color,
    required this.isBack,
  });
  String name;
  Color? color;
  Function() pushing;
  bool isBack;
  @override
  State<SecondaryButton> createState() => _SecondaryButtonState();
}

class _SecondaryButtonState extends State<SecondaryButton> {
  double scale = 1;
  double opacity = 1;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    Future<void> onTap() async {
      setState(() {
        opacity = 0.8;
        scale = 0.9;
      });

      await Future.delayed(const Duration(milliseconds: 150));

      setState(() {
        opacity = 1;
        scale = 1;
      });
      await Future.delayed(const Duration(milliseconds: 150));

      widget.pushing();
    }

    return GestureDetector(
      onTap: onTap,
      onTapDown: (details) {
        setState(() {
          scale = 0.9;
          opacity = 0.8;
        });
      },
      onTapUp: (details) {
        setState(() {
          scale = 1;
          opacity = 1;
        });
      },
      onTapCancel: () {
        setState(() {
          scale = 1;
          opacity = 1;
        });
      },
      child: AnimatedOpacity(
        opacity: opacity,
        duration: const Duration(milliseconds: 175),
        child: AnimatedScale(
          scale: scale,
          duration: const Duration(milliseconds: 175),
          child: Container(
            height: width * 0.15,
            width: width * 0.45,
            decoration: BoxDecoration(
              color: widget.color ?? secondaryColor,
              borderRadius: BorderRadius.circular(width * 0.07),
              border: Border.all(
                color: Color(0xff2B282B),
                width: 0.5,
                style: BorderStyle.solid,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 2),
                  blurRadius: 2,
                  offset: Offset(0.5, 2),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: widget.isBack
                  ? [
                      Icon(
                        Icons.arrow_back,
                        size: width * 0.07,
                        color: Colors.white,
                      ),
                      SizedBox(width: width * 0.01),

                      Text(
                        widget.name,
                        style: TextStyle(
                          color: primaryColor,
                          fontFamily: fontFamily,
                          fontSize: width * 0.05,
                        ),
                      ),
                    ]
                  : [
                      Text(
                        widget.name,
                        style: TextStyle(
                          color: primaryColor,
                          fontFamily: fontFamily,
                          fontSize: width * 0.05,
                        ),
                      ),
                      SizedBox(width: width * 0.01),
                      Icon(
                        Icons.arrow_forward,
                        size: width * 0.07,
                        color: Colors.white,
                      ),
                    ],
            ),
          ),
        ),
      ),
    );
  }
}
