import 'package:country_app/data/repository/country_repository_impl.dart';

class SearchCountryOfflineUsecase {
  final CountryRepositoryImpl countryRepository;
  SearchCountryOfflineUsecase(this.countryRepository);

  Future call(name) async {
    return await countryRepository.searchCountriesOffline(name);
  }
}
