import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:country_app/core/dio_client.dart';
import 'package:country_app/data/data_source/remote_datasource.dart';
import 'package:country_app/data/repository/country_repository_impl.dart';
import 'package:country_app/domain/use_cases/get_country_usecase.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;
void setup() {
  locator.registerSingleton<Dio>(Dio());
  locator.registerSingleton<Connectivity>(Connectivity());

  locator.registerSingleton<DioClient>(DioClient(locator(), locator()));
  locator.registerSingleton<RemoteDatasourceImpl>(
    RemoteDatasourceImpl(locator()),
  );

  locator.registerSingleton<CountryRepositoryImpl>(
    CountryRepositoryImpl(locator(), locator()),
  );

  locator.registerSingleton<GetCountryUsecase>(GetCountryUsecase(locator()));
}
