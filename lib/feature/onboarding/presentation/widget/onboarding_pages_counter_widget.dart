import 'package:flutter/material.dart';

import '../../../../../core/constants/colors.dart';
import '../../logic/onboarding_cubit.dart';

class OnboardingPagesCounterWidget extends StatelessWidget {
  const OnboardingPagesCounterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    final cubit = OnboardingCubit.get(context);
    final pagesLength = cubit.data.length;
    return ValueListenableBuilder(
        valueListenable: cubit.pageValueNotifier,
        builder: (context, value, child) {
          return Center(
            child: Container(
              height: 15,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: theme.primaryColorDark.withOpacity(.3),
                border: Border.all(
                  color: theme.disabledColor,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: List.generate(
                  pagesLength,
                  (index) => Row(
                    children: [
                      if (index != 0) const SizedBox(width: 5),
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        height: 8,
                        width: value == index ? 15 : 8,
                        decoration: BoxDecoration(
                          color: value == index
                              ? ColorsManager.lightCoralColor
                              : theme.disabledColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
