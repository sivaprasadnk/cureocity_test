import 'package:country_app/core/dio_client.dart';
import 'package:country_app/data/model/country_model.dart';

abstract class RemoteDatasource {
  Future<List<CountryModel>> getCountries();
  Future<List<CountryModel>> searchCountries(String name);
}

class RemoteDatasourceImpl extends RemoteDatasource {
  final DioClient dio;
  RemoteDatasourceImpl(this.dio);

  @override
  Future<List<CountryModel>> getCountries() async {
    const String query = '''
    query {
      countries {
        code
        name
        emoji
      }
    }
    ''';
    var response = await dio.query(query);
    if (response != null) {
      var list = response['countries'] as List;
      var countryList = list.map((e) => CountryModel.fromJson(e)).toList();
      return countryList;
    } else {
      return [];
    }
  }

  @override
  Future<List<CountryModel>> searchCountries(String name) async {
    const String query = '''
    query GetCountries(\$name: String!) {
      countries {
        code
        name
        emoji
      }
    }
    ''';

    var response = await dio.query(query, variables: {'name': name});

    if (response != null) {
      var list = response['countries'] as List;
      var countryList =
          list
              .map((e) => CountryModel.fromJson(e))
              .where(
                (country) =>
                    country.name?.toLowerCase().contains(name.toLowerCase()) ??
                    false,
              )
              .toList();

      return countryList;
    } else {
      return [];
    }
  }
}
