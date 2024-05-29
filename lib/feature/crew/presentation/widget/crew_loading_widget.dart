import 'package:flutter/material.dart';

import '../../../../core/widget/loading_animation_widget.dart';

class CrewLoadingWidget extends StatelessWidget {
  const CrewLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 8.0, // spacing between rows
        crossAxisSpacing: 8.0, // spacing between columns
        childAspectRatio: 1 / 2,
        crossAxisCount: 2,
      ),
      padding: const EdgeInsets.all(8.0),
      itemCount: 5,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: LoadingAnimationWidget(
            borderRadius: BorderRadius.circular(25),
          ),
        );
      },
    );
  }
}
