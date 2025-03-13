import 'package:country_app/core/dio_client.dart';
import 'package:country_app/data/model/country_model.dart';

abstract class RemoteDatasource {
  Future<List<CountryModel>> getCountries();
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

}
