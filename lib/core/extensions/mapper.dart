import '../../feature/home/data/model/rockets_response.dart';
import '../../feature/rockets/data/model/rocket_model.dart';

extension RocketsResponseMapper on RocketsResponse {
  RocketModel toRocketModel() {
    return RocketModel.fromJson(toJson());
  }
}
