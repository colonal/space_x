import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:space_x/core/extensions/style_extensions.dart';
import 'package:space_x/core/extensions/theme_extensions.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/constants/assets.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/widget/image_network_widget.dart';
import '../../data/model/ships_model.dart';

class ShipsItemWidget extends StatelessWidget {
  final ShipsModel ship;
  const ShipsItemWidget({required this.ship, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: context.theme.disabledColor,
        ),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: ImageNetworkWidget(
                ship.image ?? "",
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildInfoWidget(
                  context,
                  title: "ships.${ship.active ?? false ? 'active' : 'inactive'}"
                      .tr(),
                  assetName: ship.active ?? false
                      ? AssetsImages.activeSVG
                      : AssetsImages.inactiveSVG,
                  includeColor: false,
                ),
                _buildInfoWidget(
                  context,
                  title: ship.type ?? "",
                  assetName: AssetsImages.launchSVG,
                ),
                _buildInfoWidget(
                  context,
                  title: "${ship.yearBuilt}",
                  assetName: AssetsImages.calendarSVG,
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              ship.legacyId ?? "",
              style: context.font12BlueBold,
            ),
            const SizedBox(height: 5),
            Text(
              ship.name ?? "",
              style: context.font24WhiteBold,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildInfoWidget(
                      context,
                      title: "ships.launches"
                          .tr(args: [(ship.launches ?? []).length.toString()]),
                      assetName: AssetsImages.stagesSVG,
                    ),
                    const SizedBox(height: 10),
                    _buildInfoWidget(
                      context,
                      title: (ship.roles ?? ['']).first,
                      assetName: AssetsImages.shipRoleSVG,
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildInfoWidget(
                      context,
                      title: ship.homePort ?? "",
                      assetName: AssetsImages.homeSVG,
                    ),
                    const SizedBox(height: 10),
                    GestureDetector(
                      onTap: () => _launchUrl(context, ship.link),
                      child: _buildInfoWidget(
                        context,
                        title: 'ships.see_article'.tr(),
                        assetName: AssetsImages.linkSVG,
                        textColor: ColorsManager.mainBlue,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Row _buildInfoWidget(
    BuildContext context, {
    required String title,
    required String assetName,
    bool includeColor = true,
    Color? textColor,
  }) {
    return Row(
      children: [
        SvgPicture.asset(
          assetName,
          width: 20,
          height: 20,
          colorFilter: includeColor
              ? ColorFilter.mode(
                  textColor ?? context.theme.primaryColorLight,
                  BlendMode.srcIn,
                )
              : null,
        ),
        const SizedBox(width: 5),
        Text(
          title,
          style: context.font14WhiteLight?.copyWith(
            color: textColor,
          ),
        ),
      ],
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
