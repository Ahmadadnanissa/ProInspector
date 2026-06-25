import 'package:flutter/material.dart';
import 'package:property_inspector/core/services/local_storage_services.dart';

import 'package:property_inspector/features/home_feature/data/models/request_details_model.dart';
import 'package:property_inspector/features/home_feature/domain/usecases/get_request_details_use_Case.dart';

class RequestDetailsProvider extends ChangeNotifier {
  final GetRequestDetailsUseCase getRequestDetailsUseCase;

  RequestDetailsProvider(this.getRequestDetailsUseCase);

  RequestDetailsModel? _data;

  RequestDetailsModel? get data => _data;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  String? _error;

  String? get error => _error;

  Future<void> fetchDetails(String requestId) async {
    try {
      _isLoading = true;
      _error = null;

      notifyListeners();

      final token = EmployeeLocalStorageService.getToken();

      if (token == null || token.isEmpty) {
        throw Exception('Authentication token not found');
      }

      _data = await getRequestDetailsUseCase(
        requestId: requestId,
        token: token,
      );
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void clear() {
    _data = null;
    _error = null;
    notifyListeners();
  }
}

// import 'package:flutter/material.dart';
// import 'package:property_inspector/features/home_feature/data/models/request_details_model.dart';

// class RequestDetailsProvider extends ChangeNotifier {
//   RequestDetailsModel? _data;

//   RequestDetailsModel? get data => _data;

//   bool _isLoading = false;

//   bool get isLoading => _isLoading;

//   String? _error;

//   String? get error => _error;

//   Future<void> fetchDetails(String requestId) async {
//     _isLoading = true;

//     _error = null;

//     notifyListeners();

//     await Future.delayed(const Duration(seconds: 1));

//     _data = RequestDetailsModel(
//       title: 'Luxury Apartment',

//       type: 'Apartment',

//       price: 250000,

//       status: 'SELL',

//       images: [
//         'assets/images/jay-solomon-8lU54uEl8Ok-unsplash.jpg',
//         'assets/images/don-kaveen-NFbwes_e-jI-unsplash.jpg',
//         'assets/images/lotus-design-n-print-0sDzRgrN_pI-unsplash.jpg',
//         'assets/images/john-fornander-y3_AHHrxUBY-unsplash.jpg',
//       ],

//       rooms: 4,

//       baths: 2,

//       sqft: 180,

//       location: 'Damascus',

//       latitude: 33.5138,

//       longitude: 36.2765,

//       features: {
//         'heating': true,
//         'parking': true,
//         'furnished': true,
//         'swimming_pool': false,
//       },
//     );

//     _isLoading = false;

//     notifyListeners();
//   }

//   void clear() {
//     _data = null;
//     _error = null;
//     notifyListeners();
//   }
// }
