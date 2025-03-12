import 'dart:async';

import 'package:country_app/core/constants.dart';
import 'package:dio/dio.dart';

class DioClient {
  final Dio _dio;

  DioClient(this._dio) {
    _dio
      .options = BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        headers: {'Content-Type': 'application/json'},
      )
      ;
  }


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
        return response
            .data['data']; // GraphQL response data comes under 'data'
      } else {
        throw Exception(
          'GraphQL query failed with status code: ${response.statusCode}',
        );
      }
    } catch (e) {
      print('GraphQL Error: $e');
      return null;
    }
  }

  Future<List<Map<String, dynamic>>> searchCountry(String name) async {
    try {
      final response = await _dio.post(
        '',
        data: {
          'query': '''
          query GetCountry(\$name: String!) {
            countries {
              code
              name
              emoji
            }
          }
        ''',
          'variables': {'name': name},
        },
      );

      if (response.statusCode == 200) {
        final data = response.data['data']['countries'] as List<dynamic>;

        return data
            .where(
              (country) => (country['name'] as String).toLowerCase().contains(
                name.toLowerCase(),
              ),
            )
            .map((e) => e as Map<String, dynamic>)
            .toList();
      } else {
        throw Exception('Failed to load country data');
      }
    } catch (e) {
      throw Exception('Error fetching country: $e');
  }

  }

}
