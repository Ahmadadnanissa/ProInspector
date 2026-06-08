class HeatingOption {
  final String apiValue;
  final String displayName;

  const HeatingOption({required this.apiValue, required this.displayName});
}

const List<HeatingOption> heatingOptions = [
  HeatingOption(apiValue: 'AVAILABLE', displayName: 'Available'),
  HeatingOption(apiValue: 'NOT_AVAILABLE', displayName: 'Not Available'),
];
