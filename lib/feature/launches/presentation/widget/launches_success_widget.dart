import 'package:flutter/material.dart';

import 'launches_sliver_list.dart';
import 'number_of_launches_state.dart';

class LaunchesSuccessWidget extends StatelessWidget {
  const LaunchesSuccessWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: SizedBox(height: 20)),
        SliverToBoxAdapter(child: NumberOfLauncherState()),
        SliverToBoxAdapter(child: SizedBox(height: 30)),
        LauncherSliverList(),
      ],
    );
  }
}
