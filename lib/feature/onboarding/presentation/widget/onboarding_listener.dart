import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_x/core/extensions/navigator_extensions.dart';

import '../../../../core/constants/routes_constants.dart';
import '../../logic/onboarding_cubit.dart';
import '../../logic/onboarding_state.dart';

class OnboardingListener extends StatelessWidget {
  const OnboardingListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<OnboardingCubit, OnboardingState>(
      listener: (context, state) {
        bool isNavigate = state.maybeWhen<bool>(
            orElse: () => false, navigateToHome: () => true);
        if (isNavigate) {
          context.pushAndRemoveUntil(Routes.homeRoute, (_) => false);
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
