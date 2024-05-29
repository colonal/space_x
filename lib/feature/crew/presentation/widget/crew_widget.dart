import 'package:flutter/material.dart';

import '../../logic/crew_cubit.dart';
import 'crew_item_widget.dart';

class CrewWidget extends StatelessWidget {
  const CrewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = CrewCubit.get(context);
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 8.0, // spacing between rows
        crossAxisSpacing: 8.0, // spacing between columns
        childAspectRatio: 1 / 2,
        crossAxisCount: 2,
      ),
      padding: const EdgeInsets.all(8.0),
      itemCount: cubit.crews.length,
      itemBuilder: (context, index) {
        return CrewItemWidget(crew: cubit.crews[index]);
      },
    );
  }
}
