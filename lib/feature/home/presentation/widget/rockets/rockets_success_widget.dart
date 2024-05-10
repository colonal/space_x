import 'package:flutter/material.dart';

import '../../../data/model/rockets_response.dart';
import '../../../logic/rockets/rockets_cubit.dart';
import 'rockets_counter_item_widget.dart';
import 'rockets_item_widget.dart';

class RocketsSuccessWidget extends StatelessWidget {
  final List<RocketsResponse> rockets;
  const RocketsSuccessWidget(this.rockets, {super.key});

  @override
  Widget build(BuildContext context) {
    RocketsCubit rocketsCubit = RocketsCubit.get(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 200,
          child: PageView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: rockets.length,
            onPageChanged: (value) {
              rocketsCubit.onChangeImage(value);
            },
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: RocketsItemWidget(rockets[index]),
              );
            },
          ),
        ),
        const SizedBox(height: 15),
        RocketsCounterItemWidget(rockets.length),
      ],
    );
  }
}
