import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/extensions/style_extensions.dart';
import '../../../logic/rockets/rockets_cubit.dart';
import '../../../logic/rockets/rockets_state.dart';
import 'rockets_failure_widget.dart';
import 'rockets_loading_widget.dart';
import 'rockets_success_widget.dart';

class RocketsWidget extends StatelessWidget {
  const RocketsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RocketsCubit, RocketsState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "home.rockets".tr(),
              style: context.font14BlueBold,
            ),
            const SizedBox(height: 20),
            state.when(
              loading: () => const RocketsLoadingWidget(),
              success: (data) => RocketsSuccessWidget(data),
              error: (error) => RocketsFailureWidget(error),
            )
          ],
        );
      },
    );
  }
}
