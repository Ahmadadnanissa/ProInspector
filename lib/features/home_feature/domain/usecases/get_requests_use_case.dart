import 'package:property_inspector/features/home_feature/data/models/request_model.dart';
import 'package:property_inspector/features/home_feature/domain/repository/request_repository_impl.dart';

class GetRequestsUseCase {
  final RequestRepositoryImpl repository;

  GetRequestsUseCase(this.repository);

  Future<List<RequestModel>> execute({
    required String token,
    required String status,
  }) {
    return repository.getRequests(token: token, status: status);
  }
}
