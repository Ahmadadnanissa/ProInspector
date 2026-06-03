import '../../data/models/request_details_model.dart';
import '../repository/request_details_repository_impl.dart';

class GetRequestDetailsUseCase {
  final RequestDetailsRepositoryImpl repository;

  GetRequestDetailsUseCase(this.repository);

  Future<RequestDetailsModel> call({
    required String requestId,
    required String token,
  }) {
    return repository.getDetails(requestId: requestId, token: token);
  }
}
