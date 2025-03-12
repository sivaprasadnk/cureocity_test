import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:country_app/core/dio_client.dart';
import 'package:country_app/data/data_source/local_data_source.dart';
import 'package:country_app/data/data_source/remote_datasource.dart';
import 'package:country_app/data/repository/country_repository_impl.dart';
import 'package:country_app/domain/use_cases/add_to_local_db_usecase.dart';
import 'package:country_app/domain/use_cases/get_country_offline_usecase.dart';
import 'package:country_app/domain/use_cases/get_country_online_usecase.dart';
import 'package:country_app/domain/use_cases/search_country_offline_usecase.dart';
import 'package:country_app/domain/use_cases/search_country_online_usecase.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;
void setup() {
  locator.registerSingleton<Dio>(Dio());
  locator.registerSingleton<Connectivity>(Connectivity());
  locator.registerSingleton<DioClient>(DioClient(locator(), locator()));

  /// remote data source
  locator.registerSingleton<RemoteDatasourceImpl>(
    RemoteDatasourceImpl(locator()),
  );
  /// remote local source
  locator.registerSingleton<LocalDataSourceImpl>(LocalDataSourceImpl());

  /// repository impl
  locator.registerSingleton<CountryRepositoryImpl>(
    CountryRepositoryImpl(locator(), locator()),
  );

  /// use cases
  locator.registerSingleton<GetCountryOnlineUsecase>(
    GetCountryOnlineUsecase(locator()),
  );
  locator.registerSingleton<GetCountryOfflineUsecase>(
    GetCountryOfflineUsecase(locator()),
  );
  locator.registerSingleton<SearchCountryOfflineUsecase>(
    SearchCountryOfflineUsecase(locator()),
  );
  locator.registerSingleton<SearchCountryOnlineUsecase>(
    SearchCountryOnlineUsecase(locator()),
  );
  locator.registerSingleton<AddToLocalDbUsecase>(
    AddToLocalDbUsecase(locator()),
  );
}
