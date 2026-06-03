import 'package:flutter/material.dart';

class ScheduleProvider extends ChangeNotifier {
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  // =========================
  // اختيار التاريخ
  // =========================
  Future<void> pickDate(BuildContext context) async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    );

    if (pickedDate != null) {
      selectedDate = pickedDate;
      notifyListeners();
    }
  }

  // =========================
  // اختيار الوقت
  // =========================
  Future<void> pickTime(BuildContext context) async {
    final pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      selectedTime = pickedTime;
      notifyListeners();
    }
  }

  // =========================
  // دمج التاريخ + الوقت
  // =========================
  DateTime? getSelectedDateTime() {
    if (selectedDate == null || selectedTime == null) {
      return null;
    }

    return DateTime(
      selectedDate!.year,
      selectedDate!.month,
      selectedDate!.day,
      selectedTime!.hour,
      selectedTime!.minute,
    );
  }

  // =========================
  // تحويله لنص API
  // =========================
  String? getDateTimeString() {
    final dateTime = getSelectedDateTime();

    if (dateTime == null) return null;

    return dateTime.toIso8601String();
  }

  // =========================
  // إعادة ضبط القيم
  // =========================
  void clear() {
    selectedDate = null;
    selectedTime = null;
    notifyListeners();
  }
}
