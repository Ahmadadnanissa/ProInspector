class BalconyData {
  final double sizeSqft;

  const BalconyData({required this.sizeSqft});

  Map<String, dynamic> toJson() {
    return {'size_sqft': sizeSqft};
  }
}
