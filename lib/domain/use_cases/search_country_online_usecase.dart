import 'package:country_app/data/repository/country_repository_impl.dart';

class SearchCountryOnlineUsecase {
  final CountryRepositoryImpl countryRepository;
  SearchCountryOnlineUsecase(this.countryRepository);

  Future call(name) async {
    return await countryRepository.searchCountriesOnline(name);
  }
}
