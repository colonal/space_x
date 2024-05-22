import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:space_x/core/extensions/style_extensions.dart';

class RocketIconInfo extends StatelessWidget {
  final String title;
  final String image;
  final Color? colorFilter;

  const RocketIconInfo(
      {required this.title, required this.image, this.colorFilter, super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Row(
      children: [
        Text(
          title,
          style: context.font12WhiteLight,
        ),
        const SizedBox(width: 5),
        SvgPicture.asset(
          image,
          width: 20,
          height: 20,
          colorFilter: ColorFilter.mode(
            colorFilter ?? theme.dividerColor,
            BlendMode.srcIn,
          ),
        ),
      ],
    );
  }
}
