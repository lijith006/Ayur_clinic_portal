import 'package:flutter/material.dart';

class TreatmentCard extends StatelessWidget {
  final String? title;
  final String? details;
  final bool hasError;
  final VoidCallback onAddTreatments;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;
  final int? maleCount;
  final int? femaleCount;

  const TreatmentCard({
    Key? key,
    this.title,
    this.details,
    this.hasError = false,
    required this.onAddTreatments,
    this.onEdit,
    this.onDelete,
    this.maleCount,
    this.femaleCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Treatments Section Title
        const Padding(
          padding: EdgeInsets.only(bottom: 16.0),
          child: Text(
            'Treatments',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Color(0xFF333333),
            ),
          ),
        ),

        // Treatment Card
        if (title != null || (maleCount != null && femaleCount != null)) ...[
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20.0),
            margin: const EdgeInsets.only(bottom: 16.0),
            decoration: BoxDecoration(
              color: const Color(0xFFF5F5F5),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Treatment title row
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        '1.   ${title ?? 'Couple Combo package i..'}',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF000000),
                        ),
                      ),
                    ),
                    // Delete button
                    GestureDetector(
                      onTap: onDelete ?? () {},
                      child: Container(
                        width: 32,
                        height: 32,
                        decoration: const BoxDecoration(
                          color: Color(0xFFE57373),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.close,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Male and Female count row
                Row(
                  children: [
                    // Male section
                    Row(
                      children: [
                        const Text(
                          'Male',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF2E7D32),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Container(
                          width: 40,
                          height: 32,
                          decoration: BoxDecoration(
                            border: Border.all(color: const Color(0xFFD0D0D0)),
                            borderRadius: BorderRadius.circular(6),
                            color: Colors.white,
                          ),
                          child: Center(
                            child: Text(
                              (maleCount ?? 0).toString(),
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF333333),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 40),

                    // Female section
                    Row(
                      children: [
                        const Text(
                          'Female',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF2E7D32),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Container(
                          width: 40,
                          height: 32,
                          decoration: BoxDecoration(
                            border: Border.all(color: const Color(0xFFD0D0D0)),
                            borderRadius: BorderRadius.circular(6),
                            color: Colors.white,
                          ),
                          child: Center(
                            child: Text(
                              (femaleCount ?? 0).toString(),
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF333333),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),

                    // Edit button
                    GestureDetector(
                      onTap: onEdit ?? onAddTreatments,
                      child: Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(
                            color: const Color(0xFF2E7D32),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: const Icon(
                          Icons.edit,
                          color: Color(0xFF2E7D32),
                          size: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],

        // Add Treatments Button
        SizedBox(
          width: double.infinity,
          height: 56,
          child: ElevatedButton(
            onPressed: onAddTreatments,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFC8E6C9),
              foregroundColor: const Color(0xFF2E7D32),
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text(
              '+ Add Treatments',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xFF2E7D32),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
