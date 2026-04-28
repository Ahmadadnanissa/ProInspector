class RequestModel {
  final int id;
  final String clientName;
  final String propertyType;
  final String status; // new, progress, completed, rejected
  final double expectedPrice;
  final String date;
  final String clientImage;

  RequestModel({
    required this.id,
    required this.clientName,
    required this.propertyType,
    required this.status,
    required this.expectedPrice,
    required this.date,
    required this.clientImage,
  });

  factory RequestModel.fromJson(Map<String, dynamic> json) {
    return RequestModel(
      id: json['id'],
      clientName: json['client_name'],
      propertyType: json['property_type'],
      status: json['status'],
      expectedPrice: json['expected_price'].toDouble(),
      date: json['date'],
      clientImage: json['client_image'],
    );
  }
}
