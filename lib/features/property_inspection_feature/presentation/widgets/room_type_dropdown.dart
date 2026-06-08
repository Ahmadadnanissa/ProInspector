import 'package:flutter/material.dart';
import 'package:property_inspector/features/property_inspection_feature/presentation/widgets/room_type_option.dart';

class RoomTypeDropdown extends StatelessWidget {
  const RoomTypeDropdown({
    super.key,
    required this.selectedValue,
    required this.onChanged,
  });

  final RoomTypeOption? selectedValue;

  final Function(RoomTypeOption?) onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<RoomTypeOption>(
      value: selectedValue,
      decoration: InputDecoration(
        hintText: 'Select Room Type',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
      items: roomTypes.map((room) {
        return DropdownMenuItem<RoomTypeOption>(
          value: room,
          child: Text(room.displayName),
        );
      }).toList(),
      onChanged: onChanged,
      validator: (value) {
        if (value == null) {
          return 'Please select room type';
        }
        return null;
      },
    );
  }
}
