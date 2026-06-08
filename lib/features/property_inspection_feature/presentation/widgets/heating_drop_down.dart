import 'package:flutter/material.dart';
import 'package:property_inspector/features/property_inspection_feature/presentation/widgets/hetating_option.dart';

class HeatingDropdown extends StatelessWidget {
  const HeatingDropdown({
    super.key,
    required this.selectedValue,
    required this.onChanged,
  });

  final HeatingOption? selectedValue;

  final Function(HeatingOption?) onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<HeatingOption>(
      value: selectedValue,
      decoration: InputDecoration(
        hintText: 'Heating',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
      items: heatingOptions.map((item) {
        return DropdownMenuItem(value: item, child: Text(item.displayName));
      }).toList(),
      onChanged: onChanged,
    );
  }
}
