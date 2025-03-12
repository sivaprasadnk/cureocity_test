import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:country_app/core/locator.dart';
import 'package:country_app/domain/use_cases/add_to_local_db_usecase.dart';
import 'package:country_app/domain/use_cases/get_country_offline_usecase.dart';
import 'package:country_app/domain/use_cases/get_country_online_usecase.dart';
import 'package:country_app/domain/use_cases/search_country_offline_usecase.dart';
import 'package:country_app/domain/use_cases/search_country_online_usecase.dart';
import 'package:country_app/presentation/bloc/country_bloc/country_event.dart';
import 'package:country_app/presentation/bloc/country_bloc/country_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CountryBloc extends Bloc<CountryEvent, CountryState> {
  CountryBloc() : super(CountryState()) {
    on(getCountry);
    on(searchCountry);
  }

  getCountry(GetCountryEvent event, Emitter<CountryState> emit) async {

    emit(state.copyWith(loadingState: true, errorState: false));
    var connectivityResult = await Connectivity().checkConnectivity();
    bool isOnline = !connectivityResult.contains(ConnectivityResult.none);

    var response =
        isOnline
            ? await locator<GetCountryOnlineUsecase>().call()
            : await locator<GetCountryOfflineUsecase>().call();
    response.fold(
      (exc) {
        emit(
          state.copyWith(
            loadingState: false,
            errorState: true,
            error: exc.toString(),
            countryModelList: [],
          ),
        );
      },
      (data) async {
        emit(
          state.copyWith(
            loadingState: false,
            errorState: false,
            countryModelList: data,
          ),
        );
        try {
          await locator<AddToLocalDbUsecase>().call(data);
        } catch (e) {
          emit(
            state.copyWith(
              errorState: true,
              error: 'Failed to save to local DB: ${e.toString()}',
            ),
          );
        }
      },
    );
  
  }

  searchCountry(SearchCountryEvent event, Emitter<CountryState> emit) async {
    emit(state.copyWith(loadingState: true, errorState: false));

    var connectivityResult = await Connectivity().checkConnectivity();
    bool isOnline = !connectivityResult.contains(ConnectivityResult.none);

    if (isOnline) {
      var response = await locator<SearchCountryOnlineUsecase>().call(
        event.query,
      );
      response.fold(
        (exc) {
          emit(
            state.copyWith(
              loadingState: false,
              errorState: true,
              error: exc.toString(),
              countryModelList: [],
            ),
          );
        },
        (data) async {
          emit(
            state.copyWith(
              loadingState: false,
              errorState: false,
              countryModelList: data,
            ),
          );

          try {
            await locator<AddToLocalDbUsecase>().call(data);
          } catch (e) {
            emit(
              state.copyWith(
                errorState: true,
                error: 'Failed to save to local DB: ${e.toString()}',
              ),
            );
          }
        },
      );
    } else {
      var response = await locator<SearchCountryOfflineUsecase>().call(
        event.query,
      );
      response.fold(
        (exc) {
          emit(
            state.copyWith(
              loadingState: false,
              errorState: true,
              error: exc.toString(),
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
}
