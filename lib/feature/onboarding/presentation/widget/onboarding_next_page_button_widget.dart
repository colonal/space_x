import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/onboarding_cubit.dart';
import '../../logic/onboarding_state.dart';

class OnboardingNextPageButtonWidget extends StatelessWidget {
  const OnboardingNextPageButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingCubit, OnboardingState>(
      builder: (context, state) {
        return ElevatedButton(
          onPressed: () {
            OnboardingCubit.get(context).emitNextPage(true);
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("onboarding.start".tr()),
              const SizedBox(width: 5),
              const Icon(Icons.arrow_forward_rounded),
            ],
          ),
        );
      },
    );
  }
}
