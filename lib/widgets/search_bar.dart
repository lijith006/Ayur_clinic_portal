// import 'package:ayur_clinic_portal/core/constants.dart';
// import 'package:flutter/material.dart';

// class SearchBarWidget extends StatelessWidget {
//   final TextEditingController searchController;
//   final VoidCallback? onSearchPressed;
//   final String sortBy;
//   final VoidCallback? onSortChanged;

//   const SearchBarWidget({
//     Key? key,
//     required this.searchController,
//     this.onSearchPressed,
//     this.sortBy = 'Date',
//     this.onSortChanged,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Column(
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               IconButton(
//                 icon: const Icon(Icons.arrow_back),
//                 onPressed: () => Navigator.pop(context),
//               ),

//               Padding(
//                 padding: const EdgeInsets.only(left: 12.0),
//                 child: Icon(
//                   Icons.notifications,
//                   color: AppColors.iconRed,
//                   size: 24.0,
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 8.0),

//           Row(
//             children: [
//               Expanded(
//                 child: TextField(
//                   controller: searchController,
//                   decoration: InputDecoration(
//                     hintText: 'Search for Treatments',
//                     prefixIcon: const Icon(
//                       Icons.search,
//                       color: AppColors.primaryGreen,
//                     ),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(8.0),
//                       borderSide: const BorderSide(color: Colors.grey),
//                     ),
//                     filled: true,
//                     fillColor: AppColors.backgroundWhite,
//                   ),
//                 ),
//               ),
//               const SizedBox(width: 8),
//               ElevatedButton(
//                 onPressed: () {
//                   // your button action
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: AppColors.primaryGreen,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(8.0),
//                   ),
//                 ),
//                 child: const Text(
//                   "Search",
//                   style: TextStyle(color: AppColors.backgroundWhite),
//                 ),
//               ),
//             ],
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               const Text('Sort by: ', style: TextStyle(fontSize: 16.0)),
//               DropdownButton<String>(
//                 value: sortBy,
//                 items: <String>['Date'].map((String value) {
//                   return DropdownMenuItem<String>(
//                     value: value,
//                     child: Text(value),
//                   );
//                 }).toList(),
//                 onChanged: (String? newValue) {
//                   if (newValue != null && onSortChanged != null)
//                     onSortChanged!();
//                 },
//               ),
//             ],
//           ),
//           Padding(
//             padding: EdgeInsets.zero, // override  padding
//             child: const Divider(thickness: 1, color: Colors.grey, height: 1),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:ayur_clinic_portal/core/constants.dart';
import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  final TextEditingController searchController;
  final VoidCallback? onSearchPressed;
  final String sortBy;
  final VoidCallback? onSortChanged;

  const SearchBarWidget({
    Key? key,
    required this.searchController,
    this.onSearchPressed,
    this.sortBy = 'Date',
    this.onSortChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // top row
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => Navigator.pop(context),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Icon(
                  Icons.notifications,
                  color: AppColors.iconRed,
                  size: 24.0,
                ),
              ),
            ],
          ),
        ),

        // search + button
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 45,
                  child: TextField(
                    controller: searchController,
                    decoration: InputDecoration(
                      hintText: 'Search for Treatments',
                      prefixIcon: const Icon(
                        Icons.search,
                        color: AppColors.primaryGreen,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(color: Colors.grey),
                      ),
                      filled: true,
                      fillColor: AppColors.backgroundWhite,

                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: 12.0,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              ElevatedButton(
                onPressed: onSearchPressed,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryGreen,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: const Text(
                  "Search",
                  style: TextStyle(color: AppColors.backgroundWhite),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 8.0),

        // sort row
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Sort by: ', style: TextStyle(fontSize: 16.0)),
              DropdownButton<String>(
                value: sortBy,
                items: <String>['Date'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  if (newValue != null && onSortChanged != null) {
                    onSortChanged!();
                  }
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
