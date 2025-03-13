import 'package:country_app/data/repository/country_repository_impl.dart';
import 'package:country_app/domain/model/country_model.dart';
import 'package:dartz/dartz.dart';

class GetCountryOfflineUsecase {
  final CountryRepositoryImpl countryRepository;
  GetCountryOfflineUsecase(this.countryRepository);

  Future<Either<Exception, List<CountryModel>>> call() async {
    return await countryRepository.getCountriesOffline();
  }
}
