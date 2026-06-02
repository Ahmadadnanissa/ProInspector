import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/request_model.dart';

class RequestRemoteDataSource {
  final http.Client client;

  RequestRemoteDataSource(this.client);

  Future<List<RequestModel>> getRequests({
    required String token,
    required String status,
  }) async {
    final response = await client.get(
      Uri.parse("YOUR_URL/api/v1/requests/myRequests?status=$status"),
      headers: {
        "Authorization": "Bearer $token",
        "Content-Type": "application/json",
      },
    );

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);

      final List requests = json['data'];

      return requests.map((e) => RequestModel.fromJson(e)).toList();
    }

    throw Exception("Failed to load requests");
  }
}
