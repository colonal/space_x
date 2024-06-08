import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:space_x/core/extensions/theme_extensions.dart';

import '../../../../core/constants/assets.dart';

class CompanyLogos extends StatelessWidget {
  const CompanyLogos({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: context.theme.canvasColor,
      child: SizedBox(
        height: 130,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              AssetsImages.spaceXSmallLogo,
              fit: BoxFit.fitHeight,
            ),
            Image.asset(
              AssetsImages.dragonCrew,
              fit: BoxFit.fitHeight,
            ),
          ],
        ),
      ),
    );
  }
}
