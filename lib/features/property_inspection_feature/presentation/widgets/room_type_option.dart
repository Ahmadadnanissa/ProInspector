class RoomTypeOption {
  final String apiValue;
  final String displayName;

  const RoomTypeOption({required this.apiValue, required this.displayName});
}

const List<RoomTypeOption> roomTypes = [
  RoomTypeOption(apiValue: 'MASTER_BEDROOM', displayName: 'Master Bedroom'),
  RoomTypeOption(apiValue: 'BEDROOM', displayName: 'Bedroom'),
  RoomTypeOption(apiValue: 'LIVING_ROOM', displayName: 'Living Room'),
  RoomTypeOption(apiValue: 'DINING_ROOM', displayName: 'Dining Room'),
  RoomTypeOption(apiValue: 'KITCHEN', displayName: 'Kitchen'),
  RoomTypeOption(apiValue: 'BATHROOM', displayName: 'Bathroom'),
  RoomTypeOption(apiValue: 'POWDER_ROOM', displayName: 'Powder Room'),
  RoomTypeOption(apiValue: 'LAUNDRY_ROOM', displayName: 'Laundry Room'),
  RoomTypeOption(apiValue: 'OFFICE', displayName: 'Office'),
];
