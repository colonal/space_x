import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:space_x/core/extensions/style_extensions.dart';

import '../../logic/launches_cubit.dart';

class NumberOfLauncherState extends StatelessWidget {
  const NumberOfLauncherState({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = LaunchesCubit.get(context);
    return IntrinsicHeight(
      child: Row(
        children: [
          _buildItem(
            context,
            value: cubit.getTotalLaunches(),
            title: "launches.total_launches".tr(),
          ),
          const VerticalDivider(),
          _buildItem(
            context,
            value: cubit.getTotalLandings(),
            title: "launches.total_landings".tr(),
          ),
          const VerticalDivider(),
          _buildItem(
            context,
            value: cubit.getTotalFailures(),
            title: "launches.total_failures".tr(),
          ),
        ],
      ),
    );
  }

  Widget _buildItem(BuildContext context,
      {required int value, required String title}) {
    return Expanded(
      child: Column(
        children: [
          Text(
            value.toString(),
            style: context.font30WhiteBold,
          ),
          Text(
            title,
            style: context.font14WhiteLight,
          ),
        ],
      ),
    );
  }
}
