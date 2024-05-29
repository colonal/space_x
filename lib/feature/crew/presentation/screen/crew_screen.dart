import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/crew_cubit.dart';
import '../../logic/crew_state.dart';
import '../widget/crew_failure_widget.dart';
import '../widget/crew_widget.dart';
import '../widget/crew_loading_widget.dart';

class CrewScreen extends StatelessWidget {
  const CrewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CrewCubit, CrewState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text("crew.title".tr()),
          ),
          body: state.when(
            loading: () => const CrewLoadingWidget(),
            success: () => const CrewWidget(),
            error: (message) => CrewFailureWidget(message),
          ),
        );
      },
    );
  }
}
