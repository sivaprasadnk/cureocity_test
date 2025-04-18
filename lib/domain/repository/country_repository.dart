import 'package:country_app/domain/model/country_model.dart';
import 'package:dartz/dartz.dart';

abstract class CountryRepository {
  Future<Either<Exception, List<CountryModel>>> getCountriesOnline();
  Future<Either<Exception, List<CountryModel>>> getCountriesOffline();
  Future addToLocalDB(List<CountryModel> countryList);
  Future<Either<Exception, List<CountryModel>>> searchCountriesOffline(
    String name,
  );
}
