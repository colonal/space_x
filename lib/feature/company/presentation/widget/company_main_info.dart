import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:space_x/core/extensions/style_extensions.dart';

import '../../data/model/company_model.dart';
import '../../logic/company_cubit.dart';

class CompanyMainInfo extends StatelessWidget {
  final CompanyModel company;
  const CompanyMainInfo({required this.company, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FittedBox(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: IntrinsicHeight(
              child: Row(
                children: [
                  _showItem(context,
                      message: "${company.employees}",
                      title: "company.employees".tr()),
                  const VerticalDivider(),
                  _showItem(
                    context,
                    message: "${company.launchSites}",
                    title: "company.launch_sites".tr(),
                  ),
                  const VerticalDivider(),
                  _showItem(
                    context,
                    message: "${company.vehicles}",
                    title: "company.vehicles".tr(),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 50),
        _showItem(
          context,
          message: _getVehicles(context, vehicles: company.valuation),
          title: "company.valuation".tr(),
        ),
      ],
    );
  }

  String _getVehicles(context, {required int vehicles}) {
    final value =
        CompanyCubit.get(context).summarizeVehicles(vehicles.toDouble());
    return value;
  }

  Column _showItem(BuildContext context,
      {required String message, required String title}) {
    return Column(
      children: [
        Text(
          message,
          style: context.font24WhiteBold,
        ),
        Text(
          title,
          style: context.font14WhiteLight,
        ),
      ],
    );
  }
}
