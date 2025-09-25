import 'package:ayur_clinic_portal/core/constants.dart';
import 'package:flutter/material.dart';

class PatientCard extends StatelessWidget {
  final String name;
  final String package;
  final String date;
  final String time;
  final VoidCallback? onViewDetails;

  const PatientCard({
    Key? key,
    required this.name,
    required this.package,
    required this.date,
    required this.time,
    this.onViewDetails,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.cardBackground,
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
      child: ListTile(
        title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(package, overflow: TextOverflow.ellipsis),
            SizedBox(height: 15),
            Row(
              children: [
                const Icon(
                  Icons.calendar_today,
                  size: 16.0,
                  color: AppColors.dateColor,
                ),
                const SizedBox(width: 4.0),
                Text(date, style: TextStyle(color: AppColors.dateColor)),
                const SizedBox(width: 4.0),
                Text(date, style: TextStyle(color: AppColors.dateColor)),
              ],
            ),

            const Divider(thickness: 1, color: Colors.grey),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('View Booking Details'),

                IconButton(
                  icon: const Icon(Icons.chevron_right),
                  onPressed: onViewDetails,
                ),
              ],
            ),
          ],
        ),

        // trailing: IconButton(
        //   icon: const Icon(Icons.chevron_right),
        //   onPressed: onViewDetails,
        // ),
      ),
    );
  }
}
