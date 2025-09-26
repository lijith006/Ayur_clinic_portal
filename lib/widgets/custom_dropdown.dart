import 'package:ayur_clinic_portal/core/constants.dart';
import 'package:flutter/material.dart';

class CustomDropdown extends StatelessWidget {
  final String label;
  final String hintText;
  final List<String> items;
  final String? value;
  final bool isDatePicker;
  final ValueChanged<String?>? onChanged;
  final FormFieldValidator<String?>? validator;
  const CustomDropdown({
    Key? key,
    required this.label,
    required this.hintText,
    required this.items,
    this.value,
    this.onChanged,
    this.isDatePicker = false,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 16.0, color: AppColors.textBlack),
          ),
          const SizedBox(height: 4.0),

          // If date picker is ON
          if (isDatePicker)
            FormField<String>(
              validator: validator,
              initialValue: value,
              builder: (state) {
                return InkWell(
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2100),
                    );
                    if (pickedDate != null && onChanged != null) {
                      final formattedDate =
                          "${pickedDate.day.toString().padLeft(2, '0')}/"
                          "${pickedDate.month.toString().padLeft(2, '0')}/"
                          "${pickedDate.year}";
                      onChanged!(formattedDate);
                      state.didChange(formattedDate);
                    }
                  },
                  child: InputDecorator(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: AppColors.inputBackground,
                      errorText: state.errorText,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 12.0,
                        vertical: 12.0,
                      ),
                    ),
                    child: Text(
                      value ?? hintText,
                      style: const TextStyle(
                        fontSize: 16.0,
                        color: AppColors.textBlack,
                      ),
                    ),
                  ),
                );
              },
            )
          else
            DropdownButtonFormField<String>(
              value: value,
              hint: Text(hintText),
              items: items.map((String item) {
                return DropdownMenuItem<String>(value: item, child: Text(item));
              }).toList(),
              onChanged: onChanged,
              validator: validator,
              decoration: InputDecoration(
                filled: true,
                fillColor: AppColors.inputBackground,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 12.0,
                  vertical: 12.0,
                ),
              ),
              style: const TextStyle(
                fontSize: 16.0,
                color: AppColors.textBlack,
              ),
            ),
        ],
      ),
    );
  }
}
