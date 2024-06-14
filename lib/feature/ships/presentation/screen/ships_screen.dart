import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/ships_cubit.dart';
import '../../logic/ships_state.dart';
import '../widget/ships_skeleton_widget.dart';
import '../widget/ships_failure_widget.dart';
import '../widget/ships_success.dart';

class ShipsScreen extends StatelessWidget {
  const ShipsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ships.title".tr()),
      ),
      body: BlocBuilder<ShipsCubit, ShipsState>(builder: (context, state) {
        return state.when(
          loading: () => const ShipsSkeletonWidget(),
          success: (data) => ShipsSuccess(data),
          error: (message) => ShipsFailureWidget(message),
        );
      }),
    );
  }
}
