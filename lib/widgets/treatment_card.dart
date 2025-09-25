// import 'package:ayur_clinic_portal/core/constants.dart';
// import 'package:flutter/material.dart';

// class TreatmentCard extends StatelessWidget {
//   final String title;
//   final String details;
//   final bool hasError;
//   final VoidCallback? onAddTreatments;

//   const TreatmentCard({
//     Key? key,
//     required this.title,
//     required this.details,
//     this.hasError = false,
//     this.onAddTreatments,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       color: AppColors.inputBackground,
//       margin: const EdgeInsets.symmetric(vertical: 8.0),
//       child: ListTile(
//         title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
//         subtitle: Text(details),
//         trailing: hasError
//             ? Icon(Icons.close, color: AppColors.errorRed, size: 20.0)
//             : const SizedBox.shrink(),
//         tileColor: hasError ? AppColors.errorRed.withOpacity(0.1) : null,
//         onTap: onAddTreatments,
//       ),
//     );
//   }
// }
// import 'package:ayur_clinic_portal/core/constants.dart';
// import 'package:ayur_clinic_portal/widgets/treatment_modal.dart';
// import 'package:flutter/material.dart';

// class TreatmentCard extends StatelessWidget {
//   final String title;
//   final String details;
//   final bool hasError;
//   final VoidCallback? onAddTreatments;
//   final VoidCallback? onEdit;

//   const TreatmentCard({
//     Key? key,
//     required this.title,
//     required this.details,
//     this.hasError = false,
//     this.onAddTreatments,
//     this.onEdit,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     // Parse details to extract male and female counts (e.g., "Male: 2  Female: 2")
//     final detailsParts = details.split('  ');
//     final malePart = detailsParts[0].split(': ')[1]; // e.g., "2"
//     final femalePart = detailsParts[1].split(': ')[1]; // e.g., "2"

//     return Card(
//       color: AppColors.inputBackground,
//       margin: const EdgeInsets.symmetric(vertical: 8.0),
//       child: ListTile(
//         //title
//         title: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
//             //Error icon
//             if (hasError)
//               Container(
//                 width: 24.0,
//                 height: 24.0,
//                 decoration: const BoxDecoration(
//                   color: AppColors.errorRed,
//                   shape: BoxShape.circle,
//                 ),
//                 child: const Icon(
//                   Icons.close,
//                   color: AppColors.backgroundWhite,
//                   size: 16.0,
//                 ),
//               )
//             else
//               const SizedBox.shrink(),
//           ],
//         ),
//         subtitle: Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     children: [
//                       Text(detailsParts[0]), // e.g., "Male: 2"
//                       const SizedBox(width: 60),
//                       Text(detailsParts[1]), // e.g., "Female: 2"
//                       const SizedBox(width: 60),
//                       IconButton(
//                         icon: const Icon(
//                           Icons.edit,
//                           color: AppColors.primaryGreen,
//                           size: 18.0,
//                         ),
//                         onPressed:
//                             onEdit ??
//                             () {
//                               showDialog(
//                                 context: context,
//                                 builder: (context) => TreatmentModal(
//                                   initialTreatment:
//                                       title.split('...')[0] + '...',
//                                   initialMaleCount: int.parse(malePart),
//                                   initialFemaleCount: int.parse(femalePart),
//                                 ),
//                               );
//                             },
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:ayur_clinic_portal/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:ayur_clinic_portal/widgets/treatment_modal.dart';

class TreatmentCard extends StatelessWidget {
  final String title;
  final String details;
  final bool hasError;
  final VoidCallback? onAddTreatments;
  final VoidCallback? onEdit;

  const TreatmentCard({
    Key? key,
    required this.title,
    required this.details,
    this.hasError = false,
    this.onAddTreatments,
    this.onEdit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Parse details to extract male and female counts (e.g., "Male: 2  Female: 2")
    final detailsParts = details.split('  ');
    final malePart = detailsParts[0].split(': ')[1]; // e.g., "2"
    final femalePart = detailsParts[1].split(': ')[1]; // e.g., "2"

    return Card(
      color: AppColors.inputBackground,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        // Use Row for title to include the error icon on the same line
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
            if (hasError)
              Container(
                width: 24.0,
                height: 24.0,
                decoration: const BoxDecoration(
                  color: AppColors.errorRed,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.close,
                  color: AppColors.backgroundWhite,
                  size: 16.0,
                ),
              )
            else
              const SizedBox.shrink(),
          ],
        ),
        subtitle: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(detailsParts[0]), // e.g., "Male: 2"
                      const SizedBox(width: 60),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const SizedBox(
                            height: 4.0,
                          ), // Align with title row height
                          Row(
                            children: [
                              Text(detailsParts[1]), // e.g., "Female: 2"
                              const SizedBox(width: 4.0),
                              if (hasError)
                                IconButton(
                                  icon: const Icon(
                                    Icons.edit,
                                    color: AppColors.primaryGreen,
                                    size: 18.0,
                                  ),
                                  onPressed:
                                      onEdit ??
                                      () {
                                        showDialog(
                                          context: context,
                                          builder: (context) => TreatmentModal(
                                            initialTreatment:
                                                title.split('...')[0] + '...',
                                            initialMaleCount: int.parse(
                                              malePart,
                                            ),
                                            initialFemaleCount: int.parse(
                                              femalePart,
                                            ),
                                          ),
                                        );
                                      },
                                ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        tileColor: hasError ? AppColors.errorRed.withOpacity(0.1) : null,
        onTap: onAddTreatments,
      ),
    );
  }
}
