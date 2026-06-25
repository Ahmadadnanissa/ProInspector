import 'package:flutter/foundation.dart';
import 'package:property_inspector/core/services/local_storage_services.dart';

import 'package:property_inspector/features/home_feature/data/models/request_model.dart';
import 'package:property_inspector/features/home_feature/domain/usecases/get_requests_use_case.dart';

class RequestProvider extends ChangeNotifier {
  final GetRequestsUseCase getRequestsUseCase;

  RequestProvider(this.getRequestsUseCase);

  List<RequestModel> requests = [];

  bool isLoading = false;

  String? error;

  String currentFilter = "PENDING";

  Future<void> fetchRequests(String status) async {
    final token = EmployeeLocalStorageService.getToken();

    if (token == null) {
      error = "Token not found";
      notifyListeners();
      return;
    }

    try {
      currentFilter = status;

      isLoading = true;
      error = null;
      notifyListeners();

      requests = await getRequestsUseCase.execute(token: token, status: status);
    } catch (e) {
      error = e.toString();
      debugPrint(error);
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  void clearRequests() {
    requests.clear();
    notifyListeners();
  }
}

// import 'package:flutter/foundation.dart';
// import 'package:property_inspector/features/home_feature/data/models/request_model.dart';

// class RequestProvider extends ChangeNotifier {
//   List<RequestModel> requests = [];

//   bool isLoading = false;

//   String? error;

//   String currentFilter = "PENDING";

//   Future<void> fetchRequests(String status) async {
//     try {
//       currentFilter = status;

//       isLoading = true;
//       error = null;

//       notifyListeners();

//       await Future.delayed(const Duration(milliseconds: 500));

//       requests = [
//         RequestModel(
//           id: "1",
//           clientName: "Ahmad Issa",
//           propertyType: "Apartment",
//           status: status,
//           expectedPrice: 250000,
//           date: DateTime.now().toIso8601String(),
//           clientImage: "",
//         ),
//         RequestModel(
//           id: "2",
//           clientName: "Mohammad Ali",
//           propertyType: "Villa",
//           status: status,
//           expectedPrice: 450000,
//           date: DateTime.now().toIso8601String(),
//           clientImage: "",
//         ),
//       ];

//       notifyListeners();
//     } catch (e) {
//       error = e.toString();
//       debugPrint(error);
//     } finally {
//       isLoading = false;
//       notifyListeners();
//     }
//   }

//   void clearRequests() {
//     requests.clear();
//     notifyListeners();
//   }
// }
