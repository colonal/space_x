import 'package:flutter/material.dart';
import 'package:space_x/core/extensions/theme_extensions.dart';
import 'package:space_x/core/widget/loading_animation_widget.dart';

class ShipsSkeletonWidget extends StatelessWidget {
  const ShipsSkeletonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height,
      width: MediaQuery.sizeOf(context).height,
      child: Column(
        children: [
          const SizedBox(height: 20),
          SizedBox(
            height: 80,
            width: double.infinity,
            child: Row(
              children: [
                _numberOfLauncherState(),
                const VerticalDivider(),
                _numberOfLauncherState(),
                const VerticalDivider(),
                _numberOfLauncherState(),
              ],
            ),
          ),
          const SizedBox(height: 30),
          Expanded(
            child: ListView.separated(
              itemCount: 3,
              shrinkWrap: true,
              separatorBuilder: (context, index) => const SizedBox(height: 15),
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => Card(
                borderOnForeground: true,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                shadowColor: context.theme.disabledColor,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: context.theme.disabledColor,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      SizedBox(
                        height: 165,
                        width: 100,
                        child: LoadingAnimationWidget(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 20,
                              width: 70,
                              child: LoadingAnimationWidget(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            const SizedBox(height: 5),
                            SizedBox(
                              height: 20,
                              width: 100,
                              child: LoadingAnimationWidget(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                SizedBox(
                                  height: 20,
                                  width: 40,
                                  child: LoadingAnimationWidget(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                SizedBox(
                                  height: 20,
                                  width: 100,
                                  child: LoadingAnimationWidget(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            SizedBox(
                              height: 50,
                              width: double.infinity,
                              child: LoadingAnimationWidget(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Expanded _numberOfLauncherState() {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 20,
            width: 100,
            child: LoadingAnimationWidget(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          const SizedBox(height: 5),
          SizedBox(
            height: 15,
            width: 100,
            child: LoadingAnimationWidget(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ],
      ),
    );
  }
}
