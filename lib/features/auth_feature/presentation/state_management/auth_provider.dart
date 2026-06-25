import 'package:flutter/material.dart';
import 'package:property_inspector/core/services/local_storage_services.dart';
import 'package:property_inspector/features/auth_feature/domain/usecases/login_use_case.dart';

class EmployeeAuthProvider extends ChangeNotifier {
  final LoginUseCase loginUseCase;

  EmployeeAuthProvider(this.loginUseCase);

  bool isLoading = false;
  String? errorMessage;

  Future<bool> login(String email, String password) async {
    try {
      isLoading = true;
      errorMessage = null;
      notifyListeners();

      final response = await loginUseCase.call(email, password);

      // 🔐 Save locally
      await EmployeeLocalStorageService.saveToken(response.token);
      await EmployeeLocalStorageService.saveEmployee(
        id: response.employee.id,
        name: response.profile.name,
        email: response.employee.email,
        photo: response.profile.photo,
      );

      isLoading = false;
      notifyListeners();

      return true;
    } catch (e) {
      print("LOGIN ERROR = $e");

      isLoading = false;

      errorMessage = _handleError(e.toString());

      notifyListeners();

      return false;
    }
  }

  String _handleError(String error) {
    if (error.contains('401')) return 'بيانات الدخول غير صحيحة';
    if (error.contains('500')) return 'مشكلة بالسيرفر حاول لاحقاً';
    return 'حدث خطأ غير متوقع';
  }
}
