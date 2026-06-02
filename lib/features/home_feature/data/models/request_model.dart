class RequestModel {
  final String id;
  final String clientName;
  final String propertyType;
  final String status;
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
    final client = json['client'] ?? {};
    final sellData = json['sellData'] ?? {};

    return RequestModel(
      id: json['id'] ?? '',

      clientName: client['name'] ?? '',

      propertyType: sellData['type'] ?? '',

      status: json['status'] ?? '',

      expectedPrice: (sellData['price'] as num?)?.toDouble() ?? 0,

      date: json['createdAt'] ?? '',

      clientImage: client['photo'] ?? '',
    );
  }
}
