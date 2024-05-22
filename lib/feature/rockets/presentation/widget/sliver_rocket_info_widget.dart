import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:space_x/core/constants/colors.dart';
import 'package:space_x/core/extensions/style_extensions.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/constants/assets.dart';
import '../../data/model/rocket_model.dart';
import 'rocket_icon_info.dart';

class SliverRocketInfoWidget extends StatelessWidget {
  final RocketModel rocket;

  const SliverRocketInfoWidget({required this.rocket, super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              rocket.firstFlight ?? "",
              style: context.font12BlueBold,
            ),
            const SizedBox(height: 20),
            Text(
              rocket.name ?? "",
              style: context.font18WhiteBold,
            ),
            const SizedBox(height: 20),
            Text(
              rocket.description ?? "",
              style: context.font14WhiteLight,
            ),
            const SizedBox(height: 20),
            const Divider(),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RocketIconInfo(
                  title:
                      (rocket.country ?? "").replaceAll("Republic of the", ''),
                  image: AssetsImages.countrySVG,
                ),
                RocketIconInfo(
                  title: rocket.company ?? "",
                  image: AssetsImages.companySVG,
                ),
                RocketIconInfo(
                  title: (rocket.active ?? false
                          ? "rocket.active"
                          : "rocket.inactive")
                      .tr(),
                  image: AssetsImages.stateSVG,
                  colorFilter: rocket.active ?? false
                      ? ColorsManager.activeColor
                      : ColorsManager.retiredColor,
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RocketIconInfo(
                  title: "${'rocket.cost'.tr()} ${rocket.costPerLaunch}",
                  image: AssetsImages.costSVG,
                ),
                RocketIconInfo(
                  title:
                      "${'rocket.success_rate'.tr()} ${rocket.successRatePct} %",
                  image: AssetsImages.doneSVG,
                ),
                RocketIconInfo(
                  title: "${'rocket.stages'.tr()} ${rocket.stages}",
                  image: AssetsImages.stagesSVG,
                ),
              ],
            ),
            const SizedBox(height: 40),
            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () => _launchUrl(context, rocket.wikipedia),
                child: Text("rocket.wikipedia".tr()),
              ),
            ),
            const SizedBox(height: 30),
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
