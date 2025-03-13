import 'package:country_app/core/dio_client.dart';
import 'package:country_app/data/entity/country_entity.dart';

abstract class RemoteDatasource {
  Future<List<CountryEntity>> getCountries();
}

class RemoteDatasourceImpl extends RemoteDatasource {
  final DioClient dio;
  RemoteDatasourceImpl(this.dio);

  @override
  Future<List<CountryEntity>> getCountries() async {
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
      var countryList = list.map((e) => CountryEntity.fromJson(e)).toList();
      return countryList;
    } else {
      return [];
    }
  }

}
