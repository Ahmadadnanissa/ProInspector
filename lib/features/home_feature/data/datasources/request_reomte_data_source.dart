import 'package:http/http.dart' as http;
import 'package:property_inspector/features/home_feature/data/models/request_model.dart';

class RequestRemoteDataSource {
  final http.Client client;

  RequestRemoteDataSource(this.client);

  Future<List<RequestModel>> getRequests(String status) async {
    await Future.delayed(Duration(milliseconds: 500)); // simulate loading

    final List<RequestModel> allRequests = [
      // 🟢 NEW
      RequestModel(
        id: 1,
        clientName: 'Ali Mostafa',
        propertyType: 'Furnished Apartment',
        status: 'new',
        expectedPrice: 140000,
        date: '23 March 2026',
        clientImage: 'assets/images/person (1).png',
      ),
      RequestModel(
        id: 2,
        clientName: 'Sara Ahmed',
        propertyType: 'Villa',
        status: 'new',
        expectedPrice: 320000,
        date: '22 March 2026',
        clientImage: 'assets/images/person (1).png',
      ),

      // 🟡 PROGRESS
      RequestModel(
        id: 3,
        clientName: 'Omar Khaled',
        propertyType: 'Office',
        status: 'progress',
        expectedPrice: 90000,
        date: '20 March 2026',
        clientImage: 'assets/images/person (1).png',
      ),

      // 🟢 COMPLETED
      RequestModel(
        id: 4,
        clientName: 'Lina Hassan',
        propertyType: 'Shop',
        status: 'completed',
        expectedPrice: 75000,
        date: '18 March 2026',
        clientImage: 'assets/images/person (1).png',
      ),

      // 🔴 REJECTED
      RequestModel(
        id: 5,
        clientName: 'Ahmad Ali',
        propertyType: 'Apartment',
        status: 'rejected',
        expectedPrice: 110000,
        date: '17 March 2026',
        clientImage: 'assets/images/person (1).png',
      ),
    ];

    // 🔥 الفلترة حسب الحالة
    return allRequests.where((request) => request.status == status).toList();
  }

  // final response = await client.get(
  //   Uri.parse("https://your-api.com/requests?status=$status"),
  // );

  // if (response.statusCode == 200) {
  //   final List data = json.decode(response.body);
  //   return data.map((e) => RequestModel.fromJson(e)).toList();
  // } else {
  //   throw Exception("Failed to load requests");
  // }
}
