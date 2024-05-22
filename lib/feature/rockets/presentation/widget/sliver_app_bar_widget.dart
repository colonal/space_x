import 'package:flutter/material.dart';
import 'package:space_x/core/extensions/navigator_extensions.dart';
import 'package:space_x/core/extensions/style_extensions.dart';

import '../../data/model/rocket_model.dart';
import 'rocket_counter_item_widget.dart';
import 'rocket_image_widget.dart';

class SliverAppBarWidget extends StatelessWidget {
  final RocketModel rocket;
  const SliverAppBarWidget({required this.rocket, super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    Size size = MediaQuery.sizeOf(context);
    return SliverAppBar(
      backgroundColor: theme.scaffoldBackgroundColor,
      title: Text(
        rocket.name ?? "",
        style: context.font20WhiteMedium,
      ),
      leading: Center(
        child: InkWell(
          customBorder: const CircleBorder(),
          onTap: () => context.pop(),
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: theme.primaryColorDark.withOpacity(.3),
              shape: BoxShape.circle,
              border: Border.all(
                color: theme.disabledColor,
              ),
            ),
            child: const Icon(
              Icons.arrow_back_ios_new_rounded,
              size: 20,
            ),
          ),
        ),
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          children: [
            RocketImagesWidget(rocket: rocket),
            Positioned(
              bottom: 15,
              left: 0,
              right: 0,
              child: RocketCounterItemWidget(rocket.flickrImages?.length ?? 0),
            ),
          ],
        ),
      ),
      expandedHeight: size.height * .7,
      pinned: true,
      snap: false,
      floating: false,
    );
  }
}
