import 'package:property_inspector/features/auth_feature/data/datasources/auth_remote_data_source.dart';
import 'package:property_inspector/features/auth_feature/data/models/employee_model.dart';

class AuthRepository {
  final AuthRemoteDataSource remote;

  AuthRepository(this.remote);

  Future<AuthResponseModel> login(String email, String password) {
    return remote.login(email: email, password: password);
  }
}
