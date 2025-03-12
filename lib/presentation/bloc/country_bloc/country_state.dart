import 'package:country_app/data/model/country_model.dart';

class CountryState {
  List<CountryModel>? countryList;
  bool? isLoading;
  bool? isError;
  String? errorMessage;
  CountryState({
    this.isLoading = false,
    this.countryList = const [],
    this.isError = false,
    this.errorMessage = "",
  });

  CountryState copyWith({
    List<CountryModel>? countryModelList,
    bool? loadingState,
    bool? errorState,
    String? error,
  }) {
    return CountryState(
      countryList: countryModelList ?? countryList,
      isLoading: loadingState ?? isLoading,
      isError: errorState ?? isError,
      errorMessage: error ?? errorMessage,
    );
  }
}
