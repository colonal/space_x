import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:space_x/core/extensions/navigator_extensions.dart';
import 'package:space_x/core/extensions/style_extensions.dart';
import 'package:space_x/core/extensions/theme_extensions.dart';

import '../../../data/model/topics_model.dart';

class TopicsItemWidget extends StatelessWidget {
  final Topics topics;
  const TopicsItemWidget(this.topics, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: context.theme.disabledColor,
        ),
        borderRadius: BorderRadius.circular(25),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(25),
        splashColor: context.theme.disabledColor,
        onTap: () {
          context.push(topics.routes);
        },
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Container(
              width: constraints.maxWidth,
              height: constraints.minHeight,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                image: DecorationImage(
                  image: AssetImage(topics.image),
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                ),
              ),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withOpacity(.5),
                      Colors.black.withOpacity(1),
                    ],
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      topics.title.tr(),
                      style: context.font20WhiteMedium,
                    ),
                    const SizedBox(height: 10),
                    Flexible(
                      child: Text(
                        topics.message.tr(),
                        textAlign: TextAlign.center,
                        style: context.font12WhiteLight,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
