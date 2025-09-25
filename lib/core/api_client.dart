import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ayur_clinic_portal/core/secure_storage_service.dart';

class ApiClient {
  static const String baseUrl = 'https://flutter-amr.noviindus.in/api';
  final SecureStorageService storage;

  ApiClient(this.storage);

  Future<Map<String, dynamic>> post(
    String endpoint, {
    Map<String, String>? body,
  }) async {
    final url = Uri.parse('$baseUrl$endpoint');
    final token = await storage.read('auth_token');

    final headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/x-www-form-urlencoded',
      if (token != null) 'Authorization': 'Bearer $token',
    };

    final response = await http.post(url, body: body, headers: headers);

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed POST: ${response.body}');
    }
  }

  Future<Map<String, dynamic>> get(String endpoint) async {
    final url = Uri.parse('$baseUrl$endpoint');
    final token = await storage.read('auth_token');

    final headers = {
      'Accept': 'application/json',
      if (token != null) 'Authorization': 'Bearer $token',
    };

    final response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed GET: ${response.body}');
    }
  }
}
