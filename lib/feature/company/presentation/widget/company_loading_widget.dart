import 'package:flutter/material.dart';

import '../../../../core/constants/assets.dart';
import 'company_app_bar.dart';

class CompanyLoadingWidget extends StatelessWidget {
  const CompanyLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CompanyAppBar(),
      body: SizedBox.expand(
        child: Align(
          alignment: Alignment.bottomCenter,
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
  }
}
