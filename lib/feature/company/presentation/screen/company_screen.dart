import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_x/feature/company/presentation/widget/company_loading_widget.dart';

import '../../data/model/company_model.dart';
import '../../logic/company_cubit.dart';
import '../../logic/company_state.dart';
import '../widget/company_failure_widget.dart';
import '../widget/company_success_widget.dart';

class CompanyScreen extends StatelessWidget {
  const CompanyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CompanyCubit, CompanyState>(
      builder: (context, state) {
        return state.when(
          loading: () => const CompanyLoadingWidget(),
          success: (CompanyModel company) => CompanySuccessWidget(company),
          error: (String error) => CompanyFailureWidget(error),
        );
      },
    );
  }
}
