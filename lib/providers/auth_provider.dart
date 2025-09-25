import 'package:flutter/material.dart';
import 'package:ayur_clinic_portal/core/api_client.dart';
import 'package:ayur_clinic_portal/core/secure_storage_service.dart';

class AuthProvider extends ChangeNotifier {
  final ApiClient apiClient;
  final SecureStorageService storage;

  bool _loading = false;
  bool get loading => _loading;

  String? _token;
  String? get token => _token;

  AuthProvider(this.apiClient, this.storage);

  Future<bool> login(String username, String password) async {
    _loading = true;
    notifyListeners();

    try {
      final response = await apiClient.post(
        '/Login',
        body: {'username': username, 'password': password},
      );
      debugPrint('Login response: $response');
      if (response['token'] != null) {
        _token = response['token'];

        // Save token securely
        await storage.write('auth_token', _token!);

        _loading = false;
        notifyListeners();
        return true;
      } else {
        _loading = false;
        notifyListeners();
        return false;
      }
    } catch (e) {
      debugPrint('Login error: $e');

      _loading = false;
      notifyListeners();
      return false;
    }
  }

  Future<void> logout() async {
    _token = null;
    await storage.delete('auth_token');
    notifyListeners();
  }

  Future<void> loadToken() async {
    _token = await storage.read('auth_token');
    notifyListeners();
  }
}
