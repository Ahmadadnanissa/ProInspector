// import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:property_inspector/features/home_feature/data/models/request_details_model.dart';

// class RequestDetailsRemoteDataSource {
//   final http.Client client;

//   RequestDetailsRemoteDataSource(this.client);

//   Future<RequestDetailsModel> getDetails(int id) async {
//     final response = await client.get(Uri.parse("YOUR_API_ENDPOINT"));

//     if (response.statusCode == 200) {
//       return RequestDetailsModel.fromJson(json.decode(response.body));
//     } else {
//       throw Exception("Failed to load details");
//     }
//   }
// }

class RequestDetailsRemoteDataSource {
  final http.Client client;

  RequestDetailsRemoteDataSource(this.client);

  Future<RequestDetailsModel> getDetails(int id) async {
    await Future.delayed(Duration(seconds: 1)); // simulate loading

    final mockData = _mockDatabase[id];

    if (mockData != null) {
      return RequestDetailsModel.fromJson(mockData);
    } else {
      throw Exception("Request not found");
    }
  }

  /// 🔥 Mock Database
  final Map<int, Map<String, dynamic>> _mockDatabase = {
    1: {
      "title": "Modern Apartment",
      "type": "Apartment",
      "price": 120000,
      "status": "Available",
      "images": [
        "assets/images/jay-solomon-8lU54uEl8Ok-unsplash.jpg",
        "assets/images/don-kaveen-NFbwes_e-jI-unsplash.jpg",
        "assets/images/lotus-design-n-print-0sDzRgrN_pI-unsplash.jpg",
        "assets/images/john-fornander-y3_AHHrxUBY-unsplash.jpg",
      ],
      "rooms": 3,
      "baths": 2,
      "sqft": 120,
      "features": {"WiFi": true, "Parking": true, "Elevator": false},
      "location": "Damascus, Syria",
      "latitude": 33.5138,
      "longitude": 36.2765,
    },

    2: {
      "title": "Luxury Villa",
      "type": "Villa",
      "price": 450000,
      "status": "Sold",
      "images": [
        "assets/images/jay-solomon-8lU54uEl8Ok-unsplash.jpg",
        "assets/images/don-kaveen-NFbwes_e-jI-unsplash.jpg",
        "assets/images/lotus-design-n-print-0sDzRgrN_pI-unsplash.jpg",
        "assets/images/john-fornander-y3_AHHrxUBY-unsplash.jpg",
      ],
      "rooms": 5,
      "baths": 4,
      "sqft": 350,
      "features": {"Pool": true, "Garden": true, "Garage": true},
      "location": "Dubai, UAE",
      "latitude": 25.2048,
      "longitude": 55.2708,
    },

    3: {
      "title": "Small Studio",
      "type": "Studio",
      "price": 50000,
      "status": "Pending",
      "images": [],
      "rooms": 1,
      "baths": 1,
      "sqft": 45,
      "features": {"WiFi": true, "Air Conditioning": false},
      "location": "Homs, Syria",
      "latitude": 34.7308,
      "longitude": 36.7090,
    },
  };
}
