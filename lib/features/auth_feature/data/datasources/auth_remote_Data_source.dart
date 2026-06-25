import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:property_inspector/features/auth_feature/data/models/employee_model.dart';

class AuthRemoteDataSource {
  final String baseUrl;

  AuthRemoteDataSource({required this.baseUrl});

  Future<AuthResponseModel> login({
    required String email,
    required String password,
  }) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/v1/auth/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({"email": email, "password": password}),
    );

    final data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      print(data);
      return AuthResponseModel.fromJson(data);
    } else {
      throw Exception(data['message'] ?? 'Login failed');
    }
  }
}
