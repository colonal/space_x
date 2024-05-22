import 'package:flutter/material.dart';

import '../../data/model/rocket_model.dart';
import '../widget/sliver_app_bar_widget.dart';
import '../widget/sliver_custom_divider.dart';
import '../widget/sliver_rocket_info_widget.dart';

class RocketScreen extends StatelessWidget {
  final RocketModel rocket;
  const RocketScreen({required this.rocket, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        clipBehavior: Clip.none,
        slivers: [
          SliverAppBarWidget(rocket: rocket),
          const SliverCustomDivider(),
          SliverRocketInfoWidget(rocket: rocket),
        ],
      ),
    );
  }
}
