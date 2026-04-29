class RequestDetailsModel {
  final String title;
  final String type;
  final double price;
  final String status;
  final List<String> images;
  final int rooms;
  final int baths;
  final int sqft;
  final Map<String, bool> features;
  final String location;
  final double latitude;
  final double longitude;

  RequestDetailsModel({
    required this.latitude,
    required this.longitude,
    required this.title,
    required this.type,
    required this.price,
    required this.status,
    required this.images,
    required this.rooms,
    required this.baths,
    required this.sqft,
    required this.features,
    required this.location,
  });

  factory RequestDetailsModel.fromJson(Map<String, dynamic> json) {
    return RequestDetailsModel(
      title: json['title'] ?? '',
      type: json['type'] ?? '',
      price: (json['price'] ?? 0).toDouble(),
      status: json['status'] ?? '',
      images: List<String>.from(json['images'] ?? []),
      rooms: json['rooms'] ?? 0,
      baths: json['baths'] ?? 0,
      sqft: json['sqft'] ?? 0,

      /// 🔥 smart parsing للـ features
      features: Map<String, bool>.from(json['features']),

      location: json['location'] ?? '',

      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
    );
  }
}
