import 'package:country_app/core/constants.dart';
import 'package:country_app/data/entity/country_entity.dart';
import 'package:country_app/domain/model/country_model.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

abstract class LocalDataSource {
  Future addToLocalDB(List<CountryModel> countryList);
  Future<List<CountryModel>> getCountries();
  Future<List<CountryModel>> searchCountries(String name);
}

class LocalDataSourceImpl extends LocalDataSource {
  @override
  Future addToLocalDB(List<CountryModel> countryList) async {
    var box = await Hive.openBox<CountryEntity>(countryBox);
    await box.clear();
    for (var country in countryList) {
      var countryModel = CountryEntity.fromModel(country);
      box.add(countryModel);
    }
  }

  @override
  Future<List<CountryModel>> searchCountries(String name) async {
    var box = await Hive.openBox<CountryEntity>(countryBox);

    if (name.isEmpty) {
      return box.values.toList().map((e) => e.toModel()).toList();
    }

    var list =
        box.values
            .where(
              (country) =>
                  country.name.toLowerCase().contains(name.toLowerCase()),
            )
            .toList();

    return list.map((e) => e.toModel()).toList();
  }

  @override
  Future<List<CountryModel>> getCountries() async {
    var box = await Hive.openBox<CountryEntity>(countryBox);
    return box.values.toList().map((e) => e.toModel()).toList();
  }
}
