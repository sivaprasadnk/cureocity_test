import 'package:country_app/core/constants.dart';
import 'package:country_app/data/model/country_model.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

abstract class LocalDataSource {
  Future addToLocalDB(List<CountryModel> countryList);
  Future<List<CountryModel>> getCountries();
  Future<List<CountryModel>> searchCountries(String name);
}

class LocalDataSourceImpl extends LocalDataSource {
  @override
  Future addToLocalDB(List<CountryModel> countryList) async {
    var box = await Hive.openBox<CountryModel>(countryBox);
    await box.clear();
    for (var country in countryList) {
      box.add(country);
    }
  }
  
  @override
  Future<List<CountryModel>> searchCountries(String name) async {
    var list = <CountryModel>[];
    var box = await Hive.openBox<CountryModel>(countryBox);
    for (var country in box.values.toList()) {
      if (name.toLowerCase().contains(country.name!.toLowerCase())) {
        list.add(country);
      }
    }
    if (name.isEmpty) {
      return box.values.toList();
    }
    return list;
  }

  @override
  Future<List<CountryModel>> getCountries() async {
    var box = await Hive.openBox<CountryModel>(countryBox);
    return box.values.toList();
  }
}
