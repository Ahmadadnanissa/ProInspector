import 'package:flutter/material.dart';
import 'package:property_inspector/core/widgets/button.dart';
import 'package:property_inspector/features/home_feature/presentation/state_management/schedule_provider.dart';
import 'package:property_inspector/features/home_feature/presentation/widgets/schedule_card.dart';
import 'package:provider/provider.dart';

class BodySchedulePage extends StatelessWidget {
  const BodySchedulePage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ScheduleProvider>();

    final dateTimeString = provider.getDateTimeString();

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const SizedBox(height: 20),

          // ================= DATE =================
          ScheduleCard(
            icon: Icons.calendar_month_rounded,
            title: "Visit Date",
            value: provider.selectedDate == null
                ? "Choose date"
                : "${provider.selectedDate!.day}/${provider.selectedDate!.month}/${provider.selectedDate!.year}",
            onTap: () => provider.pickDate(context),
          ),

          const SizedBox(height: 16),

          // ================= TIME =================
          ScheduleCard(
            icon: Icons.access_time_rounded,
            title: "Visit Time",
            value: provider.selectedTime == null
                ? "Choose time"
                : provider.selectedTime!.format(context),
            onTap: () => provider.pickTime(context),
          ),

          const SizedBox(height: 30),

          // ================= PREVIEW (SAFE) =================
          if (dateTimeString != null)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Theme.of(
                  context,
                ).colorScheme.primary.withValues(alpha: 0.08),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  const Icon(Icons.event_available, size: 40),

                  const SizedBox(height: 10),

                  const Text(
                    "Selected Appointment",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 6),

                  Text(dateTimeString, textAlign: TextAlign.center),
                ],
              ),
            ),

          const SizedBox(height: 40),

          // ================= BUTTON =================
          PrimaryButton(
            name: 'Done',
            pushing: () {
              final scheduledAt = provider.getDateTimeString();

              if (scheduledAt == null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Please select date and time first"),
                  ),
                );
                return;
              }

              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
