import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CompanyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CompanyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text("company.title".tr()),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
