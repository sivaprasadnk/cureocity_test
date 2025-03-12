import 'package:country_app/core/constants.dart';
import 'package:country_app/data/model/country_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

abstract class LocalDataSource {
  Future addToLocalDB(List<CountryModel> countryList);
}

class LocalDataSourceImpl extends LocalDataSource {
  @override
  Future addToLocalDB(List<CountryModel> countryList) async {
    var box = await Hive.openBox<CountryModel>(countryBox);
    for (var country in countryList) {
      box.add(country);
    }

    debugPrint(" ocuntry db length :${countryList.length}");
    box.clear();
  }
}
