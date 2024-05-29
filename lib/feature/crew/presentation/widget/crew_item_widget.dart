import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:space_x/core/extensions/style_extensions.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/constants/assets.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/widget/image_network_widget.dart';
import '../../data/model/crew_model.dart';

class CrewItemWidget extends StatelessWidget {
  final CrewModel crew;
  const CrewItemWidget({required this.crew, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      borderOnForeground: true,
      shadowColor: Colors.white,
      shape: RoundedRectangleBorder(
        side: const BorderSide(
          color: Colors.white,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: LayoutBuilder(builder: (context, constraints) {
          return SizedBox(
            height: constraints.maxHeight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: ImageNetworkWidget(
                      crew.image,
                      width: double.infinity,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  crew.name,
                  style: context.font18WhiteBold,
                ),
                const SizedBox(height: 10),
                _buildInfoWidget(
                  context,
                  title: "crew.${crew.status}".tr(),
                  assetName: crew.status == "active"
                      ? AssetsImages.activeSVG
                      : AssetsImages.inactiveSVG,
                ),
                const SizedBox(height: 10),
                _buildInfoWidget(
                  context,
                  title:
                      "crew.launch".tr(args: [crew.launches.length.toString()]),
                  assetName: AssetsImages.launchSVG,
                ),
                const SizedBox(height: 10),
                _buildInfoWidget(
                  context,
                  title: crew.agency,
                  assetName: AssetsImages.rocketSpaceSVG,
                ),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.center,
                  child: MaterialButton(
                    height: 30,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                        color: Colors.white,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    onPressed: () => _launchUrl(context, crew.wikipedia),
                    child: Text(
                      "crew.wikipedia".tr(),
                      style: context.font12WhiteLight,
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }

  Row _buildInfoWidget(BuildContext context,
      {required String title, required String assetName}) {
    return Row(
      children: [
        SvgPicture.asset(
          assetName,
          width: 20,
          height: 20,
        ),
        const SizedBox(width: 5),
        Text(
          title,
          style: context.font14WhiteLight,
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
