import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:space_x/core/extensions/style_extensions.dart';
import 'package:space_x/core/extensions/theme_extensions.dart';

import '../../../../core/constants/assets.dart';
import '../../data/model/company_model.dart';

class CompanySpaceXInfo extends StatelessWidget {
  final CompanyModel company;
  const CompanySpaceXInfo({required this.company, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "company.what_space_x".tr(),
          style: context.font20WhiteMedium,
        ),
        const SizedBox(height: 20),
        Card(
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: context.theme.disabledColor,
            ),
            borderRadius: BorderRadius.circular(25),
          ),
          margin: const EdgeInsets.symmetric(horizontal: 40),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(AssetsImages.spaceXRocket),
                ),
                const SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    company.summary,
                    style: context.font14WhiteLight,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
