import 'package:http/http.dart' as http;
import 'package:property_inspector/features/home_feature/data/models/request_stats_model.dart';

class RequestStatsRemoteDataSource {
  final http.Client client;

  RequestStatsRemoteDataSource(this.client);

  Future<RequestStatsModel> getRequests() async {
    await Future.delayed(Duration(milliseconds: 500)); // simulate loading

    return RequestStatsModel(
      newCount: 10,
      progressCount: 12,
      completedCount: 17,
      rejectedCount: 3,
    );
  }
}
