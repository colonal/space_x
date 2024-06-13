import 'package:flutter/material.dart';

import '../../logic/launches_cubit.dart';
import 'launches_sliver_list_item.dart';

class LauncherSliverList extends StatelessWidget {
  const LauncherSliverList({super.key});

  @override
  Widget build(BuildContext context) {
    final launches = LaunchesCubit.get(context).launches;
    return SliverList.separated(
      itemCount: launches.length,
      itemBuilder: (context, index) => const SizedBox(height: 15),
      separatorBuilder: (context, index) => LauncherSliverListItem(
        launches[index],
      ),
    );
  }
}
