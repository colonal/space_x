import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../logic/onboarding_cubit.dart';

class OnboardingMessagesWidget extends StatelessWidget {
  const OnboardingMessagesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = OnboardingCubit.get(context);
    return PageView.builder(
      itemCount: cubit.data.length,
      controller: cubit.pageMessageController,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return LayoutBuilder(
          builder: (context, constraints) {
            return SizedBox(
              width: constraints.maxWidth * .7,
              child: Center(
                child: Text(
                  cubit.data[index].massage.tr(),
                  textAlign: TextAlign.center,
                ),
              ),
            );
          },
        );
      },
    );
  }
}
