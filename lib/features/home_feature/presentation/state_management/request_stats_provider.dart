import 'package:flutter/material.dart';
import 'package:property_inspector/features/home_feature/data/models/request_stats_model.dart';
import 'package:property_inspector/features/home_feature/domain/repository/request_stats_repository_impl.dart';

class RequestStatsProvider extends ChangeNotifier {
  final RequestStatsRepositoryImpl repo;

  RequestStatsProvider(this.repo);

  RequestStatsModel? stats;
  bool isLoading = false;

  Future<void> fetchStats() async {
    isLoading = true;
    notifyListeners();

    try {
      stats = await repo.getStats();
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }

    isLoading = false;
    notifyListeners();
  }
}
