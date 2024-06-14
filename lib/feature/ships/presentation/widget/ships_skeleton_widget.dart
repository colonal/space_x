import 'package:flutter/material.dart';
import 'package:space_x/core/extensions/theme_extensions.dart';
import 'package:space_x/core/widget/loading_animation_widget.dart';

class ShipsSkeletonWidget extends StatelessWidget {
  const ShipsSkeletonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      itemCount: 5,
      separatorBuilder: (context, index) => const SizedBox(height: 20),
      itemBuilder: (context, index) => Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: context.theme.disabledColor,
          ),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                  height: 200,
                  width: double.infinity,
                  child: LoadingAnimationWidget(
                      borderRadius: BorderRadius.circular(15))),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(
                  3,
                  (index) => SizedBox(
                    height: 20,
                    width: 50,
                    child: LoadingAnimationWidget(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 20,
                width: 100,
                child: LoadingAnimationWidget(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              const SizedBox(height: 5),
              SizedBox(
                height: 20,
                width: 150,
                child: LoadingAnimationWidget(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: 20,
                        width: 100,
                        child: LoadingAnimationWidget(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        height: 20,
                        width: 100,
                        child: LoadingAnimationWidget(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 20,
                        width: 100,
                        child: LoadingAnimationWidget(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        height: 20,
                        width: 100,
                        child: LoadingAnimationWidget(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
