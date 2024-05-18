import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constants/colors.dart';
import '../../logic/rocket_cubit.dart';
import '../../logic/rocket_state.dart';

class RocketCounterItemWidget extends StatelessWidget {
  final int itemsLength;
  const RocketCounterItemWidget(this.itemsLength, {super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return BlocBuilder<RocketCubit, RocketState>(
      buildWhen: (previous, current) {
        return current.maybeWhen<bool>(
          changeRocketImage: (value) => true,
          orElse: () => false,
        );
      },
      builder: (context, state) {
        RocketCubit cubit = RocketCubit.get(context);
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
                itemsLength,
                (index) => Row(
                  children: [
                    if (index != 0) const SizedBox(width: 5),
                    InkWell(
                      customBorder: const CircleBorder(),
                      onTap: () {
                        cubit.pageImageController.animateToPage(
                          index,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeIn,
                        );
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        height: 8,
                        width: cubit.courantImageIndex == index ? 15 : 8,
                        decoration: BoxDecoration(
                          color: cubit.courantImageIndex == index
                              ? ColorsManager.lightCoralColor
                              : theme.disabledColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
