import 'package:country_app/data/model/country_model.dart';
import 'package:country_app/data/repository/country_repository_impl.dart';
import 'package:dartz/dartz.dart';

class GetCountryOnlineUsecase {
  final CountryRepositoryImpl countryRepository;
  GetCountryOnlineUsecase(this.countryRepository);

  Future<Either<Exception, List<CountryModel>>> call() async {
    return await countryRepository.getCountriesOnline();
  }
}
