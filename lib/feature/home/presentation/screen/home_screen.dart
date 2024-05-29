import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:space_x/feature/home/presentation/widget/topics/sliver_topics_title_widget.dart';

import '../../../../core/constants/assets.dart';
import '../widget/rockets/rockets_widget.dart';
import '../widget/topics/sliver_topics_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SvgPicture.asset(AssetsImages.logoSVG),
        centerTitle: false,
        actions: [
          SvgPicture.asset(AssetsImages.bookmarkSVG),
          const SizedBox(width: 26),
          SvgPicture.asset(AssetsImages.searchSVG),
          const SizedBox(width: 20),
        ],
      ),
      body: const Padding(
        padding: EdgeInsets.all(20.0),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: RocketsWidget()),
            SliverToBoxAdapter(child: SizedBox(height: 20)),
            SliverTopicsTitleWidget(),
            SliverToBoxAdapter(child: SizedBox(height: 10)),
            SliverTopicsWidget(),
          ],
        ),
      ),
    );
  }
}
