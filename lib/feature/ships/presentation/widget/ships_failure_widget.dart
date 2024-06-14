import 'package:flutter/material.dart';

import '../../../../core/widget/failure_widget.dart';
import '../../logic/ships_cubit.dart';

class ShipsFailureWidget extends StatelessWidget {
  final String message;
  const ShipsFailureWidget(this.message, {super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Center(
          child: SizedBox(
            height: constraints.maxHeight * .5,
            child: FailureWidget(
              onPressed: () {
                ShipsCubit.get(context).emitShipsState();
              },
              message: message,
            ),
          ),
        );
      },
    );
  }
}
