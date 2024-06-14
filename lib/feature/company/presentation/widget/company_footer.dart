import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:space_x/core/extensions/style_extensions.dart';
import 'package:space_x/core/extensions/theme_extensions.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/constants/assets.dart';
import '../../../../core/constants/colors.dart';
import '../../data/model/company_model.dart';
import '../../logic/company_cubit.dart';

class CompanyFooter extends StatelessWidget {
  final CompanyModel company;
  const CompanyFooter({required this.company, super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = CompanyCubit.get(context);
    return ColoredBox(
      color: context.theme.canvasColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  CompanyCubit.get(context).getAppName(),
                  style: context.font16WhiteRegular,
                ),
                const SizedBox(width: 10),
                Text(
                  "x",
                  style: context.font12WhiteLight,
                  textScaler: const TextScaler.linear(.8),
                ),
                const SizedBox(width: 10),
                Text(
                  company.name,
                  style: context.font16WhiteRegular,
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  AssetsImages.spaceXSmallLogo,
                  width: 80,
                  height: 80,
                ),
                const SizedBox(width: 10),
                Image.asset(
                  AssetsImages.appIcon,
                  width: 80,
                  height: 80,
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text.rich(
              TextSpan(
                  text: "company.copyright.app_name_version".tr(args: [
                    cubit.getAppName(),
                    cubit.getAppVersion(),
                  ]),
                  children: [
                    TextSpan(
                      text: "company.copyright.space".tr(),
                    ),
                    TextSpan(
                      text: "company.copyright.colonal".tr(),
                      style: const TextStyle(
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          _launchUrl(context, "https://github.com/colonal");
                        },
                    ),
                    TextSpan(
                      text: "company.copyright.year"
                          .tr(args: [DateTime.now().year.toString()]),
                    ),
                  ]),
              style: context.font12WhiteLight?.copyWith(
                color: context.font12WhiteLight?.color?.withOpacity(.5),
              ),
            ),
          ],
        ),
      ),
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
