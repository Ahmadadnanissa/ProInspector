import 'package:flutter/material.dart';
import 'package:property_inspector/features/property_inspection_feature/presentation/widgets/furnishing_option.dart';

class FurnishingDropdown extends StatelessWidget {
  const FurnishingDropdown({
    super.key,
    required this.selectedValue,
    required this.onChanged,
  });

  final FurnishingOption? selectedValue;

  final Function(FurnishingOption?) onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<FurnishingOption>(
      value: selectedValue,
      decoration: InputDecoration(
        hintText: 'Select Furnishing',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
      items: furnishingOptions.map((item) {
        return DropdownMenuItem(value: item, child: Text(item.displayName));
      }).toList(),
      onChanged: onChanged,
    );
  }
}
