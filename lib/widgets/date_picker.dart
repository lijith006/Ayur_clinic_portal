// import 'package:flutter/material.dart';

// class DatePickerField extends StatefulWidget {
//   final String label;
//   final String hintText;
//   final DateTime? selectedDate;
//   final Function(DateTime) onDateSelected;

//   const DatePickerField({
//     super.key,
//     required this.label,
//     required this.hintText,
//     this.selectedDate,
//     required this.onDateSelected,
//   });

//   @override
//   State<DatePickerField> createState() => _DatePickerFieldState();
// }

// class _DatePickerFieldState extends State<DatePickerField> {
//   late TextEditingController _controller;

//   @override
//   void initState() {
//     super.initState();
//     _controller = TextEditingController(
//       text: widget.selectedDate != null
//           ? "${widget.selectedDate!.day.toString().padLeft(2, '0')}/"
//                 "${widget.selectedDate!.month.toString().padLeft(2, '0')}/"
//                 "${widget.selectedDate!.year}"
//           : "",
//     );
//   }

//   Future<void> _pickDate() async {
//     DateTime? pickedDate = await showDatePicker(
//       context: context,
//       initialDate: widget.selectedDate ?? DateTime.now(),
//       firstDate: DateTime(2000),
//       lastDate: DateTime(2100),
//     );

//     if (pickedDate != null) {
//       setState(() {
//         _controller.text =
//             "${pickedDate.day.toString().padLeft(2, '0')}/"
//             "${pickedDate.month.toString().padLeft(2, '0')}/"
//             "${pickedDate.year}";
//       });
//       widget.onDateSelected(pickedDate);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: _pickDate,
//       child: AbsorbPointer(
//         child: TextFormField(
//           controller: _controller,
//           decoration: InputDecoration(
//             labelText: widget.label,
//             hintText: widget.hintText,
//             suffixIcon: const Icon(Icons.calendar_today),
//             border: const OutlineInputBorder(),
//           ),
//         ),
//       ),
//     );
//   }
// }
