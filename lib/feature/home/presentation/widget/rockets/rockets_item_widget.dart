import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:space_x/core/extensions/navigator_extensions.dart';
import 'package:space_x/core/extensions/style_extensions.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/routes_constants.dart';
import '../../../../../core/widget/image_network_widget.dart';
import '../../../data/model/rockets_response.dart';

class RocketsItemWidget extends StatelessWidget {
  final RocketsResponse rockets;
  const RocketsItemWidget(this.rockets, {super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return LayoutBuilder(builder: (context, constraints) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: GestureDetector(
          onTap: () {
            context.push(Routes.rocketsRoute, arguments: rockets);
          },
          child: Stack(
            children: [
              Container(
                foregroundDecoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withOpacity(.8),
                      ]),
                ),
                child: Hero(
                  tag: rockets.id ?? "",
                  child: ImageNetworkWidget(
                    rockets.flickrImages?.first ?? "",
                    fit: BoxFit.fill,
                    width: constraints.maxWidth,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: Container(
                        width: constraints.maxWidth,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: theme.primaryColorDark.withOpacity(.1),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: theme.disabledColor,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  rockets.name ?? "",
                                  style: context.font20WhiteMedium,
                                ),
                                CircleAvatar(
                                  radius: 6,
                                  backgroundColor: (rockets.active ?? false)
                                      ? ColorsManager.activeColor
                                      : ColorsManager.retiredColor,
                                )
                              ],
                            ),
                            const SizedBox(height: 5),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    "${rockets.country} ",
                                    style: context.font14WhiteLight,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Text(
                                  rockets.firstFlight ?? "",
                                  style: context.font14WhiteLight,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
