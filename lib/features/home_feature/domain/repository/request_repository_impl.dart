import 'package:property_inspector/features/home_feature/data/datasources/request_reomte_data_source.dart';
import 'package:property_inspector/features/home_feature/data/models/request_model.dart';

class RequestRepositoryImpl {
  final RequestRemoteDataSource remote;

  RequestRepositoryImpl(this.remote);

  Future<List<RequestModel>> getRequests(String status) {
    return remote.getRequests(status);
  }
}
