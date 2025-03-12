import 'package:country_app/data/model/country_model.dart';
import 'package:country_app/data/repository/country_repository_impl.dart';
import 'package:dartz/dartz.dart';

class GetCountryUsecase {
  final CountryRepositoryImpl countryRepository;
  GetCountryUsecase(this.countryRepository);

  Future<Either<Exception, List<CountryModel>>> call() async {
    return await countryRepository.getCountries();
  }
}
