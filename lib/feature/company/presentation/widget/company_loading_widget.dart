import 'package:flutter/material.dart';

import '../../../../core/constants/assets.dart';
import 'company_header.dart';
import 'company_logo.dart';

class CompanyLoadingWidget extends StatelessWidget {
  const CompanyLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        return SizedBox(
          width: constraints.maxWidth,
          height: constraints.maxHeight,
          child: Column(
            children: [
              const CompanyHeader(),
              const CompanyLogo(),
              const SizedBox(height: 30),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    width: constraints.maxWidth,
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
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
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
