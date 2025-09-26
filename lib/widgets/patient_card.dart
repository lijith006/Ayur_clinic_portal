import 'package:ayur_clinic_portal/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PatientCard extends StatelessWidget {
  final int index;
  final String name;
  final String package;
  final DateTime date;
  final String? time;
  final VoidCallback? onViewDetails;

  const PatientCard({
    Key? key,
    required this.index,
    required this.name,
    required this.package,
    required this.date,
    this.time,
    required this.onViewDetails,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formattedDate = DateFormat('dd/MM/yyyy').format(date);
    return Card(
      color: AppColors.cardBackground,
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Patient name
            Text(
              "${index + 1}. $name",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 6),

            // Package
            Text(
              package,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(color: Colors.black87),
            ),
            const SizedBox(height: 15),

            // Row with Date
            Row(
              children: [
                const Icon(
                  Icons.calendar_today,
                  size: 16.0,
                  color: AppColors.dateColor,
                ),
                const SizedBox(width: 6.0),
                Text(
                  formattedDate,
                  style: const TextStyle(color: AppColors.dateColor),
                ),
                const SizedBox(width: 16.0),
                const Icon(
                  Icons.people,
                  size: 16.0,
                  color: AppColors.dateColor,
                ),
                const SizedBox(width: 6.0),
                const Text(
                  "Jithesh",
                  style: TextStyle(color: AppColors.dateColor),
                ),
              ],
            ),

            const SizedBox(height: 10),
            const Divider(thickness: 1, color: Colors.grey),

            // View Booking Details
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('View Booking Details'),
                IconButton(
                  icon: const Icon(Icons.chevron_right),
                  onPressed: onViewDetails,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
