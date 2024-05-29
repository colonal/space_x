import 'package:flutter/material.dart';

import '../../../../core/widget/failure_widget.dart';
import '../../logic/crew_cubit.dart';

class CrewFailureWidget extends StatelessWidget {
  final String message;
  const CrewFailureWidget(this.message, {super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Center(
          child: SizedBox(
            height: constraints.maxHeight * .5,
            child: FailureWidget(
              onPressed: () {
                CrewCubit.get(context).emitCrewState();
              },
              message: message,
            ),
          ),
        );
      },
    );
  }
}
