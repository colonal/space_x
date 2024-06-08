import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constants/assets.dart';

class CompanyLogo extends StatelessWidget {
  const CompanyLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        width: constraints.maxWidth,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.5),
              blurRadius: 40,
              spreadRadius: 20,
              offset: const Offset(0, -20),
            ),
          ],
        ),
        child: Center(
          child: SizedBox(
            width: constraints.maxWidth * .6,
            child: SvgPicture.asset(AssetsImages.spaceXLogoSVG),
          ),
        ),
      );
    });
  }
}
