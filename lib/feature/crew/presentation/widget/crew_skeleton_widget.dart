import 'package:flutter/material.dart';
import 'package:space_x/core/extensions/theme_extensions.dart';

import '../../../../core/widget/loading_animation_widget.dart';

class CrewSkeletonWidget extends StatelessWidget {
  const CrewSkeletonWidget({super.key});

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
        return Card(
          borderOnForeground: true,
          shadowColor: context.theme.disabledColor,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: context.theme.disabledColor,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: LayoutBuilder(
              builder: (context, constraints) {
                return SizedBox(
                  width: constraints.maxWidth,
                  height: constraints.maxHeight,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: LoadingAnimationWidget(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        height: 20,
                        width: 100,
                        child: LoadingAnimationWidget(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      const SizedBox(height: 10),
                      _buildInfoSkeletonWidget(),
                      const SizedBox(height: 10),
                      _buildInfoSkeletonWidget(),
                      const SizedBox(height: 10),
                      _buildInfoSkeletonWidget(),
                      const SizedBox(height: 10),
                      Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                          width: 80,
                          height: 30,
                          child: LoadingAnimationWidget(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }

  Row _buildInfoSkeletonWidget() {
    return Row(
      children: [
        SizedBox(
          height: 20,
          width: 35,
          child: LoadingAnimationWidget(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        const SizedBox(width: 10),
        SizedBox(
          height: 20,
          width: 100,
          child: LoadingAnimationWidget(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ],
    );
  }
}
