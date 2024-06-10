import 'dart:convert';

import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:pokemon_challenge/data/exceptions/api_exception.dart';

class ApiService {
  final ChuckerHttpClient client;
  final String baseUrl;

  ApiService({required this.client, required this.baseUrl});

  Future<dynamic> get({
    required String endpoint,
    Map<String, dynamic>? queryParams,
    bool useBaseUrl = true,
  }) async {
    final uri =
        Uri.parse(useBaseUrl ? '$baseUrl/$endpoint' : endpoint).replace(queryParameters: queryParams);

    return _makeRequest(() async => client.get(uri, headers: _getHeaders()));
  }

  Map<String, String> _getHeaders() {
    return {
      'Content-Type': 'application/json',
    };
  }

  Future<dynamic> _makeRequest(
      Future<http.Response> Function() requestFunction) async {
    http.Response response = await requestFunction();
    return _processResponse(response);
  }

  dynamic _processResponse(http.Response response) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return json.decode(utf8.decode(response.bodyBytes));
    } else {
      final Map<String, dynamic> errorData =
          json.decode(utf8.decode(response.bodyBytes));

      throw ApiException(
        errorData['message'],
      );
    }
  }
}
