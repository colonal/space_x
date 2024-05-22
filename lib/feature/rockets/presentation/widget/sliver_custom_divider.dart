import 'package:flutter/material.dart';

class SliverCustomDivider extends StatelessWidget {
  const SliverCustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return SliverToBoxAdapter(
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          color: theme.scaffoldBackgroundColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Align(
          alignment: Alignment.center,
          child: Container(
            width: 100,
            height: 5,
            decoration: BoxDecoration(
              color: theme.dividerColor,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      ),
    );
  }
}
