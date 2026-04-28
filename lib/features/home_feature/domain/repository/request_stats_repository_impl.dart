import 'package:property_inspector/features/home_feature/data/datasources/request_stats_reomte_data_source.dart';
import 'package:property_inspector/features/home_feature/data/models/request_stats_model.dart';

class RequestStatsRepositoryImpl {
  final RequestStatsRemoteDataSource remote;

  RequestStatsRepositoryImpl(this.remote);

  Future<RequestStatsModel> getStats() {
    return remote.getRequests();
  }
}
