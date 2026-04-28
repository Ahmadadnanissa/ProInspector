import 'package:flutter/material.dart';
import 'package:property_inspector/features/home_feature/data/models/request_model.dart';
import 'package:property_inspector/features/home_feature/domain/repository/request_repository_impl.dart';

class RequestProvider extends ChangeNotifier {
  final RequestRepositoryImpl repo;

  RequestProvider(this.repo);

  List<RequestModel> requests = [];
  bool isLoading = false;

  String currentFilter = 'new';

  Future<void> fetchRequests(String status) async {
    currentFilter = status;
    isLoading = true;
    notifyListeners();

    try {
      requests = await repo.getRequests(status);
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }

    isLoading = false;
    notifyListeners();
  }
}
