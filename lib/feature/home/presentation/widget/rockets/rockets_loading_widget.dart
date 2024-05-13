import 'package:flutter/material.dart';

import '../../../../../core/widget/loading_animation_widget.dart';

class RocketsLoadingWidget extends StatelessWidget {
  const RocketsLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: PageView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (context, index) {
          return LoadingAnimationWidget(
            borderRadius: BorderRadius.circular(20),
          );
        },
      ),
    );
  }
}
