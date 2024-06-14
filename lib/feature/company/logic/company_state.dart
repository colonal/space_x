import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/model/company_model.dart';

part 'company_state.freezed.dart';

@Freezed()
class CompanyState with _$CompanyState {
  const factory CompanyState.loading() = _Loading;
  const factory CompanyState.success(CompanyModel company) = _Success;
  const factory CompanyState.error({required String message}) = _Error;
}
