import 'package:country_app/data/model/country_model.dart';
import 'package:dartz/dartz.dart';

abstract class CountryRepository {
  Future<Either<Exception, List<CountryModel>>> getCountries();
  Future addToLocalDB(List<CountryModel> countryList);
}
