import 'package:flutter/material.dart';

import '../../../../core/widget/failure_widget.dart';
import '../../logic/launches_cubit.dart';

class LaunchesFailureWidget extends StatelessWidget {
  final String message;
  const LaunchesFailureWidget(this.message, {super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Center(
          child: SizedBox(
            height: constraints.maxHeight * .5,
            child: FailureWidget(
              message: message,
              onPressed: () {
                LaunchesCubit.get(context).emitLaunchesState();
              },
            ),
          ),
        );
      },
    );
  }
}
