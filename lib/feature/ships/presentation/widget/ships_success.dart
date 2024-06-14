import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../data/model/ships_model.dart';
import 'ships_item_widget.dart';

class ShipsSuccess extends StatelessWidget {
  final List<ShipsModel> ships;
  const ShipsSuccess(this.ships, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      itemCount: ships.length,
      separatorBuilder: (context, index) => const SizedBox(height: 20),
      itemBuilder: (context, index) => ShipsItemWidget(ship: ships[index]),
    );
  }
}
