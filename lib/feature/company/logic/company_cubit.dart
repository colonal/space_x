import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../data/repositories/company_repository.dart';
import 'company_state.dart';

class CompanyCubit extends Cubit<CompanyState> {
  final CompanyRepository _repository;
  final PackageInfo _packageInfo;
  CompanyCubit(
      {required CompanyRepository repository, required PackageInfo packageInfo})
      : _repository = repository,
        _packageInfo = packageInfo,
        super(const CompanyState.loading());

  factory CompanyCubit.get(context) => BlocProvider.of<CompanyCubit>(context);

  void emitCompanyState() async {
    emit(const CompanyState.loading());

    final response = await _repository.company();

    response.when(
      success: (data) {
        emit(CompanyState.success(data));
      },
      failure: (error) {
        emit(CompanyState.error(message: error.apiErrorModel.message ?? ""));
      },
    );
  }

  String summarizeVehicles(double price, {int decimals = 2}) {
    if (price < 1000) {
      return price.toStringAsFixed(decimals);
    } else if (price < 1000000) {
      return "${(price / 1000)} K";
    } else if (price < 1000000000) {
      return "${(price / 1000000)} M";
    } else {
      return "${(price / 1000000000)} B";
    }
  }

  String getAppName() {
    return _packageInfo.appName;
  }

  String getAppVersion() {
    return _packageInfo.version;
  }
}
