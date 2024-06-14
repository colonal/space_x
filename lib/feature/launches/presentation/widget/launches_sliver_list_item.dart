import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:space_x/core/constants/assets.dart';
import 'package:space_x/core/extensions/style_extensions.dart';
import 'package:space_x/core/extensions/theme_extensions.dart';
import 'package:space_x/core/widget/image_network_widget.dart';

import '../../../../core/constants/colors.dart';
import '../../data/model/launches.dart';

class LauncherSliverListItem extends StatelessWidget {
  final Launches launches;
  const LauncherSliverListItem(this.launches, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      borderOnForeground: true,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      shadowColor: context.theme.disabledColor,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: context.theme.disabledColor,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: launches.links?.patch?.large != null
                  ? ImageNetworkWidget(
                      launches.links!.patch!.large!,
                      height: 165,
                      width: 100,
                      fit: BoxFit.contain,
                    )
                  : const Icon(
                      Icons.image_not_supported,
                      size: 100,
                    ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    launches.dateUtc?.substring(0, 10) ??
                        "launches.date_not_found".tr(),
                    style: context.font12BlueMedium,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    launches.name ?? "launches.name_not_found".tr(),
                    style: context.font16WhiteRegular,
                  ),
                  const SizedBox(height: 10),
                  launches.success != null
                      ? _launchStatusRow(context, launches)
                      : Text(
                          "launches.unknown_launch_status".tr(),
                          style: context.font12WhiteLight?.copyWith(
                            color: ColorsManager.retiredColor,
                          ),
                        ),
                  const SizedBox(height: 10),
                  Text(
                    launches.details ?? "launches.no_details".tr(),
                    style: context.font12WhiteLight?.copyWith(
                      color: ColorsManager.gray,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  _launchStatusRow(BuildContext context, Launches launches) {
    return Row(
      children: [
        SvgPicture.asset(
          (launches.success != null && launches.success!)
              ? AssetsImages.activeSVG
              : AssetsImages.inactiveSVG,
          width: 20,
          height: 20,
        ),
        const SizedBox(width: 10),
        Text(
          (launches.success != null && launches.success!)
              ? "launches.successful_launch".tr()
              : "launches.failed_launch".tr(),
          style: context.font12WhiteLight,
        ),
      ],
    );
  }
}
