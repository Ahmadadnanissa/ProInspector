import 'package:property_inspector/features/auth_feature/data/models/employee_model.dart';
import 'package:property_inspector/features/auth_feature/domain/repository/auth_repository.dart';

class LoginUseCase {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  Future<AuthResponseModel> call(String email, String password) {
    return repository.login(email, password);
  }
}
