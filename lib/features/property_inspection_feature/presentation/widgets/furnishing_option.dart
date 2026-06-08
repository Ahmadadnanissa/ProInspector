class FurnishingOption {
  final String apiValue;
  final String displayName;

  const FurnishingOption({required this.apiValue, required this.displayName});
}

const List<FurnishingOption> furnishingOptions = [
  FurnishingOption(apiValue: 'FULLY_FURNISHED', displayName: 'Fully Furnished'),
  FurnishingOption(apiValue: 'SEMI_FURNISHED', displayName: 'Semi Furnished'),
  FurnishingOption(apiValue: 'UNFURNISHED', displayName: 'Unfurnished'),
];
