import 'package:flutter/material.dart';
import 'package:property_inspector/features/property_inspection_feature/presentation/widgets/outdoor_type_option.dart';

class OutdoorTypeDropdown extends StatelessWidget {
  const OutdoorTypeDropdown({
    super.key,
    required this.selectedValue,
    required this.onChanged,
  });

  final OutdoorTypeOption? selectedValue;

  final Function(OutdoorTypeOption?) onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<OutdoorTypeOption>(
      value: selectedValue,
      decoration: InputDecoration(
        hintText: 'Select Outdoor Type',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
      items: outdoorTypes.map((type) {
        return DropdownMenuItem(value: type, child: Text(type.displayName));
      }).toList(),
      onChanged: onChanged,
      validator: (value) {
        if (value == null) {
          return 'Please select outdoor type';
        }
        return null;
      },
    );
  }
}
