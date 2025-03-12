import 'package:country_app/core/locator.dart';
import 'package:country_app/domain/use_cases/get_country_usecase.dart';
import 'package:country_app/presentation/bloc/country_bloc/country_event.dart';
import 'package:country_app/presentation/bloc/country_bloc/country_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CountryBloc extends Bloc<CountryEvent, CountryState> {
  CountryBloc() : super(CountryState()) {
    on(addCountry);
  }

  addCountry(AddCountryEvent event, Emitter<CountryState> emit) async {
    emit(state.copyWith(loadingState: true, errorState: false));
    var response = await locator<GetCountryUsecase>().call();
    response.fold(
      (exc) {
        emit(
          state.copyWith(
            loadingState: false,
            errorState: true,
            countryModelList: [],
          ),
        );
      },
      (data) {
        emit(
          state.copyWith(
            loadingState: false,
            errorState: false,
            countryModelList: data,
          ),
        );
      },
    );
  }
}
