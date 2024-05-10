import 'package:flutter/material.dart';
import 'package:space_x/core/widget/failure_widget.dart';

import '../../../logic/rockets/rockets_cubit.dart';

class RocketsFailureWidget extends StatelessWidget {
  final String message;
  const RocketsFailureWidget(this.message, {super.key});

  @override
  Widget build(BuildContext context) {
    RocketsCubit rocketsCubit = RocketsCubit.get(context);

    return SizedBox(
      height: 200,
      child: Center(
        child: FailureWidget(
            message: message,
            onPressed: () {
              rocketsCubit.emitRocketsState();
            }),
      ),
    );
  }
}
