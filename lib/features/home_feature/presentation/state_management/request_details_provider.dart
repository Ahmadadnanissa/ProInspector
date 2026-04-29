import 'package:flutter/material.dart';
import 'package:property_inspector/features/home_feature/data/models/request_details_model.dart';
import 'package:property_inspector/features/home_feature/domain/repository/request_details_repository_impl.dart';

class RequestDetailsProvider extends ChangeNotifier {
  final RequestDetailsRepositoryImpl repo;

  RequestDetailsProvider(this.repo);

  RequestDetailsModel? data;
  bool isLoading = false;
  String? error;

  Future<void> fetchDetails(int id) async {
    isLoading = true;
    error = null;
    notifyListeners();

    try {
      data = await repo.getDetails(id);
    } catch (e) {
      error = e.toString();
    }

    isLoading = false;
    notifyListeners();
  }
}
