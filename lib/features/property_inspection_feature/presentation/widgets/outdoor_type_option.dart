class OutdoorTypeOption {
  final String apiValue;
  final String displayName;

  const OutdoorTypeOption({required this.apiValue, required this.displayName});
}

const List<OutdoorTypeOption> outdoorTypes = [
  OutdoorTypeOption(apiValue: 'POOL', displayName: 'Swimming Pool'),
  OutdoorTypeOption(apiValue: 'GARDEN', displayName: 'Garden'),
  OutdoorTypeOption(apiValue: 'OUTDOOR_AREA', displayName: 'Outdoor Area'),
  OutdoorTypeOption(
    apiValue: 'EXTERNAL_GARAGE',
    displayName: 'External Garage',
  ),
];
