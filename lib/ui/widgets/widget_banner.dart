import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../core/resources/_r.dart';
import 'widget_button.dart';
import 'widgets_text.dart';

class BannerBasic extends StatelessWidget {
  final String title;
  final String subtitle;
  final String buttonTitle;
  final String iconPath;
  final Color color;
  final double? iconBottomPadding;
  final double? iconRightPadding;
  final Function() onPressedButton;

  const BannerBasic({
    super.key,
    required this.title,
    required this.subtitle,
    required this.buttonTitle,
    required this.iconPath,
    required this.color,
    this.iconBottomPadding = 0.0,
    this.iconRightPadding = 0.0,
    required this.onPressedButton,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: 0.0,
          right: 0.0,
          bottom: 0.0,
          top: 0.0,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              color: color,
            ),
          ),
        ),
        Positioned(
          bottom: iconBottomPadding,
          right: iconRightPadding,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: SvgPicture.asset(iconPath),
          ),
        ),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextBasic(
                text: title,
                color: R.color.white.withOpacity(0.7),
                fontFamily: R.fonts.robotoItalic,
                fontSize: 12.0,
              ),
              const SizedBox(height: 8.0),
              TextBasic(
                text: subtitle,
                color: R.color.white,
                fontFamily: R.fonts.robotoBold,
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
              ),
              const SizedBox(height: 22.0),
              ButtonBasic(
                padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                onPressed: onPressedButton,
                bgColor: R.color.white,
                radius: 4.0,
                fontFamily: R.fonts.robotoItalic,
                fontSize: 12.0,
                textColor: color,
                text: buttonTitle,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
