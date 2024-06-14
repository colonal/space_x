import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_x/feature/launches/presentation/widget/launches_success_widget.dart';

import '../../logic/launches_cubit.dart';
import '../widget/launches_failure_widget.dart';
import '../widget/launches_skeleton_widget.dart';

class LaunchesScreen extends StatelessWidget {
  const LaunchesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("launches.title".tr()),
      ),
      body: BlocBuilder<LaunchesCubit, LaunchesState>(
        builder: (context, state) {
          return state.when(
            loading: () => const ShipsSkeletonWidget(),
            success: () => const LaunchesSuccessWidget(),
            error: (String error) => LaunchesFailureWidget(error),
          );
        },
      ),
    );
  }
}
