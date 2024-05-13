import 'package:flutter/material.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../../core/helpers/event_bus.dart';

class RocketsCounterItemWidget extends StatelessWidget {
  final int itemsLength;
  const RocketsCounterItemWidget(this.itemsLength, {super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return StreamBuilder(
      stream: eventBus.on<ChangeRocketsImage>(),
      builder: (context, snapshot) {
        return SizedBox(
          height: 5,
          child: Align(
            alignment: Alignment.center,
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: itemsLength,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Center(
                child: CircleAvatar(
                  radius: 5,
                  backgroundColor: (snapshot.data?.index ?? 0) == index
                      ? ColorsManager.lightCoralColor
                      : theme.disabledColor,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
