import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:space_x/core/extensions/style_extensions.dart';

class SliverTopicsTitleWidget extends StatelessWidget {
  const SliverTopicsTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Text(
        "home.topics.title".tr(),
        style: context.font14BlueBold,
      ),
    );
  }
}
