import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../constants/assets.dart';

class FailureWidget extends StatelessWidget {
  final String? message;
  final void Function() onPressed;

  const FailureWidget({this.message, required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        return SizedBox(
          width: constraints.maxWidth,
          height: constraints.maxHeight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Image.asset(
                  AssetsImages.noInternetGif,
                ),
              ),
              SizedBox(height: constraints.maxWidth * .01),
              Text(
                message ?? "common.tryAgain".tr(),
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              SizedBox(height: constraints.maxWidth * .01),
              ElevatedButton(
                onPressed: onPressed,
                child: Text("common.tryAgain".tr()),
              ),
            ],
          ),
        );
      }),
    );
  }
}
