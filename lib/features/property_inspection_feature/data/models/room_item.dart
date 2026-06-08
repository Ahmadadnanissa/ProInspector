import 'balcony_data.dart';

class RoomItem {
  final String type;

  final double size;

  final String description;

  final String paintDescription;

  final List<String> photos;

  final bool hasBalcony;

  final BalconyData? balconyData;

  final Map<String, dynamic>? data;

  const RoomItem({
    required this.type,
    required this.size,
    required this.description,
    required this.paintDescription,
    required this.photos,
    required this.hasBalcony,
    this.balconyData,
    this.data,
  });

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'size': size,
      'data': data,
      'photos': photos,
      'description': description,
      'paintDescription': paintDescription,
      'hasBalcony': hasBalcony,
      'balconyData': balconyData?.toJson(),
    };
  }
}
