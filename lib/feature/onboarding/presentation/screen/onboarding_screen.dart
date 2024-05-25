import 'package:flutter/material.dart';

import '../../logic/onboarding_cubit.dart';
import '../widget/onboarding_listener.dart';
import '../widget/onboarding_logo_widget.dart';
import '../widget/onboarding_next_page_button_widget.dart';
import '../widget/onboarding_images_widget.dart';
import '../widget/onboarding_messages_widget.dart';
import '../widget/onboarding_pages_counter_widget.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        return GestureDetector(
          onHorizontalDragEnd: (details) {
            // Swiping in right direction.
            if ((details.primaryVelocity ?? 0) > 0) {
              OnboardingCubit.get(context).emitPreviousPage();
            }
            // Swiping in left direction.
            if ((details.primaryVelocity ?? 0) < 0) {
              OnboardingCubit.get(context).emitNextPage();
            }
          },
          child: Column(
            children: [
              SizedBox(
                height: constraints.maxHeight * .6,
                child: const OnboardingImagesWidget(),
              ),
              SizedBox(
                height: constraints.maxHeight * .4,
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Flexible(child: OnboardingLogoWidget()),
                    Flexible(child: OnboardingMessagesWidget()),
                    Flexible(child: OnboardingNextPageButtonWidget()),
                    Flexible(child: OnboardingPagesCounterWidget()),
                  ],
                ),
              ),
              const OnboardingListener(),
            ],
          ),
        );
      }),
    );
  }
}
