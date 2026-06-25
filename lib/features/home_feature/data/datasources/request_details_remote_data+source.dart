import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:property_inspector/core/constans.dart';
import 'package:property_inspector/features/home_feature/data/models/request_details_model.dart';

class RequestDetailsRemoteDataSource {
  final http.Client client;

  RequestDetailsRemoteDataSource(this.client);

  Future<RequestDetailsModel> getDetails({
    required String requestId,
    required String token,
  }) async {
    final response = await client.get(
      Uri.parse('$baseUrl/api/v1/requests/$requestId'),
      headers: {'Authorization': 'Bearer $token'},
    );

    final body = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return RequestDetailsModel.fromJson(body['data']);
    }

    throw Exception(body['message'] ?? 'Unknown error');
  }
}
