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
    required this.latitude,
    required this.longitude,
  });

  factory RequestDetailsModel.fromJson(Map<String, dynamic> json) {
    final sellData = json['sellData'] as Map<String, dynamic>? ?? {};

    return RequestDetailsModel(
      title: sellData['title'] ?? '',

      type: sellData['type'] ?? '',

      price: (sellData['price'] ?? 0).toDouble(),

      status: json['type'] ?? '',

      images: List<String>.from(sellData['images'] ?? []),

      rooms: sellData['rooms'] ?? 0,

      baths: sellData['bathrooms'] ?? 0,

      sqft: sellData['area'] ?? 0,

      location: sellData['location'] ?? '',

      latitude: (sellData['lat'] ?? 0).toDouble(),

      longitude: (sellData['lng'] ?? 0).toDouble(),

      features: {
        'heating': sellData['heating'] ?? false,
        'parking': sellData['parking'] ?? false,
        'furnished': sellData['furnished'] ?? false,
        'swimming_pool': sellData['swimming_pool'] ?? false,
      },
    );
  }
}
