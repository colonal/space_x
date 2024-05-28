import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/helpers/cache_helper.dart';
import 'onboarding_pages.dart';
import 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  final CacheHelpers _cacheHelpers;
  OnboardingCubit(CacheHelpers cacheHelpers)
      : _cacheHelpers = cacheHelpers,
        super(const OnboardingState.initial());

  factory OnboardingCubit.get(context) =>
      BlocProvider.of<OnboardingCubit>(context);

  PageController pageImageController = PageController();
  PageController pageMessageController = PageController();

  int get courantIndex => pageImageController.page?.toInt() ?? 0;

  List<({String image, String massage})> get data => onboardingPages;

  final ValueNotifier<int> _pageValueNotifier = ValueNotifier(0);

  ValueNotifier<int> get pageValueNotifier => _pageValueNotifier;

  void emitNextPage([bool isNavigateToHome = false]) {
    int index = courantIndex + 1;
    if (isNavigateToHome && index == data.length) {
      _cacheHelpers.setOnBoardingScreenViewed();
      emit(const OnboardingState.navigateToHome());
    } else {
      _emitNextImagePage(index);
      _emitNextMessagePage(index);
      _setPageValueNotifier(index);
    }
  }

  void emitPreviousPage() {
    int index = courantIndex - 1;
    _emitNextImagePage(index);
    _emitNextMessagePage(index);
    _setPageValueNotifier(index);
  }

  void _emitNextImagePage(index) {
    pageImageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 500),
      curve: Curves.linear,
    );
  }

  void _emitNextMessagePage(index) {
    pageMessageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 500),
      curve: Curves.linear,
    );
  }

  void _setPageValueNotifier(index) {
    if (index >= 0 && data.length > index) {
      _pageValueNotifier.value = index;
    }
  }

  @override
  Future<void> close() {
    pageImageController.dispose();
    pageMessageController.dispose();
    return super.close();
  }
}
