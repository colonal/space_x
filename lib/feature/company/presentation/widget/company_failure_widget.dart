import 'package:flutter/material.dart';

import '../../../../core/widget/failure_widget.dart';
import '../../logic/company_cubit.dart';
import 'company_app_bar.dart';

class CompanyFailureWidget extends StatelessWidget {
  final String message;
  const CompanyFailureWidget(this.message, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CompanyAppBar(),
      body: LayoutBuilder(builder: (context, constraints) {
        return Center(
          child: SizedBox(
            height: constraints.maxHeight * .5,
            child: FailureWidget(
              message: message,
              onPressed: () {
                CompanyCubit.get(context).emitCompanyState();
              },
            ),
          ),
        );
      }),
    );
  }
}
