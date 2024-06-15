import 'package:flutter/material.dart';

import '../../../../core/constants/assets.dart';
import 'company_header.dart';
import 'company_logo.dart';

class CompanyLoadingWidget extends StatelessWidget {
  const CompanyLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Column(
          children: [
            const CompanyHeader(),
            const CompanyLogo(),
            const SizedBox(height: 20),
            Expanded(
              child: LayoutBuilder(builder: (context, constraints) {
                return Align(
                  alignment: Alignment.bottomCenter,
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: SizedBox(
                      width: constraints.maxWidth,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Image.asset(
                          AssetsImages.animationAstronaut,
                          fit: BoxFit.fitHeight,
                          alignment: Alignment.topCenter,
                          height: 200,
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
