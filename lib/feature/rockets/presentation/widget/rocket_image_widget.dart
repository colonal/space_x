import 'package:flutter/material.dart';

import '../../../../core/widget/image_network_widget.dart';
import '../../data/model/rocket_model.dart';
import '../../logic/rocket_cubit.dart';

class RocketImagesWidget extends StatelessWidget {
  final RocketModel rocket;

  const RocketImagesWidget({required this.rocket, super.key});

  @override
  Widget build(BuildContext context) {
    RocketCubit cubit = RocketCubit.get(context);
    return PageView.builder(
      controller: cubit.pageImageController,
      itemCount: rocket.flickrImages?.length ?? 0,
      onPageChanged: (value) {
        cubit.onChangeRocketImage(value);
      },
      itemBuilder: (context, index) {
        return Container(
          foregroundDecoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black.withOpacity(.8),
                Colors.transparent,
                Colors.black.withOpacity(.8),
              ],
            ),
          ),
          child: Hero(
            tag: rocket.id ?? "",
            child: ImageNetworkWidget(
              rocket.flickrImages![index],
              fit: BoxFit.fill,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
        );
      },
    );
  }
}
