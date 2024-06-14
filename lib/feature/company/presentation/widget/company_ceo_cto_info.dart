import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:space_x/core/extensions/style_extensions.dart';

import '../../../../core/constants/assets.dart';
import '../../data/model/company_model.dart';

class CompanyCeoCtoInfo extends StatelessWidget {
  final CompanyModel company;
  const CompanyCeoCtoInfo({required this.company, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 1,
              child: AspectRatio(
                aspectRatio: 1,
                child: Image.asset(
                  AssetsImages.elonMusk,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            const SizedBox(width: 5),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "company.ceo_cto".tr(args: [company.name]),
                    style: context.font12BlueBold,
                  ),
                  Text(
                    company.ceo,
                    style: context.font20WhiteMedium,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "company.ceo_description".tr(),
                    style: context.font14WhiteLight,
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
