import 'package:flutter/material.dart';

import '../../logic/onboarding_cubit.dart';
import 'onboarding_image_item_widget.dart';

class OnboardingImagesWidget extends StatelessWidget {
  const OnboardingImagesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = OnboardingCubit.get(context);
    return PageView.builder(
      itemCount: cubit.data.length,
      controller: cubit.pageImageController,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return OnboardingImageItemWidget(
          image: cubit.data[index].image,
        );
      },
    );
  }
}
