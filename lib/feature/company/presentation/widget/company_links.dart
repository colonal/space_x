import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:space_x/core/extensions/style_extensions.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/constants/colors.dart';
import '../../data/model/company_model.dart';

class CompanyLinks extends StatelessWidget {
  final CompanyModel company;
  const CompanyLinks({required this.company, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "company.links.title".tr(),
          style: context.font20WhiteMedium,
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildTextLaunch(
              context,
              url: company.links.website,
              title: "company.links.website".tr(),
            ),
            _buildTextLaunch(
              context,
              url: company.links.flickr,
              title: "company.links.flickr".tr(),
            ),
            _buildTextLaunch(
              context,
              url: company.links.twitter,
              title: "company.links.twitter".tr(),
            ),
            _buildTextLaunch(
              context,
              url: company.links.elonTwitter,
              title: "company.links.elon_twitter".tr(),
            ),
          ],
        ),
      ],
    );
  }

  Text _buildTextLaunch(BuildContext context,
      {required String url, required String title}) {
    return Text.rich(
      TextSpan(
        text: title,
        recognizer: TapGestureRecognizer()
          ..onTap = () {
            _launchUrl(context, url);
          },
      ),
      style: context.font12BlueBold,
    );
  }

  void _launchUrl(BuildContext context, String? url) async {
    if (!await launchUrl(Uri.parse(url ?? ""),
        mode: LaunchMode.externalNonBrowserApplication)) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: ColorsManager.warningColor,
            content: Text("common.could_not_launch".tr()),
          ),
        );
      }
    }
  }
}
