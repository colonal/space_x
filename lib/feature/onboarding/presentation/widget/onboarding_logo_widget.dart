import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constants/assets.dart';

class OnboardingLogoWidget extends StatelessWidget {
  const OnboardingLogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SvgPicture.asset(
          AssetsImages.logoSVG,
          width: constraints.maxWidth * .5,
        );
      },
    );
  }
}
