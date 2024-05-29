import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/assets.dart';
import '../../../../core/constants/routes_constants.dart';
import '../../data/model/topics_model.dart';
import 'topics_state.dart';

class TopicsCubit extends Cubit<TopicsState> {
  TopicsCubit() : super(TopicsState.initial());

  factory TopicsCubit.get(context) => BlocProvider.of<TopicsCubit>(context);

  List<Topics> get data => const [
        Topics(
          image: AssetsImages.topicsCrew,
          title: "home.topics.crew.title",
          message: "home.topics.crew.message",
          routes: Routes.crewRoute,
        ),
      ];
}