import 'package:country_app/core/constants.dart';
import 'package:dio/dio.dart';

class GraphQLService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: baseUrl, // Replace with your endpoint
      connectTimeout: Duration(seconds: 10),
      receiveTimeout: Duration(seconds: 10),
    ),
  );

  Future<Map<String, dynamic>?> query(
    String query, {
    Map<String, dynamic>? variables,
  }) async {
    try {
      final response = await _dio.post(
        '',
        data: {'query': query, 'variables': variables},
      );

      if (response.statusCode == 200) {
        return response.data['data']; // GraphQL data comes under 'data'
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      print('GraphQL Error: $e');
      return null;
    }
  }
}
