import 'package:country_app/data/model/country_model.dart';

class CountryState {
  List<CountryModel>? countryList;
  bool? isLoading;
  bool? isError;
  CountryState({
    this.isLoading = false,
    this.countryList = const [],
    this.isError = false,
  });

  CountryState copyWith({
    List<CountryModel>? countryModelList,
    bool? loadingState,
    bool? errorState,
  }) {
    return CountryState(
      countryList: countryModelList ?? countryList,
      isLoading: loadingState ?? isLoading,
      isError: errorState ?? isError,
    );
  }
}
