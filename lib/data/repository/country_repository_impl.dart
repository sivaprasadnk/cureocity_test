import 'package:country_app/data/data_source/local_data_source.dart';
import 'package:country_app/data/data_source/remote_datasource.dart';
import 'package:country_app/data/model/country_model.dart';
import 'package:country_app/domain/repository/country_repository.dart';
import 'package:dartz/dartz.dart';

class CountryRepositoryImpl extends CountryRepository {
  final RemoteDatasourceImpl remoteDatasource;
  final LocalDataSourceImpl localDataSource;
  CountryRepositoryImpl(this.remoteDatasource, this.localDataSource);

  @override
  Future<Either<Exception, List<CountryModel>>> getCountriesOnline() async {
    try {
      final List<CountryModel> list = await remoteDatasource.getCountries();
      return Right(list);
    } catch (e) {
      return Left(e as Exception);
    }
  }

  @override
  Future<Either<Exception, List<CountryModel>>> getCountriesOffline() async {
    try {
      final List<CountryModel> list = await localDataSource.getCountries();
      return Right(list);
    } catch (e) {
      return Left(e as Exception);
    }
  }
  
  @override
  Future addToLocalDB(List<CountryModel> countryList) async {
    try {
      return await localDataSource.addToLocalDB(countryList);
    } catch (err) {
      throw Exception(err.toString());
    }
  }
 

  @override
  Future<Either<Exception, List<CountryModel>>> searchCountriesOffline(
    String name,
  ) async {
    try {
      final List<CountryModel> list = await localDataSource.searchCountries(
        name,
      );
      return Right(list);
    } catch (e) {
      return Left(e as Exception);
    }
  }
  
}
