import 'package:flutter/material.dart';

import '../../../logic/topics/topics_cubit.dart';
import 'topics_item_widget.dart';

class SliverTopicsWidget extends StatelessWidget {
  const SliverTopicsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var data = TopicsCubit.get(context).data;
    return SliverGrid.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 10.0,
        childAspectRatio: 1,
        crossAxisCount: 2,
      ),
      itemCount: data.length,
      itemBuilder: (context, index) {
        return TopicsItemWidget(data[index]);
      },
    );
  }
}
