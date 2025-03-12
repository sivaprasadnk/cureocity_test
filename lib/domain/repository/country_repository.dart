import 'package:country_app/data/model/country_model.dart';
import 'package:dartz/dartz.dart';

abstract class CountryRepository {
  Future<Either<Exception, List<CountryModel>>> getCountriesOnline();
  Future<Either<Exception, List<CountryModel>>> getCountriesOffline();
  Future addToLocalDB(List<CountryModel> countryList);
  Future<Either<Exception, List<CountryModel>>> searchCountriesOnline(
    String name,
  );
  Future<Either<Exception, List<CountryModel>>> searchCountriesOffline(
    String name,
  );
}
