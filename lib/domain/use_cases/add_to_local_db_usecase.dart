import 'package:country_app/data/model/country_model.dart';
import 'package:country_app/data/repository/country_repository_impl.dart';

class AddToLocalDbUsecase {
  final CountryRepositoryImpl countryRepository;
  AddToLocalDbUsecase(this.countryRepository);

  Future<void> call(List<CountryModel> countryList) async {
    await countryRepository.addToLocalDB(countryList);
  }
}
