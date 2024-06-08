import 'package:flutter/material.dart';

import '../../data/model/company_model.dart';
import 'company_ceo_cto_info.dart';
import 'company_footer.dart';
import 'company_links.dart';
import 'company_logos.dart';
import 'company_main_info.dart';
import 'company_space_x_info.dart';
import 'company_logo.dart';
import 'company_header.dart';

class CompanySuccessWidget extends StatelessWidget {
  final CompanyModel company;
  const CompanySuccessWidget(this.company, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const CompanyHeader(),
            const CompanyLogo(),
            const SizedBox(height: 30),
            CompanyMainInfo(company: company),
            const SizedBox(height: 40),
            CompanyCeoCtoInfo(company: company),
            const SizedBox(height: 30),
            const CompanyLogos(),
            const SizedBox(height: 30),
            CompanySpaceXInfo(company: company),
            const SizedBox(height: 30),
            CompanyLinks(company: company),
            const SizedBox(height: 30),
            CompanyFooter(company: company),
          ],
        ),
      ),
    );
  }
}
