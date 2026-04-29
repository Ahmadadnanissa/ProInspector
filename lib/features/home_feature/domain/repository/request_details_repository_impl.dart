import 'package:property_inspector/features/home_feature/data/datasources/request_details_remote_data+source.dart';
import 'package:property_inspector/features/home_feature/data/models/request_details_model.dart';

class RequestDetailsRepositoryImpl {
  final RequestDetailsRemoteDataSource remote;

  RequestDetailsRepositoryImpl(this.remote);

  Future<RequestDetailsModel> getDetails(int id) {
    return remote.getDetails(id);
  }
}
